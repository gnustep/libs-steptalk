/**
    STObjectReference.m
    Reference to object in NSDictionary.
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2000
   
    This file is part of StepTalk.
 
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

#import <StepTalk/STObjectReference.h>

#import <StepTalk/STExterns.h>

#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSString.h>

@implementation STObjectReference
- initWithObjectName:(NSString *)name pool:(NSMutableDictionary *)aPool
{
    return [self initWithObjectName:name
                               pool:pool
                             create:NO];
}

- initWithObjectName:(NSString *)name 
                pool:(NSMutableDictionary *)aPool
              create:(BOOL)createFlag
{

    [super init];
    
    key = RETAIN(name);
    pool = RETAIN(aPool);

    if(![self object] && createFlag)
    {
        NSDebugLog(@"Creating object name '%@'", name);
        [pool setObject:STNil forKey:name];
    }
    

    return self;
}
- (void)dealloc
{
    RELEASE(key);
    RELEASE(pool);

    [super dealloc];
}

- (void)setObject:anObject
{
    if(anObject)
    {
        [pool setObject:anObject forKey:key];
    }
    else
    {
        [pool setObject:STNil forKey:key];
    }
}

- object
{
    return [pool objectForKey:key];
}

- (NSString *)objectName
{
    return key;
}
- (void)setObjectName:(NSString *)newName
{
    ASSIGN(key,newName);
}

- (NSMutableDictionary *) pool
{
    return pool;
}
- (void)setPool:(NSMutableDictionary *) aDict
{
    ASSIGN(pool,aDict);
}
@end

