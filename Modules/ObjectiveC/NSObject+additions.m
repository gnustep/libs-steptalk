/**
    NSObject+additions

    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2002 Jun 14
   
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

#import "NSObject+additions.h"

#import <Foundation/NSArray.h>
#import <Foundation/NSString.h>

static NSArray *methods_for_class(Class class)
{
    NSMutableArray          *array = [NSMutableArray array];
    Method                  *methods;
    SEL                      sel;
    unsigned int             i, numMethods;

    if(!class)
        return nil;

    
    methods = class_copyMethodList(class, &numMethods);

    if(methods)
    {
        for(i = 0; i < numMethods; i++)
        {
            sel = method_getName(methods[i]);
            [array addObject:NSStringFromSelector(sel)];
        }
	free(methods);
    }
    
    return [NSArray arrayWithArray:array];
}

static NSArray *ivars_for_class(Class class)
{
    NSMutableArray        *array;
    Ivar*                  ivars; 
    const char            *cname;
    unsigned int           i, numIvars;
    
    if(!class)
        return nil;
    
    array = [NSMutableArray array];
    
    ivars = class_copyIvarList(class, &numIvars);

    if(ivars)
    {
        for(i = 0; i < numIvars ; i++)
        {
            cname = ivar_getName(ivars[i]);
            [array addObject:[NSString stringWithCString:cname]];
        }
    }
    free(ivars);
    
    return [NSArray arrayWithArray:array];
}

@implementation NSObject(ObjectiveCRuntime)
+ (NSArray *)instanceMethodNames
{
    return methods_for_class(self);
}

- (NSArray *)methodNames
{
    return [[[self class] instanceMethodNames] 
                            sortedArrayUsingSelector:@selector(compare:)];
}

+ (NSArray *)methodNames
{
    return methods_for_class(object_getClass(self));
}

+ (NSArray *)instanceVariableNames
{
    return ivars_for_class(self);
}
@end
