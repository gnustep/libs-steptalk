/**
    STExecutionContext.m
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StepTalk project.
 
 */

#import "STExecutionContext.h"

#import "STStack.h"

#import <Foundation/NSDebug.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>

static unsigned nextId = 1;

@implementation STExecutionContext
- initWithStackSize:(unsigned)stackSize
{
    stack = [[STStack alloc] initWithSize:stackSize];

    contextId = nextId ++;

    return [super init];
}
- (void)dealloc
{
    RELEASE(stack);
    RELEASE(parrentContext);
    [super dealloc];
}
- (unsigned)contextId
{
    return contextId;
}
- (NSString *)description
{
    NSMutableString *str;
    str = [NSMutableString stringWithFormat:
                              @"%s[%i]{p:%i h:%i}",
                              [self name],
                              contextId,
                              [parrentContext contextId],
                              [[self homeContext] contextId]];
    return str;
}
- (void)invalidate
{
    [self subclassResponsibility];
}

- (BOOL)isInvalid
{
    [self subclassResponsibility];
    return YES;
}

- (STExecutionContext *)parrentContext
{
    return parrentContext;
}
- (void)setParrentContext:(STExecutionContext *)context
{
    ASSIGN(parrentContext,context);
}
- (unsigned)instructionPointer
{
    return instructionPointer;
}
- (void)setInstructionPointer:(unsigned)value
{
    instructionPointer = value;
}
- (STMethodContext *)homeContext
{
    [self subclassResponsibility];
    return nil;
}
- (void)setHomeContext:(STMethodContext *)newContext
{
    [self subclassResponsibility];
}

- (STStack *)stack
{
    return stack;
}
- (BOOL)isBlockContext;
{
    [self subclassResponsibility];
    return NO;
}
- (id)temporaryAtIndex:(unsigned)index
{
    [self subclassResponsibility];
    return nil;
}
- (void)setTemporary:anObject atIndex:(unsigned)index
{
    [self subclassResponsibility];
}
- (id)externAtIndex:(unsigned)index
{
    [self subclassResponsibility];
    return nil;
}
- (void)setExtern:anObject atIndex:(unsigned)index
{
    [self subclassResponsibility];
}
- (STBytecodes *)bytecodes
{
    [self subclassResponsibility];
    return nil;
}
- (id)literalObjectAtIndex:(unsigned)index
{
    [self subclassResponsibility];
    return nil;
}
@end
