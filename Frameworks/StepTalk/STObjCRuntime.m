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
#import <GNUstepBase/GSObjCRuntime.h>

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
    NSInteger            i, numClasses;
    NSString            *name;
    NSMutableDictionary *dict;
    Class               *classes;

    dict = [NSMutableDictionary dictionary];

    numClasses = objc_getClassList(NULL, 0);
    classes = (Class *)NSZoneMalloc(STMallocZone, numClasses * sizeof(Class));
    numClasses = objc_getClassList(classes, numClasses);
//    NSLog(@"%li Objective-C classes found", (unsigned long)numClasses);

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

static const char *STSelectorTypes(const char *name)
{
    const char *ptr;
    const char *types = 0;
    NSUInteger  argc = 0;

    for (ptr = name; *ptr; ptr++)
	if (*ptr == ':')
	    argc ++;

    /* Special case for binary operators, which have one argument. The set
     * of recognized operator names is the same as in Smalltalk.
     * In case you don't have the Smalltalk standard for reference, the
     * bitmap below contains the following characters: '!', '%', '&', '*',
     * '+', ',', '/', '<', '=', '>', '?', '@', '\\', '~', '|', '-'
     */
    if (!argc)
    {
	for (ptr = name; *ptr; ptr++)
	{
	    static const char binaryCharset[256] = {
		0, 0, 0, 0, 0x46, 0x3d, 0, 0x0f,
		0x80, 0, 0, 0x08, 0, 0, 0, 0x0a
	    };
	    NSUInteger ofs = (NSUInteger)*ptr >> 3;
	    NSUInteger mask = *ptr & 7;
	    if (!(binaryCharset[ofs] & mask))
		break;
	}
	if (!*ptr)
	    argc = 1;
    }

    if (argc < SELECTOR_TYPES_COUNT)
    {
        NSDebugLLog(@"STSending",
                    @"registering selector '%s' "
                    @"with %lu arguments, types:'%s'",
                    name,(unsigned long)argc,selector_types[argc]);
        types = selector_types[argc];
    }

    return types;
}

SEL STSelectorFromString(NSString *aString)
{
    const char *name = [aString cString];
    const char *types = STSelectorTypes(name);
    SEL		sel;

    if (types)
	sel = GSSelectorFromNameAndTypes(name, types);
    else
	sel = 0;

    if (!sel)
    {
	[NSException raise:STInternalInconsistencyException
		    format:@"Unable to register selector '%@'",
                           aString];
    }

    return sel;
}

SEL STCreateTypedSelector(SEL sel)
{
    const char *name = sel_getName(sel);
    const char *types = STSelectorTypes(name);
    SEL         newSel;

    NSLog(@"STCreateTypedSelector is deprecated.");

    if (types)
        newSel = GSSelectorFromNameAndTypes(name, types);
    else
	newSel = 0;

    if(!newSel)
    {
        [NSException raise:STInternalInconsistencyException
                     format:@"Unable to register typed selector '%s'",
                            name];
    }

    return newSel;
}

NSMethodSignature *STConstructMethodSignatureForSelector(SEL sel)
{
    const char *name = sel_getName(sel);
    const char *types = STSelectorTypes(name);

    if (!types)
    {
        [NSException raise:STInternalInconsistencyException
                     format:@"Unable to construct types for selector '%s'",
                            name];
    }

    return [NSMethodSignature signatureWithObjCTypes:types];
}

NSMethodSignature *STMethodSignatureForSelector(SEL sel)
{
    const char *types;
    
    NSLog(@"STMethodSignatureForSelector is deprecated.");

    types = GSTypesFromSelector(sel);
    
    if (!types)
    {
        sel = STCreateTypedSelector(sel);
        types = GSTypesFromSelector(sel);
    }
    return [NSMethodSignature signatureWithObjCTypes:types];
}


static NSArray *selectors_from_list(Method *methods, NSUInteger numMethods)
{
    NSMutableArray *array = [NSMutableArray array];
    NSUInteger      i;
    
    for (i = 0; i < numMethods; i++)
    {
        [array addObject:NSStringFromSelector(method_getName(methods[i]))];
    }
    
    return array;
}


NSArray *STAllObjectiveCSelectors(void)
{
    NSInteger       i, numClasses;
    unsigned int    numMethods;
    NSMutableArray *array;
    NSArray        *selectors;
    Method         *methods;
    Class          *classes;
    
    array = [NSMutableArray array];

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
    array = (NSMutableArray *)[[NSSet setWithArray:array] allObjects];
    array = (NSMutableArray *)[array sortedArrayUsingSelector:@selector(compare:)];

    return array;
}
