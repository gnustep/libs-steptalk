/**
    STExecutionContext.m
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StepTalk project.
 
 */

#import "STExecutionContext.h"

#import "STMethodContext.h"
#import "STStack.h"

#import <StepTalk/STExterns.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>

static NSUInteger nextId = 1;

@interface STExecutionContext(STPrivateMethods)
- (NSUInteger)contextId;
@end

@implementation STExecutionContext
- initWithStackSize:(NSUInteger)stackSize tempCount:(NSUInteger)tempCount
{
    if ((self = [super init]) != nil)
    {
        stack = [[STStack alloc] initWithSize:stackSize];
        if (tempCount > 0)
        {
            NSUInteger i;

            temporaries = [[NSMutableArray alloc] initWithCapacity:tempCount];

            for (i=0; i<tempCount; i++)
            {
                [temporaries insertObject:STNil atIndex:i];
            }
        }

        contextId = nextId ++;
    }
    return self;
}
- (void)dealloc
{
    RELEASE(stack);
    RELEASE(temporaries);
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
- (STExecutionContext *)outerContext
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (STExecutionContext *)outerContext:(NSUInteger)num
{
    NSUInteger i;
    STExecutionContext *context;

    context = self;
    for (i=0; i<num; i++)
    {
        context = [context outerContext];
        if (!context)
        {
            [NSException raise:STInternalInconsistencyException
                        format:@"Outer context %lu (of %lu) has no outer context",
                               (unsigned long)i,(unsigned long)num];
        }
    }
    return context;
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

@end
