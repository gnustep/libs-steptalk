/**
    STEnvironment
    Scripting environment
  
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

    <title>STEnvironment class reference</title>
 
   */

#import <StepTalk/STEnvironment.h>

#import <StepTalk/STClassInfo.h>
#import <StepTalk/STEnvironmentDescription.h>
#import <StepTalk/STExterns.h>
#import <StepTalk/STFunctions.h>
#import <StepTalk/STModule.h>
#import <StepTalk/STObjectReference.h>
#import <StepTalk/STUndefinedObject.h>
#import <StepTalk/STScripting.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSBundle.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSInvocation.h>

@interface STEnvironment(STPrivateMethods)
- (STClassInfo *)findClassInfoForObject:(id)anObject;
@end

@implementation STEnvironment
/**
   Creates and initialises scripting environment using standard description.
 */
+ (STEnvironment *)defaultScriptingEnvironment
{
    NSString *name;

    name = [STEnvironmentDescription defaultEnvironmentDescriptionName];
    
    return [self environmentWithDescriptionName:name];
}

/**
   Creates and initialises scripting environment using description with name
   <var>descName</var>.
 */
+ environmentWithDescriptionName:(NSString *)descName
{
    return AUTORELEASE([[self alloc] initWithDescriptionName:descName]);
}

/**
   Creates and initialises scripting environment using environment description 
   <var>description</var>.
 */
+ environmentWithDescription:(NSString *)description
{
    return AUTORELEASE([[self alloc] initWithDescription:description]);
}

/**
   Initialises scripting environment using description with name
   <var>descName</var>.
   
   <init />
 */
- initWithDescriptionName:(NSString *)descName
{
    return [self initWithDescription:
                    [STEnvironmentDescription descriptionWithName:descName]];
}

/**
   Initialises scripting environment using scripting description
   <var>aDescription</var>.
 */
- initWithDescription:(STEnvironmentDescription *)aDescription
{
    NSEnumerator *enumerator;
    NSString     *name;
    
    self = [super init];
    
    defaultPool = [[NSMutableDictionary alloc] init];
    infoCache = [[NSMutableDictionary alloc] init];

    description = RETAIN(aDescription);
    classes = [description classes];

    /* Load modules */
    enumerator = [[description modules] objectEnumerator];    
    
    while( (name = [enumerator nextObject]) )
    {
        [self loadModule:name];
    }

    /* Register finders */
    enumerator = [[description objectFinders] objectEnumerator];    
    
    while( (name = [enumerator nextObject]) )
    {
        [self registerObjectFinderNamed:name];
    }

    RETAIN(description);

    return self;
}

- (void)dealloc
{
    RELEASE(defaultPool);
    RELEASE(description);

    RELEASE(infoCache);
    RELEASE(objectFinders);
    
    [super dealloc];
}

/**
   Enable or disable full scripting. When full scripting is enabled, 
   you may send any message to any object.
 */
- (void)setFullScriptingEnabled:(BOOL)flag
{
    fullScripting = flag;
}

/**
   Returns YES if full scripting is enabled.
 */
- (BOOL)fullScriptingEnabled
{
    return fullScripting;
}

/**
   Enable or disable creation of unknown objects. Normally you get nil if you
   request for non-existant object. If <var>flag</var> is YES
   then by requesting non-existant object, name for that object is created
   and it is set no STNil.
 */
-(void)setCreatesUnknownObjects:(BOOL)flag
{
    createsUnknownObjects = flag;
}

/**
   Returns YES if unknown objects are being created.
 */
-(BOOL)createsUnknownObjects
{
    return createsUnknownObjects;
}

/**
    Add classes specified by the names in the <var>names</var> array. 
    This method is used internally to add classes provided by modules.
*/
- (void)addClassesWithNames:(NSArray *)names
{
    [self addNamedObjectsFromDictionary:STClassDictionaryWithNames(names)];
}

/**
   Load StepTalk module with the name <var>moduleName</var>. Module extension
   '.stmodule' is optional. Modules are stored in the Library/StepTalk/Modules
   directory.
 */

- (void) loadModule:(NSString *)moduleName
{
    STModule *module = [STModule moduleWithName:moduleName];
    
    [self addNamedObjectsFromDictionary:[module namedObjects]];
    [self addClassesWithNames:[module providedClasses]];
}

/**
    Returns a dictionary of all named objects in the environment.
*/
- (NSMutableDictionary *)objectDictionary
{
    return defaultPool;
}

/* ----------------------------------------------------------------------- 
   Objects
   ----------------------------------------------------------------------- */

/**
    Register object <var>anObject</var> with name <var>objName</var>.
 */

- (void)setObject:(id)anObject
          forName:(NSString *)objName
{
    if(anObject)
    {
        [defaultPool setObject:anObject forKey:objName];
    }
    else
    {
        [defaultPool setObject:STNil forKey:objName];
    }
}

/**
    Remove object named <var>objName</var>.
  */
- (void)removeObjectWithName:(NSString *)objName
{
    [defaultPool removeObjectForKey:objName];
}

/**
    
  */
- (void)addNamedObjectsFromDictionary:(NSDictionary *)dict
{
    [defaultPool addEntriesFromDictionary:dict];
}

/**
    Return object with name <var>objName</var>. If object is not found int the
    object dictionary, then object finders are used to try to find the object.
    If object is found by an object finder, then it is put into the object
    dicitonary. If there is no object with given name, <var>nil</var> is 
    returned.
  */

- (id)objectWithName:(NSString *)objName
{
    NSEnumerator *enumerator;
    id            obj;
    id            finder;
    
    obj = [defaultPool objectForKey:objName];

    if(!obj)
    {
        enumerator = [objectFinders objectEnumerator];
        while( (finder = [enumerator nextObject]) )
        {
            obj = [finder objectWithName:objName];
            if(obj)
            {
                [defaultPool setObject:obj forKey:objName];
                break;
            }
        }
    }
    
    return obj;
}

- (STObjectReference *)objectReferenceForObjectWithName:(NSString *)name
{
    STObjectReference *ref;
    id                 pool = defaultPool;
        
    if( ![self objectWithName:name] )
    {
        if([[self knownObjectNames] containsObject:name])
        {
            pool = nil;
        }
        else if(createsUnknownObjects)
        {
            [defaultPool setObject:STNil forKey:name];
        }
    }

    ref = [STObjectReference alloc];
    
    [ref initWithObjectName:name
                       pool:defaultPool];

    return AUTORELEASE(ref);
}

/* FIXME: rewrite */
- (STClassInfo *)findClassInfoForObject:(id)anObject
{
    STClassInfo *info = nil;
    NSString    *className;
    NSString    *origName;
    Class       *class;
    
    if(!anObject)
    {
        anObject = STNil;
    }

    /* FIXME: temporary solution */
    if( [anObject isProxy] )
    {
        NSDebugLog(@"FIXME: receiver is a distant object");
        info = [classes objectForKey:@"NSProxy"];

        if(!info)
        {
            return [classes objectForKey:@"All"];
        }
        
        return info;
    }

    if([anObject respondsToSelector:@selector(classForScripting)])
    {
        class = [anObject classForScripting];
    }
    else
    {
        class = [anObject class];
    }
    
    className = [anObject className];
    
    if([anObject isClass])
    {
        origName = className = [className stringByAppendingString:@" class"];

        NSDebugLLog(@"STSending",
                    @"Looking for class info '%@'...",
                    className);

        info = [infoCache objectForKey:className];
        
        if(info)
        {
            return info;
        }
        
        while( !(info = [classes objectForKey:className]) )
        {
            class = [class superclass];

            if(!class)
            {
                break;
            }
            
            className = [[class className] stringByAppendingString:@" class"];
            NSDebugLLog(@"STSending",
                        @"    ... %@?",className);
        }
    }
    else
    {
        origName = className;

        NSDebugLLog(@"STSending",
                    @"Looking for class info '%@' (instance)...",
                    className);

        info = [infoCache objectForKey:className];
        if(info)
        {
            return info;
        }

        while( !(info = [classes objectForKey:className]) )
        {
            class = [class superclass];
            if(!class)
            {
                break;
            }
            className = [class className];
            NSDebugLLog(@"STSending",
                        @"    ... %@?",className);
        }
    }
    
    if(!info)
    {
        NSDebugLLog(@"STSending",
                    @"No class info '%@'",
                    className);
        return nil;
    }

    NSDebugLLog(@"STSending",
                @"Found class info '%@'",
                className);
                
    [infoCache setObject:info forKey:origName]; 
    return info;
}

- (NSString  *)translateSelector:(NSString *)aString forReceiver:(id)anObject
{
    STClassInfo *class;
    NSString    *selector;

    class = [self findClassInfoForObject:anObject];

    NSDebugLLog(@"STSending",
                @"Lookup selector '%@' class %@", aString, [class behaviourName]);

    selector = [class translationForSelector:aString];

    NSDebugLLog(@"STSending",
                @"Found selector '%@'",selector);

#ifdef DEBUG
    if(! [selector isEqualToString:aString])
    {
       NSDebugLLog(@"STSending",
                    @"using selector '%@' instead of '%@'",
                    selector,aString);
    }
#endif
    
    if(!selector && fullScripting )
    {
        NSDebugLLog(@"STSending",
                    @"using selector '%@' (full scriptig)",
                    aString);

        selector = AUTORELEASE([aString copy]);
    }

    if(!selector)
    {
        [NSException raise:STScriptingException
                     format:@"Receiver of type %@ denies selector '%@'",
                            [anObject className],aString];

        /* if exception is ignored, then try to use original selector  */
        selector = AUTORELEASE([aString copy]);
    }


    return selector;
}

- (NSArray *)knownObjectNames
{
    NSMutableArray *array = [NSMutableArray array];
    NSEnumerator   *enumerator;
    id              finder;
    
    [array addObjectsFromArray:[defaultPool allKeys]];
    
    enumerator = [objectFinders objectEnumerator];
    while( (finder = [enumerator nextObject]) )
    {
        [array addObjectsFromArray:[finder knownObjectNames]];
    }

    return [NSArray arrayWithArray:array];
}

/** Register object finder <var>finder</var> under the name <var>name</var> */
- (void)registerObjectFinder:(id)finder name:(NSString*)name
{
    if(!objectFinders)
    {
        objectFinders = [[NSMutableDictionary alloc] init];
    }
    
    [objectFinders setObject:finder forKey:name];
}

/** Register object finder named <var>name</var>. This method will try to find
    an object finder bundle in Library/StepTalk/Finders directories.
*/
- (void)registerObjectFinderNamed:(NSString *)name
{
    NSBundle *bundle;
    NSString *path;
    id        finder;
        
    if([objectFinders objectForKey:name])
    {
        return;
    }
    
    path = STFindResource(name, @"Finders", @"bundle");
    
    if(!path)
    {
        NSLog(@"Unknown object finder with name '%@'", name);
        return;
    }
    
    NSDebugLog(@"Finder '%@'", path);

    bundle = [NSBundle bundleWithPath:path];
    if(!bundle)
    {
        NSLog(@"Unable to load object finder bundle '%@'", path);
        return;
    }

    finder = [[[bundle principalClass] alloc] init];
    if(!finder)
    {
        NSLog(@"Unable to create object finder from '%@'", path);
        return;
    }

    [self registerObjectFinder:finder name:name];
}

/** Remove object finder with name <var>name</var> */
- (void)removeObjectFinderWithName:(NSString *)name
{
    [objectFinders removeObjectForKey:name];
}

@end
