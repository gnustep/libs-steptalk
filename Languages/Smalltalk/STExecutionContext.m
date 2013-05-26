/**
    STExecutionContext.m
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StepTalk project.
 
 */

#import "STExecutionContext.h"

#import "STMethodContext.h"
#import "STStack.h"

#import <Foundation/NSDebug.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>

static NSUInteger nextId = 1;

@interface STExecutionContext(STPrivateMethods)
- (NSUInteger)contextId;
@end

@implementation STExecutionContext
- initWithStackSize:(NSUInteger)stackSize
{
    if ((self = [super init]) != nil)
    {
        stack = [[STStack alloc] initWithSize:stackSize];
        contextId = nextId ++;
    }
    return self;
}
- (void)dealloc
{
    RELEASE(stack);
    [super dealloc];
}
- (NSUInteger)contextId
{
    return contextId;
}
- (NSString *)description
{
    NSMutableString *str;
    str = [NSMutableString stringWithFormat:
                              @"%@ %lu (home %lu)",
                              [self className],
                              (unsigned long)contextId,
                              (unsigned long)[[self homeContext] contextId]];
    return str;
}
- (void)invalidate
{
    instructionPointer = NSNotFound;
}
- (BOOL)isValid
{
    return (instructionPointer != NSNotFound);
}
- (NSUInteger)instructionPointer
{
    return instructionPointer;
}
- (void)setInstructionPointer:(NSUInteger)value
{
    instructionPointer = value;
}
- (STMethodContext *)homeContext
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (void)setHomeContext:(STMethodContext *)newContext
{
    [self subclassResponsibility:_cmd];
}

- (STStack *)stack
{
    return stack;
}
- (BOOL)isBlockContext;
{
    [self subclassResponsibility:_cmd];
    return NO;
}
- (id)temporaryAtIndex:(NSUInteger)index
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (void)setTemporary:anObject atIndex:(NSUInteger)index
{
    [self subclassResponsibility:_cmd];
}
- (NSString *)referenceNameAtIndex:(NSUInteger)index
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (STBytecodes *)bytecodes
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (id)literalObjectAtIndex:(NSUInteger)index
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (id)receiver
{
    [self subclassResponsibility:_cmd];
    return nil;
}
@end
