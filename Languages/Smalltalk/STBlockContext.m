/**
    STBlockContext.m
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StepTalk project.
 
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.
 
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02111, USA.
 
 */

#import "STBlockContext.h"

#import "STStack.h"
#import "STBytecodeInterpreter.h"
#import "STBytecodes.h"
#import "STMethodContext.h"

#import <StepTalk/STExterns.h>

#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>
#import <Foundation/NSString.h>

@implementation STBlockContext
- initWithInterpreter:(STBytecodeInterpreter *)anInterpreter
  initialIP:(unsigned)pointer
  stackSize:(unsigned)size
{
    interpreter = RETAIN(anInterpreter);
    initialIP = pointer;

    [self setInstructionPointer:initialIP];
    
    return [super initWithStackSize:size]; 
}
- (void)dealloc
{
    RELEASE(interpreter);
    [super dealloc];
}

- (BOOL)isBlockContext
{
    return YES;
}
- (void)setHomeContext:(STMethodContext *)context
{
    ASSIGN(homeContext,context);
}
- (STMethodContext *)homeContext
{
    return homeContext;
}
- (void)invalidate
{
    [self setParrentContext:nil];
}
- (BOOL)isInvalid
{
    return (!parrentContext);
}

- (unsigned)initialIP
{
    return initialIP;
}
- (void)initializeIntstructionPointer
{
    [self setInstructionPointer:initialIP];
}

- temporaryAtIndex:(unsigned)index;
{
    return [homeContext temporaryAtIndex:index];
}
- (void)setTemporary:anObject atIndex:(unsigned)index;
{
    [homeContext setTemporary:anObject atIndex:index];
}

- externAtIndex:(unsigned)index;
{
    return [homeContext externAtIndex:index];
}
- (void)setExtern:anObject atIndex:(unsigned)index;
{
    [homeContext setExtern:anObject atIndex:index];
}

- (void) forceReturn
{
    NSDebugLLog(@"STBytecodeInterpreter",
                @"!!! force return from block context");
    [interpreter forceReturnFromBlockContext];
}
- (STBytecodes *)bytecodes
{
    return [homeContext bytecodes];
}
- (id)literalObjectAtIndex:(unsigned)index
{
    return [homeContext literalObjectAtIndex:index];
}
@end
