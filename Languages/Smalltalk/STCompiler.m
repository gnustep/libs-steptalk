/**
    STCompiler.m
    Bytecode compiler. Generates STExecutableCode from source code.
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StepTalk project.
 
    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.
 
    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.
 
    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#import "STCompiler.h"

#import "STMessage.h"
#import "STLiterals.h"
#import "STBytecodes.h"
#import "STCompiledScript.h"
#import "STCompiledCode.h"
#import "STCompiledMethod.h"
#import "STCompilerUtils.h"
#import "STSourceReader.h"
#import "Externs.h"

#import <StepTalk/STExterns.h>
#import <StepTalk/STObjectReference.h>
#import <StepTalk/STSelector.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSData.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSValue.h>

extern int STCparse(void *context);

@interface STCompiler(STCompilerPrivate)
- (void)compile;
- (void)initializeContext;
- (unsigned)tempVariableIndex:(NSString *)varName;
- (unsigned)externalVariableIndex:(NSString *)varName;

- (void) initializeCompilationContext;

- (NSDictionary *)exceptionInfo;

- (unsigned)addSelectorLiteral:(NSString*)selector;
- (unsigned)addLiteral:literal;

- (void)compileMethod:(STCMethod *)method;
- (STCompiledCode *) compileStatements:(STCStatements *)statements;
- (void)compileStatements:(STCStatements *)statements blockFlag:(BOOL)blockFlag;
- (void)compilePrimary:(STCPrimary *)primary;
- (void)compileExpression:(STCExpression *)expr;

- (void)emitPushReceiverVariable:(unsigned)index;
- (void)emitPushSelf;
- (void)emitPopAndStoreReceiverVariable:(unsigned)index;
- (void)emitReturn;
- (void)emitReturnFromBlock;
- (void)emitPushTemporary:(unsigned)index;
- (void)emitPushLiteral:(unsigned)index;
- (void)emitPushVariable:(unsigned)index;
- (void)emitPopAndStoreTemporary:(unsigned)index;
- (void)emitPopAndStoreVariable:(unsigned)index ;
- (void)emitPopStack;
- (void)emitSendSelector:(unsigned)index argCount:(unsigned)argCount;
- (void)emitBlockCopy;
- (void)emitDuplicateStackTop;
- (void)emitJump:(short)offset;
- (void)emitLongJump:(short)offset;
- (void)emitPushNil;
- (void)emitPushTrue;
- (void)emitPushFalse;

- (void)fixupLongJumpAt:(unsigned)index with:(short)offset;
- (unsigned)currentBytecode;
@end

#define MAX(a,b) (((a)>(b))?(a):(b))

@implementation STCompiler
- init
{
    [super init];
    
    arrayLiteralClass     = [NSMutableArray class];
    stringLiteralClass    = [NSMutableString class];
    /* bytesLiteralClass  = [NSMutableData class]; */
    intNumberLiteralClass  = [NSNumber class];
    realNumberLiteralClass = [NSNumber class];
    symbolLiteralClass    = [STSelector class];        
    characterLiteralClass = [NSString class];
    
    return self;
}
- (void)dealloc
{
    [super dealloc];
}


/* ---------------------------------------------------------------------------
 * Compilation
 * ---------------------------------------------------------------------------
 */

- (void)setEnvironment:(STEnvironment *)env
{
    if(!reader)
    {
        reader = [[STSourceReader alloc] init];
    }
    ASSIGN(environment,env);
}


- (STCompiledScript *)compileString:(NSString *)aString
{
    NSString       *exceptionFmt = @"Syntax error at line %i near '%@', "
                                   @"reason: %@.";
    int             parsRetval = 0;


    NSDebugLLog(@"STCompiler", @"Compile string", aString);

    if(!environment)
    {
        [NSException  raise:STCompilerGenericException
                     format:@"Compilation environment is not initialized"];
        return nil;
    }
    
    reader = [[STSourceReader alloc] initWithString:aString];
    receiverVars = [[NSMutableArray alloc] init];

    STParserContextInit(&context,self,reader);
    
    NS_DURING
    {
        // extern int STCdebug;
        // STCdebug = 1;
        parsRetval = STCparse(&context);
    }
    NS_HANDLER
    {
        if ([[localException name] isEqualToString: STCompilerSyntaxException])
        {
            [NSException  raise:STCompilerSyntaxException
                         format:exceptionFmt,
                                [reader currentLine],
                                [reader tokenString],
                                [localException reason]];
                         
        }
        [localException raise];
    }
    NS_ENDHANDLER

    RELEASE(reader);
    
    return script;
}

- (void)compileMethod:(STCMethod *)method
{
    STCompiledMethod *compiledMethod;
    STCompiledCode   *code;
    STMessage        *messagePattern;
    
    if(!script)
    {
        NSDebugLLog(@"STCompiler",
                    @"Creating script with %i variables",[receiverVars count]);
                    
        script = [[STCompiledScript alloc] initWithVariableCount:
                                                 [receiverVars count]];
    }

    messagePattern = [method messagePattern];
    
    if(!messagePattern)
    {
        messagePattern = [STMessage messageWithSelector:@"_unnamed_method"
                                              arguments:nil];
    }
    
    NSDebugLLog(@"STCompiler", @"Compile method %@", [messagePattern selector]);

    tempVars = [NSMutableArray arrayWithArray:[messagePattern arguments]];

    code = [self compileStatements:[method statements]];
    
    compiledMethod = [STCompiledMethod methodWithCode:code 
                                       messagePattern:messagePattern];
                                       
    [script addMethod:compiledMethod];
}

- (STCompiledCode *)compileStatements:(STCStatements *)statements
{
    STCompiledCode  *compiledCode;
    int              count;
    int              i;
    
    [self initializeCompilationContext];
    
    NSDebugLLog(@"STCompiler", @"compiling statements");

    tempsSize = tempsCount = [tempVars count];

    [self compileStatements:statements blockFlag:NO];

    NSDebugLLog(@"STCompiler", @"  temporaries %i stack %i",
                 tempsSize,stackSize);

#ifdef DEBUG
    count = [literals count];

    NSDebugLLog(@"STCompiler", @"  literals count %i", count);

    for(i=0;i<count;i++)
    {
        NSDebugLLog(@"STCompiler",
                    @"    %2i %@", i, [literals objectAtIndex:i]);
    }

    count = [externVars count];
    NSDebugLLog(@"STCompiler",@"  extern vars count %i",count);
    for(i=0;i<count;i++)
    {
        NSDebugLLog(@"STCompiler",
                    @"    %i %@",i,[externVars objectAtIndex:i]);
    }
#endif
    
    compiledCode = [STCompiledCode alloc];

    [compiledCode initWithBytecodesData:byteCodes
                               literals:literals
                       temporariesCount:tempsSize
                              stackSize:stackSize
                       externReferences:externVars];

    return compiledCode;
}

- (STSourceReader *)sourceReader
{
    return reader;
}

/* ---------------------------------------------------------------------------
 * Variables
 * ---------------------------------------------------------------------------
 */

- (unsigned)tempVariableIndex:(NSString *)varName
{
    return [tempVars indexOfObject:varName];
}

- (void)setReceiverVariables:(NSArray *)array
{
    ASSIGN(receiverVars,array);
}

- (unsigned)receiverVariableIndex:(NSString *)varName
{
    return [receiverVars indexOfObject:varName];
}

- (void)addTempVariable:(NSString *)varName
{
    if([tempVars containsObject:varName])
    {
        [NSException raise:STCompilerGenericException
                    format:@"Multiple definition of temporary variable %@",
                           varName];
    }
    else
    {
        [tempVars addObject:varName];
    }
}

- (unsigned)addSelectorLiteral:(NSString*)selector
{
    return [self addLiteral:selector];
}

- (unsigned)addLiteral:literal
{
    [literals addObject:literal];
    return [literals count] - 1;
}

- (unsigned)externalVariableIndex:(NSString *)varName
{
    STObjectReferenceLiteral *ref;
    unsigned i;
    unsigned count;
    
    count = [externVars count];
    for(i=0;i<count;i++)
    {
        ref = [externVars objectAtIndex:i];
        if([[ref objectName] isEqualToString:varName])
        {
            return i;
        }
    }

    ref = [[STObjectReferenceLiteral alloc] initWithObjectName:varName
                                                      poolName:nil];
    [externVars addObject:ref];

    return count;
}


/* ---------------------------------------------------------------------------
 * Compiler internals (called from parser)
 * ---------------------------------------------------------------------------
 */

- (void) initializeCompilationContext
{
    byteCodes  = [NSMutableData  data];
    externVars = [NSMutableArray array];
    literals   = [NSMutableArray array];
    
    stackSize = stackPos = 0;
    tempsSize = tempsCount = 0;
    bcpos = 0;
}

- (void)compileStatements:(STCStatements *)statements blockFlag:(BOOL)blockFlag
{
    NSEnumerator   *enumerator;
    STBlockLiteral *blockInfo;
    STCExpression  *expr;
    NSArray        *array;
    unsigned        tempsSave;      /* stored count of temporaries */
    unsigned        stackPosSave;   /* stored previous stack value */  
    unsigned        stackSizeSave;
    unsigned        jumpIP;      /* location of jump bytecode for later fixup */
    unsigned        index;
    unsigned        argCount=0;  /* argument count for block context */
        
    NSDebugLLog(@"STCompiler-misc",
                @"  compile statements; blockFlag=%i; tempCount=%i",
                 blockFlag,tempsCount);

    tempsSave = tempsCount; /* store value, so we can cleanup array later */
    
    array = [statements temporaries];

    NSDebugLLog(@"STCompiler-misc",@"  temporaries %@", array);

    if(array)
    {
        argCount = [array count];
        for(index=0;index<argCount;index++)
        {
            [self addTempVariable:[array objectAtIndex:index]];
        }

        tempsCount += argCount;
        tempsSize = MAX(tempsSize,tempsCount);
    }

    if(blockFlag)
    {
        
        blockInfo = [STBlockLiteral alloc];
        [blockInfo initWithArgumentCount:argCount];

        index = [self addLiteral:blockInfo];
        [self emitPushLiteral:index];
        [self emitBlockCopy];

        jumpIP = [self currentBytecode];

        /* block has its own stack */
        stackPosSave = stackPos;
        stackSizeSave = stackSize;
        stackSize = argCount;
        stackPos = argCount;

        [self emitLongJump:0];
        
        for(index = argCount; index > 0; index--)
        {
            [self emitPopAndStoreTemporary:tempsSave + index - 1];
        }
    }
    
    array = [statements expressions];
    
    if(array)
    {
        enumerator = [array objectEnumerator];
        while((expr = [enumerator nextObject]))
        {
            [self compileExpression:expr];
        }
    }

    expr = [statements returnExpression];
    if(expr)
    {
        [self compileExpression:expr];
    }

    if(blockFlag)
    {
        [blockInfo setStackSize:stackSize];
        AUTORELEASE(blockInfo);

        stackSize = stackSizeSave;
        stackPos = stackPosSave;

        [self emitReturnFromBlock];
    }
    else
    {
        [self emitReturn];
    }

    /* fixup jump (if block) */
    if(blockFlag)
    {
        [self fixupLongJumpAt:jumpIP with:[self currentBytecode] - jumpIP];
    }

    /* cleanup unneeded temp variables */
    [tempVars removeObjectsInRange:NSMakeRange(tempsSave,
                                               [tempVars count]-tempsSave)];
    tempsCount = tempsSave;
}

- (void)compilePrimary:(STCPrimary *)primary
{
    id object = [primary object];
    int index;

    NSDebugLLog(@"STCompiler-misc",@"  compile primary");

    switch([primary type])
    {
    case STCVariablePrimaryType:

            if([object isEqualToString:@"YES"]
                || [object isEqualToString:@"true"])
            {
                [self emitPushTrue];
            }
            else if([object isEqualToString:@"NO"]
                || [object isEqualToString:@"false"])
            {
                [self emitPushFalse];
            }
            else if([object isEqualToString:@"nil"])
            {
                [self emitPushNil];
            }
            else
            {
                index = [self tempVariableIndex:object];
                if(index != NSNotFound)
                {
                    [self emitPushTemporary:index];
                    break;
                }
                else if( (index = [self receiverVariableIndex:object])!= NSNotFound)
                {
                    [self emitPushReceiverVariable:index];
                    break;
                }
                else if( [object isEqual:@"self"] )
                {
                    [self emitPushSelf];
                    break;
                }

                index = [self externalVariableIndex:object];
                [self emitPushVariable:index];
            }
            break;

    case STCLiteralPrimaryType:

            index = [self addLiteral:object];
            [self emitPushLiteral:index];
            break;

    case STCBlockPrimaryType:

            [self compileStatements:object blockFlag:YES];
            break;

    case STCExpressionPrimaryType:

            [self compileExpression:object];
            break;

    default:

            [NSException raise:STCompilerInconsistencyException
                        format:@"Unknown primary type %i", 
                               [primary type]];
            break;
    }
}

- (void)compileMessage:(STCMessage *)message
{
    NSEnumerator *enumerator;
    NSArray      *args;
    id            obj;
    int           index;
    
    args = [message arguments];
    if(args && ([args count]>0))
    {
        enumerator = [args objectEnumerator];
        while((obj = [enumerator nextObject]))
        {
            if([obj isKindOfClass:[STCPrimary class]])
                [self compilePrimary:obj];
            else
                [self compileExpression:obj];
        }
    }

    index = [self addSelectorLiteral:[message selector]];
    [self emitSendSelector:index argCount:[args count]];
}

- (void)compileExpression:(STCExpression *)expr
{
    NSEnumerator  *enumerator;
    NSArray       *cascade;
    NSString      *varName;
    NSArray       *array;
    unsigned       count;
    unsigned       index,i;
    id             obj;
    
    NSDebugLLog(@"STCompiler-misc",@"  compile expression");
    
    if([expr isPrimary])
    {
        [self compilePrimary:[expr object]];
    }
    else /* message expression */
    {
        obj = [expr target];

        /* target */
        if([obj isKindOfClass:[STCPrimary class]])
            [self compilePrimary:obj];
        else
            [self compileExpression:obj];
        
        cascade = [expr cascade];
        if(cascade)
        {
            count = [cascade count];
            for(i=0;i<count;i++)
                [self emitDuplicateStackTop];
        }
        
        [self compileMessage:[expr message]];

        /* cascade expression */
        if(cascade)
        {
            enumerator = [cascade objectEnumerator];
            while( (obj = [enumerator nextObject]) )
            {
                /* ignore previous return value */
                [self emitPopStack];
                [self compileMessage:obj];
            }
        }        
    }

    array = [expr assignments];
    count = [array count];
    if(array && count>0)
    {
        for(i = 0; i<count; i++)
        {
            [self emitDuplicateStackTop];
        }
        
        for(i = 0; i<count; i++)
        {
            varName = [array objectAtIndex:i];

            index = [self tempVariableIndex:varName];
            if(index != NSNotFound)
            {
                [self emitPopAndStoreTemporary:index];
                continue;
            }
            else if( (index = [self receiverVariableIndex:varName])!= NSNotFound)
            {
                [self emitPopAndStoreReceiverVariable:index];
                continue;
            }
            if( [varName isEqual:@"self"] )
            {
                NSLog(@"Warning: trying to store to self (ignoring)");
                [self emitPopStack];
                continue;
            }
            
            index = [self externalVariableIndex:varName];
            [self emitPopAndStoreVariable:index];
        }
    }
}


/* ---------------------------------------------------------------------------
 * Literal classes
 * ---------------------------------------------------------------------------
 */

- (Class)stringLiteralClass
{
    return stringLiteralClass;
}
- (Class)arrayLiteralClass
{
    return arrayLiteralClass;
}
- (Class)intNumberLiteralClass
{
    return intNumberLiteralClass;
}
- (Class)realNumberLiteralClass
{
    return realNumberLiteralClass;
}
- (Class)symbolLiteralClass
{
    return symbolLiteralClass;
}
- (Class)characterLiteralClass
{
    return characterLiteralClass;
}
- (void)setStringLiteralClass:(Class)aClass
{
    stringLiteralClass = aClass;
}
- (void)setArrayLiteralClass:(Class)aClass
{
    arrayLiteralClass = aClass;
}
- (void)setIntNumberLiteralClass:(Class)aClass
{
    intNumberLiteralClass = aClass;
}
- (void)setRealNumberLiteralClass:(Class)aClass
{
    realNumberLiteralClass = aClass;
}
- (void)setSymbolLiteralClass:(Class)aClass
{
    symbolLiteralClass = aClass;
}
- (void)setCharacterLiteralClass:(Class)aClass
{
    characterLiteralClass = aClass;
}

- (id)createIntNumberLiteralFrom:(NSString *)aString
{
    return [intNumberLiteralClass intNumberFromString:aString];
}
- (id)createRealNumberLiteralFrom:(NSString *)aString
{
    return [realNumberLiteralClass realNumberFromString:aString];
}
- (id)createSymbolLiteralFrom:(NSString *)aString
{
    return [symbolLiteralClass symbolFromString:aString];
}
- (id)createStringLiteralFrom:(NSString *)aString
{
    return [stringLiteralClass stringFromString:aString];
}
- (id)createCharacterLiteralFrom:(NSString *)aString
{
    return [characterLiteralClass characterFromString:aString];
}
- (id)createArrayLiteralFrom:(NSArray *)anArray
{
   return [arrayLiteralClass arrayFromArray:anArray];
}

- (NSDictionary *)exceptionInfo
{
    NSDictionary *dict;
    
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
                            [NSNumber numberWithInt:[reader currentLine]], 
                                @"LineNumber", 
                            [reader tokenString], 
                                @"Token",      
                            [NSValue valueWithRange:[reader tokenRange]],
                                @"TokenRange",
                            nil,nil];
    return nil;
}
/* ---------------------------------------------------------------------------
 * Emit bytecodes
 * ---------------------------------------------------------------------------
 */
#define STDebugEmit(bc) \
                NSDebugLLog(@"STCompiler-emit", \
                            @"#%04x %@", \
                            (bc).pointer, \
                            STDissasembleBytecode(bc))

#define STDebugEmitWith(bc,object) \
                NSDebugLLog(@"STCompiler-emit", \
                            @"#%04x %@ (%@)", \
                            (bc).pointer, \
                            STDissasembleBytecode(bc), \
                            (object))

#define EMIT_SINGLE(bytecode) \
            do { \
                char bc = bytecode; \
                [byteCodes appendBytes:&bc length:1];\
                bcpos++;\
            } while(0)
#define EMIT_DOUBLE(bc1,bc2) \
            do { \
                char bc[2] = {bc1,bc2}; \
                [byteCodes appendBytes:bc length:2];\
                bcpos+=2;\
            } while(0)
#define EMIT_TRIPPLE(bc1,bc2,bc3) \
            do { \
                char bc[3] = {bc1,bc2,bc3}; \
                [byteCodes appendBytes:bc length:3];\
                bcpos+=3;\
            } while(0)

#define STACK_PUSH \
            do {\
                stackPos++; \
                stackSize = MAX(stackPos,stackSize);\
                /* NSDebugLLog(@"STCompiler",@"stack pointer %i/%i",stackPos,stackSize); */\
            } while(0)
#define STACK_PUSH_COUNT(count) \
            do {\
                stackPos+=count; \
                stackSize = MAX(stackPos,stackSize);\
                /* NSDebugLLog(@"STCompiler",@"stack pointer %i/%i",stackPos,stackSize);*/ \
            } while(0)

#define STACK_POP \
            stackPos--; \
            /* NSDebugLLog(@"STCompiler",@"stack pointer %i/%i",stackPos,stackSize) */;
#define STACK_POP_COUNT(count) \
            stackPos-=count; \
            /* NSDebugLLog(@"STCompiler",@"stack pointer %i/%i",stackPos,stackSize) */;
            
- (void)emitPushSelf
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x push self", bcpos);
                
    EMIT_SINGLE(STPushReceiverBytecode);
    STACK_PUSH;
}
- (void)emitPushNil
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x push nil", bcpos);
                
    EMIT_SINGLE(STPushNilBytecode);
    STACK_PUSH;
}
- (void)emitPushTrue
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x push true", bcpos);
                
    EMIT_SINGLE(STPushTrueBytecode);
    STACK_PUSH;
}
- (void)emitPushFalse
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x push false", bcpos);
                
    EMIT_SINGLE(STPushFalseBytecode);
    STACK_PUSH;
}
- (void)emitPushReceiverVariable:(unsigned)index
{
                
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x push receiver variable %i (%@)",
                bcpos,index,[receiverVars objectAtIndex:index]);

    EMIT_DOUBLE(STPushRecVarBytecode,index);
    STACK_PUSH;
}

- (void)emitPushTemporary:(unsigned)index
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x push temporary %i (%@)",
                bcpos,index,[tempVars objectAtIndex:index]);
                
    EMIT_DOUBLE(STPushTemporaryBytecode,index);
    STACK_PUSH;
    
}

- (void)emitPushLiteral:(unsigned)index
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x push literal %i (%@)",
                bcpos,index,[literals objectAtIndex:index]);
                
    EMIT_DOUBLE(STPushLiteralBytecode,index);
    STACK_PUSH;
    stackSize++;
}
- (void)emitPushVariable:(unsigned)index
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x push external variable %i (%@)",
                bcpos,index,[externVars objectAtIndex:index]);
                
    EMIT_DOUBLE(STPushExternBytecode,index);
    STACK_PUSH;
}
- (void)emitPopAndStoreTemporary:(unsigned)index
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x pop and store temp %i (%@)",
                bcpos,index,[tempVars objectAtIndex:index]);
                
    EMIT_DOUBLE(STPopAndStoreTempBytecode,index);
    STACK_POP;
}
- (void)emitPopAndStoreVariable:(unsigned)index
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x pop and store ext variable %i (%@)",
                bcpos,index,[externVars objectAtIndex:index]);
                
    EMIT_DOUBLE(STPopAndStoreExternBytecode,index);
    STACK_POP;
}
- (void)emitPopAndStoreReceiverVariable:(unsigned)index
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x pop and store rec variable %i (%@)",
                bcpos,index,[receiverVars objectAtIndex:index]);
                
    EMIT_DOUBLE(STPopAndStoreRecVarBytecode,index);
    STACK_POP;
}

- (void)emitSendSelector:(unsigned)index argCount:(unsigned)argCount
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x send selector %i (%@) with %i args",
                bcpos,index,[literals objectAtIndex:index],argCount);
            
    EMIT_TRIPPLE(STSendSelectorBytecode,index,argCount);
    STACK_PUSH_COUNT(argCount);
    STACK_POP_COUNT(argCount);
}
- (void)emitDuplicateStackTop
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x dup",bcpos);
                
    EMIT_SINGLE(STDupBytecode);
    STACK_PUSH;
}
- (void)emitPopStack
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x pop stack",bcpos);
                
    EMIT_SINGLE(STPopStackBytecode);
    STACK_POP;
}
- (void)emitReturn
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x return",bcpos);
                
    EMIT_SINGLE(STReturnBytecode);
}
- (void)emitReturnFromBlock
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x return from block",bcpos);
                
    EMIT_SINGLE(STReturnBlockBytecode);
}
- (void)emitBlockCopy
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x create block",bcpos);
                
    EMIT_SINGLE(STBlockCopyBytecode);
}
- (void)emitLongJump:(short)offset
{
    NSDebugLLog(@"STCompiler-emit",
                @"#%04x long jump %i (0x%04x)",bcpos,offset,bcpos+offset);
                
    EMIT_TRIPPLE(STLongJumpBytecode,STLongJumpFirstByte(offset),
                                    STLongJumpSecondByte(offset));
}
- (void)fixupLongJumpAt:(unsigned)index with:(short)offset
{
    char bytes[2] = {STLongJumpFirstByte(offset),STLongJumpSecondByte(offset)};

    NSDebugLLog(@"STCompiler-emit",
                @"# fixup long jump at 0x%04x to 0x%04x",index, index + offset);

    [byteCodes replaceBytesInRange:NSMakeRange(index+1,2) withBytes:bytes];

}
- (unsigned)currentBytecode
{
    return [byteCodes length];
}

@end
