/**
    STMethodContext.m
 
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

#import "STMethodContext.h"

#import "STBytecodes.h"
#import "STCompiledMethod.h"
#import "STLiterals.h"
#import "STStack.h"

#import <StepTalk/STExterns.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>

@implementation STMethodContext
+ methodContextWithMethod:(STCompiledMethod *)newMethod
{
    return AUTORELEASE([[self alloc] initWithMethod:newMethod]);
}

- initWithMethod:(STCompiledMethod *)newMethod
{
    if ((self = [super initWithStackSize:[newMethod stackSize]]) != nil)
    {
        NSUInteger tempCount;
        NSUInteger i;

        method = RETAIN(newMethod);

        tempCount = [method temporariesCount];
        temporaries = [[NSMutableArray alloc] initWithCapacity:tempCount];

        for (i=0; i<tempCount; i++)
        {
            [temporaries insertObject:STNil atIndex:i];
        }
    }
    return self;
}

- (void)dealloc
{
    RELEASE(temporaries);
    RELEASE(method);
    [super dealloc];
}
- (BOOL)isBlockContext
{
    return NO;
}
- (STMethodContext *)homeContext
{
    return self;
}
- (void)setHomeContext:(STMethodContext *)context
{
    [NSException raise:STInternalInconsistencyException
                format:@"Should not set home context of method context"];
}

- (STCompiledMethod*)method
{
    return method;
}
- (void)setReceiver:anObject
{
    receiver = anObject;
}
- (id)receiver
{
    return receiver;
}

- (id)temporaryAtIndex:(NSUInteger)index
{
    return [temporaries objectAtIndex:index];
}

- (void)setTemporary:anObject atIndex:(NSUInteger)index
{
    if(!anObject)
    {
        anObject = STNil;
    }
    [temporaries replaceObjectAtIndex:index withObject:anObject];
}

- (NSString *)referenceNameAtIndex:(NSUInteger)index
{
    return [[method namedReferences] objectAtIndex:index];
}

- (STBytecodes *)bytecodes
{
    return [method bytecodes];
}
- (id)literalObjectAtIndex:(NSUInteger)index
{
    return [method literalObjectAtIndex:index];
}

- (void)setArgumentsFromArray:(NSArray *)args
{
    NSUInteger i;
    NSUInteger count;
    
    count = [args count];

    for(i=0;i<count;i++)
    {
        [self setTemporary:[args objectAtIndex:i] atIndex:i];
    }
}
@end
