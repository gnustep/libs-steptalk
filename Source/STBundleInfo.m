/**
    STBundleInfo.h
    Bundle scripting information
  
    Copyright (c) 2002 Free Software Foundation
  
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2003 Jan 22
  
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

#import <StepTalk/STBundleInfo.h>

#import <StepTalk/STFunctions.h>
#import <StepTalk/STExterns.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSBundle.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>
#import <Foundation/NSNotification.h>
#import <Foundation/NSString.h>

static NSMutableDictionary *bundleInfoDict;

@protocol STScriptingInfoClass
+ (NSDictionary *)namedObjectsForScripting;
@end

@interface STBundleInfo(STPrivateMethods)
- (void) _bundleDidLoad:(NSNotification *)notif;
- (void)_initializeScriptingInfoClass;
@end

@implementation NSBundle(STAdditions)
/** Get list of all StepTalk bundles from Library/StepTalk/Bundles */
+ (NSArray *)stepTalkBundleNames
{
    NSArray        *bundles;
    NSEnumerator   *enumerator;
    NSString       *path;
    NSMutableArray *names = [NSMutableArray array];
    NSString       *name;
    
    bundles = STFindAllResources(@"Bundles", STModuleExtension);

    enumerator = [bundles objectEnumerator];    
    
    while( (path = [enumerator nextObject]) )
    {
        name = [path lastPathComponent];
        name = [name stringByDeletingPathExtension];
        [names addObject:name];        
    }
    
    bundles = STFindAllResources(@"Modules", STModuleExtension);

    enumerator = [bundles objectEnumerator];    
    
    while( (path = [enumerator nextObject]) )
    {
        name = [path lastPathComponent];
        name = [name stringByDeletingPathExtension];
        [names addObject:name];        
    }

    return AUTORELEASE([NSArray arrayWithArray:names]);
}

+ stepTalkBundleWithName:(NSString *)moduleName
{
    NSString *file = STFindResource(moduleName, @"Bundles",
                                                @"bundle");
    if(!file)
    {
        file = STFindResource(moduleName, STModulesDirectory,
                                          STModuleExtension);
        
        if(!file)
        {
            NSLog(@"Could not find bundle with name '%@'", moduleName);
            return nil;
        }
    }

    return AUTORELEASE([[self alloc] initWithPath:file]);
}
- (NSDictionary *)scriptingInfoDictionary
{
    NSString     *file;

    file = [self pathForResource:@"ScriptingInfo" ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:file];
}
+ allAvailableFrameworkPaths
{
    /* TODO */
}
+ pathForFrameworkWithName:(NSString *)aName
{
    /* TODO */
}
+ bundleForFrameworkWithName:(NSString *)name
{
    /* TODO */
}

@end

@implementation STBundleInfo
+ infoForBundle:(NSBundle *)aBundle
{
    return AUTORELEASE([[self alloc] initWithBundle:aBundle]);
}

- initWithBundle:(NSBundle *)aBundle
{
    STBundleInfo *info;
    NSString     *flagString;
    NSDictionary *dict;
    if(!aBundle)
    {
        [NSException raise:@"STBundleException"
                     format:@"Nil bundle specified"];
        [self dealloc];
        return nil;
    }

    info = [bundleInfoDict objectForKey:[aBundle bundlePath]];

    if(info)
    {
        [self dealloc];
        return RETAIN(info);
    }

    dict = [aBundle scriptingInfoDictionary];

    if(!dict)
    {
        NSLog(@"Warning: Bundle '%@' does not provide scripting capabilities.",
              [aBundle bundlePath]);
        [self dealloc];
        return nil;
    }

    ASSIGN(bundle, aBundle);

#if 0                
    /* FIXME: remove observer somewhere */
    [[NSNotificationCenter defaultCenter] 
             addObserver:self
                selector:@selector(_bundleDidLoad:)
                    name:NSBundleDidLoadNotification
                  object:self];
#endif

    flagString = [dict objectForKey:@"STUseAllClasses"];
    flagString = [flagString lowercaseString];

    useAllClasses = [flagString isEqualToString:@"yes"];

    publicClasses = [dict objectForKey:@"STClasses"];

    scriptingInfoClassName = [dict objectForKey:@"STScriptingInfoClass"];

    RETAIN(publicClasses);

    if(!bundleInfoDict)
    {
        bundleInfoDict = [[NSMutableDictionary alloc] init];
    }
    
    [bundleInfoDict setObject:self forKey:[bundle bundlePath]];

    return self;
}

- (void) _bundleDidLoad:(NSNotification *)notif
{
    NSLog(@"Module '%@' loaded", [bundle bundlePath]);

    if([notif object] != self)
    {
        NSLog(@"STBundle: That's not me!");
        return;
    }
    
    allClasses = [[notif userInfo] objectForKey:NSLoadedClasses];
    RETAIN(allClasses);
    
    NSLog(@"All classes are %@");
}

- (NSArray *)publicClassNames
{
    if(useAllClasses)
    {
        if(!allClasses)
        {
            [self _initializeScriptingInfoClass];
        }
        return allClasses;
    }
    else
    {
        return publicClasses;
    }
}
- (NSArray *)allClassNames
{
/*    return allClasses; */
    NSLog(@"Warning: All bundle classes requested, using public classes only.");
    return publicClasses;
}
/* Subclass responsibility */
- (NSDictionary *)namedObjects
{
    if(!scriptingInfoClass)
    {
        [self _initializeScriptingInfoClass];
    }
    
    return [(id)scriptingInfoClass namedObjectsForScripting];
}

- (void)_initializeScriptingInfoClass
{
    scriptingInfoClass = [bundle classNamed:scriptingInfoClassName];

    if(!scriptingInfoClass)
    {
        [NSException raise:@"STBundleException"
                     format:@"Unable to get scripting info class '%@' for "
                            @"bundle '%@'", 
                            scriptingInfoClassName, [bundle bundlePath]];
                     
    }
}
@end
