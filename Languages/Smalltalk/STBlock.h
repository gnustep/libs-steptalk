/**
    STBlock.h
    Wrapper for STBlockContext to make it invisible  
 
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

#import <Foundation/NSObject.h>

@class STBlockLiteral;
@class STBytecodeInterpreter;
@class STMethodContext;
@class STBlockContext;

@interface STBlock:NSObject
{
    STBytecodeInterpreter *interpreter;
    STMethodContext       *homeContext;
    
    NSUInteger             initialIP;
    NSUInteger             argCount;
    NSUInteger             stackSize;

    STBlockContext        *cachedContext;
    BOOL                   usingCachedContext; 
}

- initWithInterpreter:(STBytecodeInterpreter *)anInterpreter
          homeContext:(STMethodContext *)context
            initialIP:(NSUInteger)ptr
        argumentCount:(NSUInteger)count
            stackSize:(NSUInteger)size;
                 
- (NSUInteger)argumentCount;

- value;
- value:arg;
- value:arg1 value:arg2;
- value:arg1 value:arg2 value:arg3;
- valueWithArguments:(NSArray *)arguments;
/* The following methods are present for backward compatibility with
 * earlier StepTalk versions. */
- valueWith:arg;
- valueWith:arg1 with:arg2;
- valueWith:arg1 with:arg2 with:arg3;
- valueWithArgs:(id *)args count:(NSUInteger)count;

- whileTrue:(STBlock *)doBlock;
- whileFalse:(STBlock *)doBlock;

- handler:(STBlock *)handlerBlock;
@end
