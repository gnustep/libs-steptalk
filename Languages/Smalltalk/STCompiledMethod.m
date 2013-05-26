/**
    STCompiledMethod.m
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
 
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

#import "STCompiledMethod.h"

#import "STMessage.h"
#import "STBytecodes.h"

#import <StepTalk/STMethod.h>
#import <StepTalk/STScripting.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSCoder.h>
#import <Foundation/NSData.h>
#import <Foundation/NSString.h>
#import <Foundation/NSException.h>

@implementation STCompiledMethod
+ methodWithCode:(STCompiledCode *)code messagePattern:(STMessage *)pattern
{
    STCompiledMethod *method;
    
    method =
        [[STCompiledMethod alloc] initWithSelector:[pattern selector]
                                     argumentCount:[[pattern arguments] count]
                                     bytecodesData:[[code bytecodes] data]
                                          literals:[code literals]
                                  temporariesCount:[code temporariesCount]
                                         stackSize:[code stackSize]
                                   namedReferences:[code namedReferences]];
               

    return AUTORELEASE(method);
}

-   initWithSelector:(NSString *)sel
       argumentCount:(NSUInteger)aCount
       bytecodesData:(NSData *)data
            literals:(NSArray *)anArray
    temporariesCount:(NSUInteger)tCount
           stackSize:(NSUInteger)size
     namedReferences:(NSMutableArray *)refs;
{
    if ((self = [super initWithBytecodesData:data
                                    literals:anArray
                            temporariesCount:tCount
                                   stackSize:size
                             namedReferences:refs]) != nil)
    {
        NSAssert(aCount < SHRT_MAX, @"too many arguments (>= max(short))");
        selector = RETAIN(sel);
        argCount = aCount;
    }
    return self;
}
- (void)dealloc
{
    RELEASE(selector);
    [super dealloc];
}
- (NSString *)selector
{
    return selector;
}

- (NSUInteger)argumentCount
{
    return argCount;
}

- (NSString*)description
{
    NSMutableString *desc = [NSMutableString string];

    [desc appendFormat:@"%@:\n"
                       @"Selector = %@\n"
                       @"Literals Count = %lu\n"
                       @"Literals = %@\n"
                       @"External References = %@\n"
                       @"Temporaries Count = %u\n"
                       @"Stack Size = %u\n"
                       @"Byte Codes = %@\n",
                       [self className],
                       selector,
                       (unsigned long)[literals count],
                       [literals description],
                       [namedRefs description],
                       tempCount,
                       stackSize,
                       [bytecodes description]];

    return desc;
}

/* Script object method info */
- (NSString *)methodName
{
    return selector;
}
- (NSString *)languageName
{
    return @"Smalltalk";
}
- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder: coder];

    [coder encodeObject:selector];
    [coder encodeValueOfObjCType: @encode(short) at: &argCount];
}

- initWithCoder:(NSCoder *)decoder
{
    if ((self = [super initWithCoder: decoder]) != nil)
    {
        [decoder decodeValueOfObjCType: @encode(id) at: &selector];
        [decoder decodeValueOfObjCType: @encode(short) at: &argCount];
    }
    return self;
}
- (NSString *)source
{
    return nil;
}
@end
