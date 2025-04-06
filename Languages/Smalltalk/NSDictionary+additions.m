/**
    NSDictionary-additions.m
    Various methods for NSDictionary

    Copyright (c) 2019 Free Software Foundation

    Written by: Wolfgang Lux <wolfgang.lux@gmail.com>

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

#import "NSDictionary+additions.h"
#import "NSNumber+additions.h"
#import "STBlock.h"

#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSEnumerator.h>

#import <StepTalk/STExterns.h>

@implementation NSDictionary (STCollecting)
- do:(STBlock *)block
{
    NSEnumerator *enumerator;
    id            object;
    id            retval = nil;

    enumerator = [self objectEnumerator];
    while( (object = [enumerator nextObject]) )
    {
        retval = [block value:object];
    }

    return retval;
}
- keysDo:(STBlock *)block
{
    NSEnumerator *enumerator;
    id            key;
    id            retval = nil;

    enumerator = [self keyEnumerator];
    while ((key = [enumerator nextObject]))
    {
        retval = [block value:key];
    }

    return retval;
}
- select:(STBlock *)block
{
    NSMutableDictionary *dictionary;
    NSEnumerator   *enumerator;
    id              key;
    id              object;
    id              value;

    dictionary = [NSMutableDictionary dictionary];

    enumerator = [self keyEnumerator];
    while( (key = [enumerator nextObject]) )
    {
        object = [self objectForKey:key];
        value = [block value:object];
        if([(NSNumber *)value isTrue])
        {
            [dictionary setObject:object forKey:key];
        }
    }

    return [NSDictionary dictionaryWithDictionary: dictionary];
}

- reject:(STBlock *)block
{
    NSMutableDictionary *dictionary;
    NSEnumerator        *enumerator;
    id                   key;
    id                   object;
    id                   value;

    dictionary = [NSMutableDictionary dictionary];

    enumerator = [self keyEnumerator];
    while( (key = [enumerator nextObject]) )
    {
        object = [self objectForKey:key];
        value = [block value:object];
        if([(NSNumber *)value isFalse])
        {
            [dictionary setObject:object forKey:key];
        }
    }

    return [NSDictionary dictionaryWithDictionary: dictionary];
}

- collect:(STBlock *)block
{
    NSMutableDictionary *dictionary;
    NSEnumerator        *enumerator;
    id                   key;
    id                   value;

    dictionary = [NSMutableDictionary dictionary];

    enumerator = [self keyEnumerator];
    while( (key = [enumerator nextObject]) )
    {
        value = [block value:[self objectForKey:key]];
	if (value == nil)
	    value = STNil;
        [dictionary setObject:value forKey:key];
    }

    return [NSDictionary dictionaryWithDictionary: dictionary];

}
- detect:(STBlock *)block
{
    NSEnumerator *enumerator;
    id            object;
    id            retval;

    enumerator = [self objectEnumerator];
    while( (object = [enumerator nextObject]) )
    {
        retval = [block value:object];
        if([(NSNumber *)retval isTrue])
        {
            return object;
        }
    }
    return nil;
}
@end
