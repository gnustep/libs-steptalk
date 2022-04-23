/**
    STCompiledMethod.h
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StepTalk.
 
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

#import "STCompiledCode.h"
#import <StepTalk/STMethod.h>

@class STMessage;

@interface STCompiledMethod:STCompiledCode<STMethod>
{
    NSString *selector;
    NSString *objCTypes;
    NSMethodSignature *methodSignature;
    short     argCount;

//  NSUInteger primitive; 
}
+ methodWithCode:(STCompiledCode *)code messagePattern:(STMessage *)pattern;

-   initWithSelector:(NSString *)sel
           objCTypes:(NSString *)types
       argumentCount:(NSUInteger)aCount
       bytecodesData:(NSData *)data
            literals:(NSArray *)anArray
    temporariesCount:(NSUInteger)tCount
           stackSize:(NSUInteger)size
     namedReferences:(NSArray *)refs;

- (NSString *)selector;
- (NSString *)objCTypes;
- (NSMethodSignature *)methodSignature;
- (NSUInteger)argumentCount;
@end
