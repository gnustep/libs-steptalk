/**
    STObjCRuntime.m
    Objective C runtime additions 
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2000
   
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

#import "STObjCRuntime.h"
#import "STExterns.h"

#import <Foundation/NSArray.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSMethodSignature.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

#define SELECTOR_TYPES_COUNT 10

/* Predefined default selector types up to 10 arguments for fast creation.
   It should be faster than manually constructing the string. */
static const char *selector_types[] = 
                        {
                            "@8@0:4",
                            "@12@0:4@8",
                            "@16@0:4@8@12",
                            "@20@0:4@8@12@16",
                            "@24@0:4@8@12@16@20",
                            "@28@0:4@8@12@16@20@24" 
                            "@32@0:4@8@12@16@20@24@28" 
                            "@36@0:4@8@12@16@20@24@28@32" 
                            "@40@0:4@8@12@16@20@24@28@32@36" 
                            "@44@0:4@8@12@16@20@24@28@32@36@40" 
                        };

NSMutableDictionary *STAllObjectiveCClasses(void)
{
    int                  i, numClasses;
    NSString            *name;
    NSMutableDictionary *dict;
    Class               *classes;

    dict = [NSMutableDictionary dictionary];

    numClasses = objc_getClassList(NULL, 0);
    classes = (Class *)NSZoneMalloc(STMallocZone, numClasses * sizeof(Class));
    numClasses = objc_getClassList(classes, numClasses);
//    NSLog(@"%i Objective-C classes found", numClasses);

    for(i = 0; i < numClasses; i++)
    {
        name = [NSString stringWithCString:class_getName(classes[i])];
        
        [dict setObject:classes[i] forKey:name];
    }
    NSZoneFree(STMallocZone, classes);

    return dict;
}

NSDictionary *STClassDictionaryWithNames(NSArray *classNames)
{
    NSEnumerator        *enumerator = [classNames objectEnumerator];
    NSString            *className;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    Class                class;
    
    while( (className = [enumerator nextObject]) )
    {
        class = NSClassFromString(className);
        if(class)
        {
            [dict setObject:NSClassFromString(className) forKey:className];
        }
        else
        {
            NSLog(@"Warning: Class with name '%@' not found", className);
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:dict];
}

NSValue *STValueFromSelector(SEL sel)
{
    return [NSValue value:&sel withObjCType:@encode(SEL)];
}

SEL STSelectorFromValue(NSValue *val)
{
    SEL sel;
    [val getValue:&sel];
    return sel;
}

SEL STSelectorFromString(NSString *aString)
{
    const char *name = [aString cString];
    const char *ptr;
    int         argc = 0;

    SEL sel;

    sel = NSSelectorFromString(aString);
    if(!sel)
    {

        ptr = name;

        while(*ptr)
        {
            if(*ptr == ':')
            {
                argc ++;
            }
            ptr++;
        }

        if( argc < SELECTOR_TYPES_COUNT )
        {
            NSDebugLLog(@"STSending",
                       @"registering selector '%s' "
                       @"with %i arguments, types:'%s'",
                        name,argc,selector_types[argc]);
                    
            sel = sel_register_typed_name(name, selector_types[argc]);
        }

        if(!sel)
        {
            [NSException raise:STInternalInconsistencyException
                         format:@"Unable to register selector '%@'",
                                aString];
            return 0;
        }
    }
    else
    {
        /* FIXME: temporary hack */
    }

    return sel;
}

SEL STCreateTypedSelector(SEL sel)
{
    const char *name = sel_getName(sel);
    const char *ptr;
    int         argc = 0;

    SEL         newSel;

    NSLog(@"STCreateTypedSelector is deprecated.");

    ptr = name;

    while(*ptr)
    {
        if(*ptr == ':')
        {
            argc ++;
        }
        ptr++;
    }

    if( argc < SELECTOR_TYPES_COUNT )
    {
        NSDebugLLog(@"STSending",
                   @"registering selector '%s' "
                   @"with %i arguments, types:'%s'",
                    name,argc,selector_types[argc]);

        newSel = sel_register_typed_name(name, selector_types[argc]);
    }

    if(!newSel)
    {
        [NSException raise:STInternalInconsistencyException
                     format:@"Unable to register typed selector '%s'",
                            name];
        return 0;
    }

    return newSel;
}

NSMethodSignature *STConstructMethodSignatureForSelector(SEL sel)
{
    const char *name = sel_getName(sel);
    const char *ptr;
    const char *types = (const char *)0;
    int         argc = 0;

    ptr = name;

    while(*ptr)
    {
        if(*ptr == ':')
        {
            argc ++;
        }
        ptr++;
    }

    if( argc < SELECTOR_TYPES_COUNT )
    {
        NSDebugLLog(@"STSending",
                   @"registering selector '%s' "
                   @"with %i arguments, types:'%s'",
                    name,argc,selector_types[argc]);

        types = selector_types[argc];
    }

    if(!types)
    {
        [NSException raise:STInternalInconsistencyException
                     format:@"Unable to construct types for selector '%s'",
                            name];
        return 0;
    }

    return [NSMethodSignature signatureWithObjCTypes:types];
}

NSMethodSignature *STMethodSignatureForSelector(SEL sel)
{
    const char *types;
    
    NSLog(@"STMethodSignatureForSelector is deprecated.");

    types = sel_get_type(sel);
    
    if(!types)
    {
        sel = STCreateTypedSelector(sel);
        types = sel_get_type(sel);
    }
    return [NSMethodSignature signatureWithObjCTypes:types];
}


static NSArray *selectors_from_list(Method *methods, unsigned int numMethods)
{
    NSMutableArray *array = [NSMutableArray array];
    unsigned int    i;
    
    for (i = 0; i < numMethods; i++)
    {
        [array addObject:NSStringFromSelector(method_getName(methods[i]))];
    }
    
    return array;
}


NSArray *STAllObjectiveCSelectors(void)
{
    int             i, numClasses;
    unsigned int    numMethods;
    NSMutableArray *array;
    NSArray        *selectors;
    Method         *methods;
    Class          *classes;
    
    array = [[NSMutableArray alloc] init];

    numClasses = objc_getClassList(NULL, 0);
    classes = (Class *)NSZoneMalloc(STMallocZone, numClasses * sizeof(Class));
    numClasses = objc_getClassList(classes, numClasses);

    for(i = 0; i < numClasses; i++)
    {
	methods = class_copyMethodList(classes[i], &numMethods);
        if(methods)
        {
            selectors = selectors_from_list(methods, numMethods);
            [array addObjectsFromArray:selectors];
        }
	free(methods);

        methods = class_copyMethodList(object_getClass(classes[i]), &numMethods);
        if(methods)
        {
            selectors = selectors_from_list(methods, numMethods);
            [array addObjectsFromArray:selectors];
        }
	free(methods);
    }
    NSZoneFree(STMallocZone, classes);

    /* get rid of duplicates */
    array = (NSMutableArray *)[[NSSet setWithArray:(NSArray *)array] allObjects];
    array = (NSMutableArray *)[array sortedArrayUsingSelector:@selector(compare:)];

    return array;
}
