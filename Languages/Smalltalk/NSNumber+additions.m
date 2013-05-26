/**
    NSNumber-additions.h
    Various methods for NSNumber
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StepTalk project.
 
 */

#import "NSNumber+additions.h"
#import "STBlock.h"
#include <math.h>
#import <Foundation/NSAutoreleasePool.h>

@implementation NSNumber (STSmalltalkAdditions)
- ifTrue:(STBlock *)block
{
    if([self isTrue])
    {
        return [block value];
    }
    return self;
}
- ifFalse:(STBlock *)block
{
    if([self isFalse])
    {
        return [block value];
    }
    return self;
}
- ifTrue:(STBlock *)trueBlock ifFalse:(STBlock *)falseBlock
{
    if([self isTrue])
    {
        return [trueBlock value];
    }
    return [falseBlock value];
}
- ifFalse:(STBlock *)falseBlock ifTrue:(STBlock *)trueBlock
{
    if([self isFalse])
    {
        return [falseBlock value];
    }
    return [trueBlock value];
}

- (BOOL)isTrue
{
    return ([self intValue] != 0);
}
- (BOOL)isFalse
{
    return ([self intValue] == 0);
}

/* FIXME: make it work with floats */

- to:(NSInteger)number do:(STBlock *)block
{
    id         retval = nil;
    NSInteger  i;

    for(i=[self intValue];i<=number;i++)
    {
        retval = [block value:[NSNumber numberWithInt:i]];
    }
    return retval;
}

- to:(NSInteger)number step:(NSInteger)step do:(STBlock *)block
{
    id         retval = nil;
    NSInteger  i;

    if (step > 0)
    {
        for(i=[self intValue];i<=number;i+=step)
        {
            retval = [block value:[NSNumber numberWithInt:i]];
        }
    }
    else
    {
        // step =< 0
        for(i=[self intValue];i>=number;i+=step)
        {
            retval = [block value:[NSNumber numberWithInt:i]];
        }
    }

    return retval;
}
@end
