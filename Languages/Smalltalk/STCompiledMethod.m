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

#import <StepTalk/STScripting.h>

#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSData.h>

@implementation STCompiledMethod
+ methodWithCode:(STCompiledCode *)code messagePattern:(STMessage *)pattern
{
    STCompiledMethod *method;
    
    method = [STCompiledMethod alloc];
    
    [method    initWithSelector:[pattern selector]
                  argumentCount:[[pattern arguments] count]
                  bytecodesData:[code bytecodes]
                       literals:[code literals]
               temporariesCount:[code temporariesCount]
                      stackSize:[code stackSize]
               externReferences:[code externReferences]];
               

    return AUTORELEASE(method);
}

-   initWithSelector:(NSString *)sel
       argumentCount:(unsigned)aCount
       bytecodesData:(NSData *)data
            literals:(NSArray *)anArray
    temporariesCount:(unsigned)tCount
           stackSize:(unsigned)size
    externReferences:(NSMutableArray *)refs;
{
    self = [super initWithBytecodesData:data
                               literals:anArray
                       temporariesCount:tCount
                              stackSize:size
                       externReferences:refs];

    selector = RETAIN(sel);
    argCount = aCount;
    
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

- (unsigned)argumentCount
{
    return argCount;
}

- (NSString*)description
{
    NSMutableString *desc = [NSMutableString string];

    [desc appendFormat:@"%s:\n"
                       @"Selector = %@\n"
                       @"Literals Count = %i\n"
                       @"Literals = %@\n"
                       @"External References = %@\n"
                       @"Temporaries Count = %i\n"
                       @"Stack Size = %i\n"
                       @"Byte Codes = %@\n",
                       [self className],
                       selector,
                       [literals count],
                       [literals description],
                       [externRefs description],
                       tempCount,
                       stackSize,
                       [bytecodes description]];

    return desc;
}
@end
