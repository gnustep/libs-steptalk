/**
    STBytecodeInterpreter.m
 
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

#import "STBytecodeInterpreter.h"

#import "Externs.h"
#import "STBlock.h"
#import "STBlockContext.h"
#import "STLiterals.h"
#import "STBytecodes.h"
#import "STCompiledMethod.h"
#import "STExecutionContext.h"
#import "STMethodContext.h"
#import "STMessage.h"
#import "STStack.h"

#import <StepTalk/STEnvironment.h>
#import <StepTalk/STExterns.h>
#import <StepTalk/STFunctions.h>
#import <StepTalk/NSInvocation+additions.h>
#import <StepTalk/STScripting.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSData.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSInvocation.h>
#import <Foundation/NSValue.h>

#import  <objc/encoding.h>

@interface STBytecodeInterpreter(STPrivateMethods)
- (void)fetchContextRegisters;

- (short)fetchBytecode;
- (BOOL)dispatchBytecode:(STBytecode)bytecode;
- (void)invalidBytecode:(STBytecode)bytecode;

- (void)setInstructionPointer:(unsigned)newIP;
- (unsigned) instructionPointer;

- temporaryAtIndex:(unsigned)index;
- externAtIndex:(unsigned)index;
- literalAtIndex:(unsigned)index;
- (void)setTemporary:anObject atIndex:(unsigned)index;
- (void)registerObject:anObject withName:(NSString *)name;

- (void)sendSelectorAtIndex:(unsigned)index withArgs:(unsigned)argCount;

- (void)resolveExternReferencesFrom:(NSArray *)array;

- (void)setArgumentsFromArray:(NSArray *)args;
- (void)prepareHomeContextWithMethod:(STCompiledMethod *)aMethod;
- (id)  interpretInContext:(STExecutionContext *)context;
- (void)setNewActiveContext:(STExecutionContext *)newContext;
- (void)fetchContextRegisters;
- (void)blockCopyWithInfo:(STBlockLiteral *)info;
- (id)  valueOfBlockContext:(STBlockContext *)block;
- (void)blockReturnValue:(id)value;
- (void)returnValue:(id)value;
- (void)returnToContext:(STExecutionContext *)context;
@end

static  STBytecodeInterpreter *sharedInterpreter = nil;

static  SEL sendSelectorAtIndexSel;
static  IMP sendSelectorAtIndexImp;
static  SEL dispatchBytecodeSel;
static  IMP dispatchBytecodeImp;
static  SEL pushSel;
static  IMP pushImp;
static  SEL popSel;
static  id (*popImp)(id obj, SEL sel);

@implementation STBytecodeInterpreter
+ (void)initialize
{
    sendSelectorAtIndexSel = @selector(sendSelectorAtIndex:withArgCount:);
    pushSel = @selector(push:);
    popSel = @selector(pop);
    
    sendSelectorAtIndexImp = [STBytecodeInterpreter instanceMethodForSelector:sendSelectorAtIndexSel];
    pushImp = [STStack instanceMethodForSelector:pushSel];
    popImp = [STStack instanceMethodForSelector:popSel];
}

+ (STBytecodeInterpreter *)sharedInterpreter
{
    if(!sharedInterpreter)
    {
        sharedInterpreter = [[self alloc] init];
    }
    return sharedInterpreter;
}

- (void)setEnvironment:(STEnvironment *)env
{
    ASSIGN(environment,env);
}

- executeCompiledMethod:(STCompiledMethod *)aScript
{
    return [self executeCompiledMethod:aScript withArguments:nil];
}

- executeCompiledMethod:(STCompiledMethod *)method 
          withArguments:(NSArray *)args
{
    STMethodContext *newContext;
    id retval;
    
    if(!environment)
    {
        [NSException  raise:STInterpreterGenericException
                     format:@"No execution environment set"];
        return nil;
    }
    
    NSDebugLLog(@"STBytecodeInterpreter",@"Executing method %@ with %i args", 
                [method selector],[args count]);

    if(!method)
    {
        return nil;
    }
    
    if([args count] != [method argumentCount])
    {
        [NSException  raise:STInterpreterGenericException
                     format:@"Invalid argument count %i(%i) for method %@ ",
                            [args count],[method argumentCount], [method selector]];
    }
    
    newContext = [STMethodContext methodContextWithMethod:method
                                              environment:environment];

    [newContext setArgumentsFromArray:args];

    retval = [self interpretInContext:newContext];

    return retval;
}

- executeCompiledCode:(STCompiledCode *)code
{
    STCompiledMethod *method;
    STMethodContext  *newContext;
    STMessage        *pattern;
    id                retval;

    pattern = [STMessage messageWithSelector:@"_anonymous_code"    
                                   arguments:nil];

    method = [STCompiledMethod  methodWithCode:code
                                messagePattern:pattern];

    return [self executeCompiledMethod:method  withArguments:nil];
}


/* ---------------------------------------------------------------------------
 * Interpret
 * ---------------------------------------------------------------------------
 */
- (id)interpretInContext:(STExecutionContext *)newContext
{
    STBytecode bytecode;
    id    retval;
    
    entry++;
    NSDebugLLog(@"STBytecodeInterpreter", @"Interpreter entry %i", entry);

    [newContext setParrentContext:activeContext];

    [self setNewActiveContext:newContext];
    
    NSDebugLLog(@"STBytecodeInterpreter", @"IP %i %x", instructionPointer, [bytecodes length]);

    if(!bytecodes)
    {
        [NSException raise:STInterpreterGenericException
                    format:@"No bytecodes"];
        return nil;
    }

    stopRequested = NO;
    
    do
    {
        bytecode = [bytecodes fetchNextBytecodeAtPointer:&instructionPointer];

        if(stopRequested)
        {
            break;
        }

    } while( [self dispatchBytecode:bytecode] );

    if(!stopRequested)
    {
        retval = [stack pop];
    }
    else
    {
        NSDebugLLog(@"STBytecode interpreter",@"Stop requested");
        
        retval = nil;
    }

    NSDebugLLog(@"STBytecodeInterpreter",
                @"Returning '%@' from interpreter (entry %i)",retval,entry);

    entry --;
    return retval;
}

- (void)halt
{
    NSDebugLLog(@"STBytecode interpreter",@"Halt!");
    stopRequested = YES;
}
/* ---------------------------------------------------------------------------
 * Context manipulation
 * ---------------------------------------------------------------------------
 */

- (void)setNewActiveContext:(STExecutionContext *)newContext
{
    
    NSDebugLLog(@"STExecutionContext", @"Switch from context %@ to context %@",
                activeContext, newContext);

    [activeContext setInstructionPointer:instructionPointer];

    if( [newContext isInvalid])
    {
        [NSException raise:STInterpreterGenericException
                    format:@"Invalid context"];
    }
    
    ASSIGN(activeContext,newContext);

    if(activeContext)
    {
        stack = [activeContext stack];

        if(!stack)
        {
            [NSException raise:STInternalInconsistencyException
                        format:@"No execution stack"];
        }

        instructionPointer = [activeContext instructionPointer];

        bytecodes = [activeContext bytecodes];
    }
    else
    {
        instructionPointer = 0;
        bytecodes = nil;
    }
}

/* ---------------------------------------------------------------------------
 * Return
 * ---------------------------------------------------------------------------
 */
 
- (void)returnValue:(id)value
{

    NSDebugLLog(@"STExecutionContext",
                @"%@ return value '%@' from method",
                activeContext,value);

    [self returnToContext:[activeContext parrentContext]];
    [stack push:value];
}

- (void)returnToContext:(STExecutionContext *)context
{
    NSDebugLLog(@"STExecutionContext",
                @"%@ return to context %@",activeContext,context);


    [activeContext invalidate];

    [self setNewActiveContext:context];
}

- (unsigned) instructionPointer
{
    return instructionPointer;
}

/* ---------------------------------------------------------------------------
    Variables manipulation
 * ---------------------------------------------------------------------------
 */
- (id)temporaryAtIndex:(unsigned)index
{
    id object = [activeContext temporaryAtIndex:index];
    return object;
}

- (id)literalAtIndex:(unsigned)index
{
    return [activeContext literalObjectAtIndex:index];
}

- (id)externAtIndex:(unsigned)index
{
    return [activeContext externAtIndex:index];
}


- (void)setReceiver:(id)anObject
{
    NSDebugLLog(@"STBytecodeInterpreter",
                @"set receiver '%@'",anObject);
    ASSIGN(receiver,anObject);
}

/* FIXME: ---------------------------------------------------------------------
 * Block manipulation
 * ---------------------------------------------------------------------------
 */
- (void)blockCopyWithInfo:(STBlockLiteral *)info
{
    unsigned ptr;
    STBlock        *block;
    
    ptr = instructionPointer + STLongJumpBytecodeSize;

    NSDebugLLog(@"STExecutionContext",
                @"%@ create block",activeContext);

    NSDebugLLog(@"STExecutionContext",
                @"%@   argc:%i stack:%i ip:0x%04x",
                 activeContext, 
                 [info argumentCount],
                 [info stackSize],
                 ptr);


    block = [STBlock alloc];
    
    [block initWithInterpreter:self
                   homeContext:[activeContext homeContext]
                     initialIP:ptr
                          info:info];
  
    [stack push:block];
}

- (id)valueOfBlockContext:(STBlockContext *)block
{
    id retval;

    NSDebugLLog(@"STBytecodeInterpreter",@"evaluating block context");

    NSDebugLLog(@"STExecutionContext",
                @"%@ evaluate block %@",
                activeContext, block);

    [block setParrentContext:activeContext];
    [block initializeIntstructionPointer];

    retval = [self interpretInContext:block];

    NSDebugLLog(@"STBytecodeInterpreter",
                @"Returning '%@' from block",retval);

    return retval;
}

- (void)forceReturnFromBlockContext
{
    NSDebugLLog(@"STBytecodeInterpreter",
                @"Forced return from block");
    [self blockReturnValue:[stack pop]];
}

- (void)blockReturnValue:(id)value
{
    NSDebugLLog(@"STExecutionContext",
                @"%@ block return value '%@' to parrent",
                activeContext,value);
                
    [self returnToContext:[activeContext parrentContext]];
    [stack push:value];
}



/* ---------------------------------------------------------------------------
    send selector (see also STEnvironment class)
 * ---------------------------------------------------------------------------
 */

- (void)sendSelectorAtIndex:(unsigned)selIndex withArgCount:(unsigned)argCount
{
    NSString          *selector;
    NSInvocation      *invocation;
    id                 target;
    int                index;
    id                 object;

    NSDebugLLog(@"STSending",
                @"send selector '%@' with %i args'",
                [self literalAtIndex:selIndex],argCount);
                
    target = [stack valueFromTop:argCount];
    
    /* FIXME */
    if(!target)
    {
        target = STNil;
    }
    
    selector = [self literalAtIndex:selIndex];

    NSDebugLLog(@"STSending",
               @"  %s receiver:%@ (%@) selector:%@",
               [receiver isProxy] ? "proxy for" : "",
               target,
               NSStringFromClass([target class]),
               selector);

    selector = [environment translateSelector:selector forReceiver:target];

    invocation = [NSInvocation invocationWithTarget:target
                                       selectorName:selector];
                                       
    if(!invocation)
    {
        [NSException raise:STInternalInconsistencyException
                     format:@"Should not send selector '%@' to "
                            @"receiver of type %@ (could not create invocation)",
                            selector,[target className]];
        return;
    }
    

    for(index = argCount + 1; index > 1; index--)
    {

        object = [stack pop];
                   
        if(object == STNil)
        {
            object = nil;
        }
        
        NSDebugLLog(@"STSending",
                    @"    argument %2i: '%@'",index - 2, object);

        [invocation setArgumentAsObject:object atIndex:index];
    }

    /* ---------------------------- 
     * invoke it!
     * ----------------------------
     */

    NSDebugLLog(@"STSending",@"  invoking... (%@)",invocation);
    [invocation invoke];

    /* FIXME */
    if(!stopRequested)
    {
        /* pop the receiver from the stack */
        [stack pop];
        [stack push: [invocation returnValueAsObject]];
    }
}


/* ---------------------------------------------------------------------------
    Bytecode manipulation
 * ---------------------------------------------------------------------------
 */
#define STDebugBytecode(bc) \
                NSDebugLLog(@"STBytecodeInterpreter", \
                            @"#%04x %@", \
                            (bc).pointer, \
                            STDissasembleBytecode(bc))

#define STDebugBytecodeWith(bc,object) \
                NSDebugLLog(@"STBytecodeInterpreter", \
                            @"#%04x %@ (%@)", \
                            (bc).pointer, \
                            STDissasembleBytecode(bc), \
                            (object))

#define STPush(s, v) (*pushImp)(s, pushSel, v)
// #define STPush(s, v) [s push:v]           

#define STPop(s) (*popImp)(s, popSel)
// #define STPop(s) [s pop]           

- (BOOL)dispatchBytecode:(STBytecode)bytecode
{
    id object;
    
    switch(bytecode.code)
    {
    case STLongJumpBytecode:
                {
                    int offset = STLongJumpOffset(bytecode.arg1,bytecode.arg2)
                                    - STLongJumpBytecodeSize;

                    STDebugBytecode(bytecode);
                    instructionPointer+=offset;
                    break;
                }

    case STPushReceiverBytecode:
                STDebugBytecodeWith(bytecode,receiver);
                STPush(stack, receiver);
                break;

    case STPushNilBytecode:
                STDebugBytecodeWith(bytecode,receiver);
                STPush(stack,nil);
                break;

    case STPushTrueBytecode:
                STDebugBytecodeWith(bytecode,receiver);
                STPush(stack,[NSNumber numberWithInt:YES]);
                break;

    case STPushFalseBytecode:
                STDebugBytecodeWith(bytecode,receiver);
                STPush(stack,[NSNumber numberWithInt:NO]);
                break;

    case STPushRecVarBytecode:
                object = [receiver instanceVariableAtIndex:bytecode.arg1];
                STDebugBytecodeWith(bytecode,object);
                STPush(stack,object);
                break;

    case STPushExternBytecode:
                object = [self externAtIndex:bytecode.arg1];
                STDebugBytecodeWith(bytecode,object);
                STPush(stack,object);
                break;

    case STPushTemporaryBytecode:
                object = [self temporaryAtIndex:bytecode.arg1];
                STPush(stack,object);
                STDebugBytecodeWith(bytecode,object);
                break;

    case STPushLiteralBytecode:
                object = [self literalAtIndex:bytecode.arg1];
                STDebugBytecodeWith(bytecode,object);
                STPush(stack,object);
                break;

    case STPopAndStoreRecVarBytecode:
                STDebugBytecode(bytecode);
                [receiver setInstanceVariable:STPop(stack) 
                                      atIndex:bytecode.arg1];
                break;

    case STPopAndStoreExternBytecode: 
                STDebugBytecode(bytecode);
                [activeContext setExtern:STPop(stack) atIndex:bytecode.arg1];
                break;

    case STPopAndStoreTempBytecode:
                STDebugBytecode(bytecode);
                [activeContext setTemporary:STPop(stack) atIndex:bytecode.arg1];
                break;

    case STSendSelectorBytecode:
                STDebugBytecodeWith(bytecode,
                                    [self literalAtIndex:bytecode.arg1]);

                (*sendSelectorAtIndexImp)(self, sendSelectorAtIndexSel,
                                          bytecode.arg1,bytecode.arg2);
/*
                [self sendSelectorAtIndex:bytecode.arg1
                             withArgCount:bytecode.arg2];
*/                break;

    case STSuperSendSelectorBytecode: /* FIXME: not implemented */
                [self invalidBytecode:bytecode];
                break;

    case STDupBytecode:
                STDebugBytecode(bytecode);
                [stack duplicateTop];
                break;


    case STPopStackBytecode:
                STDebugBytecode(bytecode);
                [stack pop];
                break;

    case STReturnBytecode:
                STDebugBytecode(bytecode);
                [self returnValue:[stack pop]];
                return NO;

    case STReturnBlockBytecode:
                STDebugBytecode(bytecode);
                [self blockReturnValue:[stack pop]];
                return NO;

    case STBlockCopyBytecode: 
                STDebugBytecode(bytecode);
                [self blockCopyWithInfo:[stack pop]];
                break;

    default:
                [self invalidBytecode:bytecode];
                break;
    };

    return YES;
}

- (void)invalidBytecode:(STBytecode)bytecode
{
    [NSException raise:STInternalInconsistencyException
                 format:@"invalid bytecode (0x%02x) at 0x%06x",
                         bytecode.code,bytecode.pointer];
}
@end


