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

@class NSDictionary;
@class NSMutableDictionary;
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
}
/** Creating environment */
+ (STEnvironment *)defaultScriptingEnvironment;

+ environmentWithDescriptionName:(NSString *)descName;
+ environmentWithDescriptionFromDictionary:(NSDictionary *)dict;
+ environmentWithDescriptionFromFile:(NSString *)path;

- initWithDescriptionName:(NSString *)descName;
- initWithDescriptionFromDictionary:(NSDictionary *)dict;
- initWithDescriptionFromFile:(NSString *)path;

/** Full scripting */

- (void)setFullScriptingEnabled:(BOOL)flag;
- (BOOL)fullScriptingEnabled;

-(void)setCreatesUnknownObjects:(BOOL)flag;
-(BOOL)createsUnknownObjects;

/** Modules */

- (void) loadModule:(NSString *)moduleName;

- (void)addClassesWithNames:(NSArray *)names;

/** Named objects and object references */

- (NSDictionary *)allObjectsDictionary;
- (void)setObject:(id)anObject
          forName:(NSString *)objName;
- (void)removeObjectWithName:(NSString *)objName;
- (void)addNamedObjectsFromDictionary:(NSDictionary *)dict;
- (id)objectWithName:(NSString *)objName;

- (STObjectReference *)objectReferenceForObjectWithName:(NSString *)name;

/** Distributed objects */
- (void)addObjectFinder:(id)finder name:(NSString*)name;
- (void)addObjectFinderWithName:(NSString *)name;
- (void)removeObjectFinderWithName:(NSString *)name;

/** Selector translation */

- (NSString  *)translateSelector:(NSString *)aString forReceiver:(id)anObject;
@end
