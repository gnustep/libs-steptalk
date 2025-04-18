/**
    STBytecodes.m
 
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

#import "STBytecodes.h"

#import <StepTalk/STExterns.h>

#import "Externs.h"

#import <Foundation/NSArray.h>
#import <Foundation/NSCoder.h>
#import <Foundation/NSData.h>
#import <Foundation/NSException.h>


NSArray *STBytecodeNames;

static void initNamesArray(void)
{
    NSString *invalid = @"invalid bytecode";
    NSMutableArray *array;
    NSInteger i;

    array = [NSMutableArray arrayWithCapacity:256];

    for(i=0;i<256;i++)
    {
        [array insertObject:invalid atIndex:i];
    }

    [array replaceObjectAtIndex:STPushReceiverBytecode 
                     withObject:@"push self"];
    [array replaceObjectAtIndex:STPushNilBytecode 
                     withObject:@"push nil"];
    [array replaceObjectAtIndex:STPushTrueBytecode 
                     withObject:@"push true"];
    [array replaceObjectAtIndex:STPushFalseBytecode 
                     withObject:@"push false"];
    [array replaceObjectAtIndex:STPushRecVarBytecode 
                     withObject:@"push ivar"];
    [array replaceObjectAtIndex:STPushExternBytecode 
                     withObject:@"push extern"];
    [array replaceObjectAtIndex:STPushTemporaryBytecode 
                     withObject:@"push temporary"];
    [array replaceObjectAtIndex:STPushLiteralBytecode 
                     withObject:@"push literal"];
    [array replaceObjectAtIndex:STPopAndStoreRecVarBytecode
                     withObject:@"pop and store ivar"];
    [array replaceObjectAtIndex:STPopAndStoreExternBytecode
                     withObject:@"pop and store extern"];
    [array replaceObjectAtIndex:STPopAndStoreTempBytecode
                     withObject:@"pop and store temp"];
    [array replaceObjectAtIndex:STSendSelectorBytecode
                     withObject:@"send selector"];
    [array replaceObjectAtIndex:STSuperSendSelectorBytecode
                     withObject:@"send super selector"];
    [array replaceObjectAtIndex:STBlockCopyBytecode 
                     withObject:@"block copy"];
    [array replaceObjectAtIndex:STDupBytecode 
                     withObject:@"dup"];
    [array replaceObjectAtIndex:STPopStackBytecode 
                     withObject:@"pop"];
    [array replaceObjectAtIndex:STReturnBytecode 
                     withObject:@"return"];
    [array replaceObjectAtIndex:STReturnBlockBytecode 
                     withObject:@"return from block"];
    [array replaceObjectAtIndex:STBreakpointBytecode 
                     withObject:@"breakpoint"];
    [array replaceObjectAtIndex:STLongJumpBytecode 
                     withObject:@"long jump"];
    [array replaceObjectAtIndex:STStoreRecVarBytecode
                     withObject:@"store ivar"];
    [array replaceObjectAtIndex:STStoreExternBytecode
                     withObject:@"store extern"];
    [array replaceObjectAtIndex:STStoreTempBytecode
                     withObject:@"store temp"];

    STBytecodeNames = [[NSArray alloc] initWithArray:array];
}


NSString *STBytecodeName(unsigned short code)
{
    static NSString *invalid = @"invalid bytecode";
    NSString        *name;

    if( code > [STBytecodeNames count] )
    {
        return invalid;
    }
    
    name = [STBytecodeNames objectAtIndex:code];
    
    if(name == nil)
    {
        return invalid;
    }

    return name;
}

NSString *STDissasembleBytecode(STBytecode bytecode)
{
    NSString *str;
    
    str = STBytecodeName(bytecode.code);
    
    switch(bytecode.code)
    {
    case STLongJumpBytecode:
                {
                    //NSInteger offset =
                    //    STLongJumpOffset(bytecode.arg1,bytecode.arg2);
                    NSInteger offset = bytecode.arg1;
                    return [NSString  stringWithFormat:@"%@ %li (0x%06lx)",
                                      str, (long)offset,
                                      (unsigned long)(bytecode.pointer+offset)];
                }
    case STSendSelectorBytecode:
    case STSuperSendSelectorBytecode:
                return [NSString  stringWithFormat:@"%@ %i with %i args",
                                  str, bytecode.arg1, bytecode.arg2];
    case STPushRecVarBytecode:
    case STPushExternBytecode:
    case STPushTemporaryBytecode:
    case STPushLiteralBytecode:
    case STPopAndStoreRecVarBytecode:
    case STPopAndStoreExternBytecode:
    case STPopAndStoreTempBytecode:
    case STStoreRecVarBytecode:
    case STStoreExternBytecode:
    case STStoreTempBytecode:
                return [NSString  stringWithFormat:@"%@ %i",
                                  str, bytecode.arg1];
    case STPushReceiverBytecode:
    case STPushNilBytecode:
    case STPushTrueBytecode:
    case STPushFalseBytecode:
    case STBlockCopyBytecode:
    case STDupBytecode:
    case STPopStackBytecode:
    case STReturnBytecode:
    case STReturnBlockBytecode:
    case STBreakpointBytecode:
                return str;
    default:
                return [NSString stringWithFormat:@"invalid (0x%02x)",
                                                  bytecode.code];

    }
}


@implementation STBytecodes
+ (void)initialize
{
    initNamesArray();
}
/*
- (id) initWithBytesNoCopy: (void*)someBytes
		    length: (NSUInteger)length
		  fromZone: (NSZone*)zone
{
    if ((self = [super init]) != nil)
    {
        bytes = [[NSData alloc] initWithBytesNoCopy:someBytes 
                                             length:length 
                                           fromZone:zone];
    }
    return self;
}
*/

/* FIXME: rewrite this class - it is a leftover */

- (id) initWithData: (NSData *)data
{
    if ((self = [super init]) != nil)
    {
        bytes = RETAIN(data);
    }
    return self;
}

- (NSData *)data
{
    return bytes;
}
- (void)dealloc
{
    RELEASE(bytes);
    [super dealloc];
}

- (const void *)bytes
{
    return [bytes bytes];
}
- (NSUInteger) length
{
    return [bytes length];
}

- (NSString *)description
{
    return [bytes description];
}

- (STBytecode)fetchNextBytecodeAtPointer:(NSUInteger *)pointer
{
    STBytecode  bytecode;
    const unsigned char *bytesPtr = (const unsigned char *)[bytes bytes];
    NSUInteger  length = [self length];
    
    if(*pointer < length)
    {
        bytecode.pointer = *pointer;
        bytecode.code = bytesPtr[(*pointer)++];

        switch(bytecode.code)
        {
        case STSendSelectorBytecode:
        case STSuperSendSelectorBytecode:
                    if(*pointer + 2 >= length)
                    {
                        break;
                    }
/*
                    bytecode.arg1 = bytesPtr[(*pointer)++];
                    bytecode.arg2 = bytesPtr[(*pointer)++];
*/
                    bytecode.arg1 = (bytesPtr[(*pointer)++])<<8;
                    bytecode.arg1 |= bytesPtr[(*pointer)++];
                    bytecode.arg2 = (bytesPtr[(*pointer)++])<<8;
                    bytecode.arg2 |= bytesPtr[(*pointer)++];
                    return bytecode;
        case STLongJumpBytecode:
        case STPushRecVarBytecode:
        case STPushExternBytecode:
        case STPushTemporaryBytecode:
        case STPushLiteralBytecode:
        case STPopAndStoreRecVarBytecode:
        case STPopAndStoreExternBytecode:
        case STPopAndStoreTempBytecode:
        case STStoreRecVarBytecode:
        case STStoreExternBytecode:
        case STStoreTempBytecode:
                    if(*pointer + 1 >= length)
                    {
                        break;
                    }
/*
                    bytecode.arg1 = bytesPtr[(*pointer)++];
*/
                    bytecode.arg1 = (bytesPtr[(*pointer)++])<<8;
                    bytecode.arg1 |= bytesPtr[(*pointer)++];
                    bytecode.arg2 = 0;
                    return bytecode;
        case STPushReceiverBytecode:
        case STPushNilBytecode:
        case STPushTrueBytecode:
        case STPushFalseBytecode:
        case STBlockCopyBytecode:
        case STDupBytecode:
        case STPopStackBytecode:
        case STReturnBytecode:
        case STReturnBlockBytecode:
        case STBreakpointBytecode:
                    bytecode.arg1 = 0;
                    bytecode.arg2 = 0;
                    return bytecode;
        default:
                    [NSException raise:STInternalInconsistencyException
                                format:@"Invalid bytecode 0x%02x at 0x%06lx",
                                       bytecode.code,(unsigned long)(*pointer-1)];

        }
    }

    [NSException raise:STInternalInconsistencyException
                format:@"Instruction pointer 0x%06lx out of bounds (0x%06lx)",
                       (unsigned long)*pointer,(unsigned long)length];
    return bytecode;
}
- (void)encodeWithCoder:(NSCoder *)coder
{
    // [super encodeWithCoder: coder];

    [coder encodeObject:bytes];
}

- initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init] /*[super initWithCoder: decoder]*/) != nil)
    {
        [decoder decodeValueOfObjCType: @encode(id) at: &bytes];
    }
    return self;
}

@end

