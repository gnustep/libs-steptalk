/**
    NSArray-additions.m
    Various methods for NSArray
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
 
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

#import "NSArray+additions.h"
#import "NSNumber+additions.h"
#import "STBlock.h"

#import <Foundation/NSEnumerator.h>

@implementation NSArray (STCollecting)
- do:(STBlock *)block
{
    NSEnumerator *enumerator;
    id            object;
    id            retval = nil;
    
    enumerator = [self objectEnumerator];
    while( (object = [enumerator nextObject]) )
    {
        retval = [block valueWith:object];
    }
    return retval;
}
- select:(STBlock *)block
{
    NSMutableArray *array;
    NSEnumerator   *enumerator;
    id              object;
    id              value;
    
    array = [NSMutableArray array];
    
    enumerator = [self objectEnumerator];
    while( (object = [enumerator nextObject]) )
    {
        value = [block valueWith:object];
        if([(NSNumber *)value isTrue])
        {
            [array addObject:object];
        }
    }

    return [NSArray arrayWithArray:array];
}

- reject:(STBlock *)block
{
    NSMutableArray *array;
    NSEnumerator   *enumerator;
    id              object;
    id              value;
    
    array = [NSMutableArray array];
    
    enumerator = [self objectEnumerator];
    while( (object = [enumerator nextObject]) )
    {
        value = [block valueWith:object];
        if([(NSNumber *)value isFalse])
        {
            [array addObject:object];
        }
    }

    return [NSArray arrayWithArray:array];
}

- collect:(STBlock *)block
{    
    NSMutableArray *array;
    NSEnumerator   *enumerator;
    id              object;
    id              value;
    
    array = [NSMutableArray array];
    
    enumerator = [self objectEnumerator];
    while( (object = [enumerator nextObject]) )
    {
        value = [block valueWith:object];
        [array addObject:value];
    }

    return [NSArray arrayWithArray:array];

}
- detect:(STBlock *)block
{
    NSEnumerator *enumerator;
    id            object;
    id            retval = nil;

    enumerator = [self objectEnumerator];
    while( (object = [enumerator nextObject]) )
    {
        retval = [block valueWith:object];
        if([(NSNumber *)retval isTrue])
        {
            return object;
        }
    }
    return retval;
}
@end
