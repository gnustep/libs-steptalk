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

#import <Foundation/NSObject.h>

@class NSBundle;
@class NSDictionary;
@class NSMutableDictionary;
@class NSMutableArray;
@class NSMutableSet;

@class STObjectReference;
@class STEnvironmentDescription;

@interface STEnvironment:NSObject
{
    NSMutableDictionary      *defaultPool;

    STEnvironmentDescription *description;
    NSMutableDictionary      *classes;   /* from description */

    BOOL                      fullScripting;
    BOOL                      createsUnknownObjects;
    
    NSMutableDictionary      *infoCache;
    
    NSMutableDictionary      *objectFinders;
    
    NSMutableArray           *loadedBundles;
}
/** Creating environment */
+ (STEnvironment *)defaultScriptingEnvironment;

+ environmentWithDescriptionName:(NSString *)descName;
+ environmentWithDescription:(STEnvironmentDescription *)aDescription;

- initDefault;
- initWithDescriptionName:(NSString *)descName;
- initWithDescription:(STEnvironmentDescription *)aDescription;

/** Full scripting */

- (void)setFullScriptingEnabled:(BOOL)flag;
- (BOOL)fullScriptingEnabled;

-(void)setCreatesUnknownObjects:(BOOL)flag;
-(BOOL)createsUnknownObjects;

/** Modules */

- (void)loadModule:(NSString *)moduleName;

- (BOOL)includeBundle:(NSBundle *)aBundle;

- (void)addClassesWithNames:(NSArray *)names;

/** Named objects and object references */

- (NSMutableDictionary *)objectDictionary;
- (void)setObject:(id)anObject
          forName:(NSString *)objName;
- (void)removeObjectWithName:(NSString *)objName;
- (void)addNamedObjectsFromDictionary:(NSDictionary *)dict;
- (id)objectWithName:(NSString *)objName;

- (STObjectReference *)objectReferenceForObjectWithName:(NSString *)name;

/** Distributed objects */
- (void)registerObjectFinder:(id)finder name:(NSString*)name;
- (void)registerObjectFinderNamed:(NSString *)name;
- (void)removeObjectFinderWithName:(NSString *)name;
- (NSArray *)knownObjectNames;

/** Selector translation */

- (NSString  *)translateSelector:(NSString *)aString forReceiver:(id)anObject;
@end
