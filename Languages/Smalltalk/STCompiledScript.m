/**
    STCompiledScript.m
 
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

#import "STCompiledScript.h"

#import "STScriptObject.h"
#import "STCompiledMethod.h"

#import <StepTalk/STObjCRuntime.h>
#import <StepTalk/STExterns.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSString.h>
#import <Foundation/NSException.h>
#import <Foundation/NSEnumerator.h>

@class STEnvironment;
static SEL mainSelector;
static SEL initializeSelector;
static SEL finalizeSelector;

@implementation STCompiledScript:NSObject
+ (void)initialize
{
    mainSelector = STSelectorFromString(@"main");
    initializeSelector = STSelectorFromString(@"startUp");
    finalizeSelector = STSelectorFromString(@"finalize");
}

- initWithVariableCount:(unsigned)count
{
    [super init];
    
    variableCount = count;

    return self;
}
- (void)addMethod:(STCompiledMethod *)method
{
    if(!methodDictionary)
    {
        methodDictionary = [[NSMutableDictionary alloc] init];
    }

    if( ! [method isKindOfClass:[STCompiledMethod class]] )
    {
        [NSException raise:STGenericException
                    format:@"Invalid compiled method class '%@'",
                           [method class]];
    }

    [methodDictionary setObject:method forKey:[method selector]];
}

- (void)dealloc
{
    RELEASE(methodDictionary);
    [super dealloc];
}

- (STCompiledMethod *)methodWithName:(NSString *)name
{
    return [methodDictionary objectForKey:name];
}

- (int)variableCount
{
    return variableCount;
}

- (id)executeInEnvironment:(STEnvironment *)env
{
    STScriptObject *object;
    int             methodCount;
    id              retval = nil;
    

    object = [[STScriptObject alloc] initWithEnvironment:env
                                     compiledScript:self];

    methodCount = [methodDictionary count];
    
    if(methodCount == 0)
    {
        NSLog(@"Empty script executed");
        return nil;
    }
    else if(methodCount == 1)
    {
        NSString *selName = [[methodDictionary allKeys] objectAtIndex:0];
        SEL       sel = STSelectorFromString(selName);

        NSDebugLog(@"Executing single-method script. (%@)", selName);

        retval = [object performSelector:sel];
    }
    else if(![object respondsToSelector:mainSelector])
    {
        NSLog(@"No 'main' method found");
        return nil;
    }
    else
    {

        if( [object respondsToSelector:initializeSelector] )
        {
            NSDebugLog(@"Sending 'startUp' to script object");
            [object performSelector:initializeSelector];
        }

        if( [object respondsToSelector:mainSelector] )
        {
            retval = [object performSelector:mainSelector];
        }
        else
        {
            NSLog(@"No 'main' found in script");
        }

        if( [object respondsToSelector:finalizeSelector] )
        {
            NSDebugLog(@"Sending 'finalize' to script object");
            [object performSelector:finalizeSelector];
        }
    }
    
    RELEASE(object);
    
    return retval;
}

@end
