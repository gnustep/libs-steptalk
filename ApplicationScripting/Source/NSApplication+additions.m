/**
    NSApplication additions
  
    Copyright (c) 2000 Stefan Urbanek
  
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2001 Nov 15
 
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

#import "NSApplication+additions.h"

#import "STScriptsPanel.h"
#import "STTranscript.h"

#import <StepTalk/STBundleInfo.h>

#import <Foundation/NSBundle.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSNotification.h>
#import <Foundation/NSProcessInfo.h>
#import <Foundation/NSString.h>

#import <AppKit/NSPanel.h>

#import "STApplicationScriptingController.h"

static STEnvironment        *STAppScriptingEnvironment = nil;
static NSMutableDictionary  *STAppObjectReferences = nil;
static BOOL                  bundleLoaded;
static NSMutableSet         *scannedBundles;

static STApplicationScriptingController *scriptingController = nil;

@implementation NSApplication(STAppScriptingAdditions)
- (BOOL)initializeApplicationScripting
{
    /* FIXME: make it more human-readable */
    NSRunAlertPanel(@"Scripting is already initialized",
                    @"[NSApp initializeApplicationScripting] is called more than once.",
                    @"Cancel", nil, nil);

    return YES;
}

- (BOOL)setUpApplicationScripting
{
    scriptingController = [[STApplicationScriptingController alloc] init];
    return YES;
}

- (STEnvironment *)scriptingEnvironment
{
    if(!STAppScriptingEnvironment)
    {
        [self _createDefaultScriptingEnvironment];
    }

    [STAppScriptingEnvironment updateReferencesFromDictionary:STAppObjectReferences
                                                       target:[self delegate]];

    return STAppScriptingEnvironment;
}

- (void)_createDefaultScriptingEnvironment
{
    STEnvironment *env = nil;
    STBundleInfo  *info;
    NSString      *path;
    NSString      *str = nil;
    NSString      *reference;
    NSDictionary  *dict;
    id             object;

    NSDebugLog(@"Creating scripting environment");

    scannedBundles = [[NSMutableSet alloc] init];

    info = [STBundleInfo infoForBundle:[NSBundle mainBundle]];

    if(!info)
    {
        NSRunAlertPanel(@"Application does not provide scripting capabilities",
                        @"This application was designed to support "
                        @"scripting, but something went wrong. "
                        @"Check if the file ScriptingInfo.plist exists "
                        @"in application's bundle directory.",
                        @"Cancel", nil, nil);
        return;
    }
    
    [scannedBundles addObject:[NSBundle mainBundle]];

    /* FIXME: use scripting environment from application bundle */
    /*    str = [info objectForKey:@"STEnvironmentDescription"]; */

    if(str && ![str isEqualToString:@""])
    {
        env = [STEnvironment environmentWithDescriptionName:str];
    }
    if(!env)
    {
        NSDebugLog(@"Using default scripting environment");
        env = [STEnvironment defaultScriptingEnvironment];
    }

    [env loadModule:@"AppKit"];
    [env includeBundle:[NSBundle mainBundle]];
    [env setObject:self forName:@"Application"];
    [env setObject:[STTranscript sharedTranscript] forName:@"Transcript"];

    /* FIXME: do this */
    // [self addScriptingInfoFromDictionary:info];

    STAppScriptingEnvironment = RETAIN(env);

    [self updateScriptingInfoFromBundles];

    [[NSNotificationCenter defaultCenter]
                         addObserver:self
                            selector:@selector(updateScriptingInfoOnBundleLoad:)
                                name:NSBundleDidLoadNotification 
                              object:nil];
}
- (void)updateScriptingInfoFromBundles
{
    STEnvironment *env = [self scriptingEnvironment];
    NSEnumerator *enumerator;
    NSDictionary *info;
    NSString     *path;
    NSBundle     *bundle;
    NSSet        *bundles;
    
    NSDebugLog(@"Updating scripting info from bundles");
    
    bundles = [NSMutableSet setWithArray:[NSBundle allBundles]];
    bundles = [bundles minusSet:scannedBundles];
    
    enumerator = [bundles objectEnumerator];
    
    while( (bundle = [enumerator nextObject]) )
    {

        if(![env includeBundle:bundle])
        {
            NSLog(@"Bundle '%@' is not scriptable.",[bundle bundlePath]);
        }
        
        /* FIXME: load STObjects from bundle scripting info */
    }
    
    [scannedBundles unionSet:bundles];
}

- (void)updateScriptingInfoOnBundleLoad:(NSNotification *)notif
{
    [self updateScriptingInfoFromBundles];
}

- (void)addScriptingInfoFromDictionary:(NSDictionary *)info
{
    NSDictionary *dict;
    
    if(!STAppObjectReferences)
    {
        STAppObjectReferences = [[NSMutableDictionary alloc] init];
    }

    [STAppObjectReferences addEntriesFromDictionary: 
                                [info objectForKey:@"STObjectReferences"]];

    dict = [info objectForKey:@"STConstantObjectReferences"];
    
    [STAppScriptingEnvironment updateReferencesFromDictionary:dict
                                                       target:[self delegate]];
}

- (NSString *)applcationNameForScripting
{
    return [[NSProcessInfo processInfo] processName];
}

- (void)orderFrontScriptsPanel:(id)sender
{
    [scriptingController orderFrontScriptsPanel:nil];
}

/** Return scripting menu. The default menu is provided by 
STApplicationScriptingController */
- (NSMenu *)scriptingMenu
{
    return [scriptingController scriptingMenu];
}
/** Set application Scripting menu */
- (void)setScriptingMenu:(NSMenu *)menu
{
    [scriptingController setScriptingMenu:menu];
}

- (void)orderFrontTranscriptWindow:(id)sender
{
    [scriptingController orderFrontTranscriptWindow:nil];
}
- (BOOL)isScriptingSupported
{
    return YES;
}

- (STApplicationScriptingController *)scriptingController
{
    return scriptingController;
}
@end
