/**
    STApplicationScriptingController
  
    Copyright (c)2002 Stefan Urbanek
  
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2003 Jan 26
 
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

#import "STApplicationScriptingController.h"

#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>
#import <Foundation/NSString.h>
#import <Foundation/NSKeyValueCoding.h>

#import <AppKit/NSApplication.h>

#import <StepTalk/STBundleInfo.h>
#import <StepTalk/STEngine.h>
#import <StepTalk/STEnvironment.h>
#import <StepTalk/STLanguageManager.h>
#import <StepTalk/STFileScript.h>

#import "STScriptsPanel.h"
#import "STTranscript.h"
#import "NSObject+NibLoading.h"
#import "NSApplication+additions.h"

@implementation STApplicationScriptingController
- init
{
    if ((self = [super init]) != nil)
    {
        STBundleInfo *info;

        info = [STBundleInfo infoForBundle:[NSBundle mainBundle]];
        objectRefereceDict = RETAIN([info objectReferenceDictionary]);
    }
    return self;
}
- (void)dealloc
{
    RELEASE(objectRefereceDict);
    [super dealloc];
}
- (void)createScriptsPanel
{
    scriptsPanel = [[STScriptsPanel alloc] init];
    [scriptsPanel setDelegate:self];
}

- (void)orderFrontScriptsPanel:(id)sender
{
    if(!scriptsPanel)
    {
        [self createScriptsPanel];
    }
    [scriptsPanel makeKeyAndOrderFront:self];
}
- (void)orderFrontTranscriptWindow:(id)sender
{
    [[[STTranscript sharedTranscript] window] makeKeyAndOrderFront:self];
}

- (STEnvironment *)actualScriptingEnvironment
{
    SEL            sel = @selector(scriptingEnvironment);
    id             target;

    target = [NSApp delegate];

    if( ! [target respondsToSelector:sel] )
    {
        if( [NSApp respondsToSelector:sel] )
        {
            target = NSApp;
        }
        else
        {
            NSLog(@"Application is not scriptable");
            return nil;
        }
    }

    return [target scriptingEnvironment];
}

- (void)setScriptingMenu:(NSMenu *)menu
{
    ASSIGN(scriptingMenu, menu);
}
- (NSMenu *)scriptingMenu
{
    if(!scriptingMenu)
    {
        // FIXME ScriptingMenu replaces the application's main menu when it is
        // loaded, since GNUstep stubbornly considers the first top level menu
        // in a gorm file to be the application's main menu.
        NSMenu *mainMenu = RETAIN([NSApp mainMenu]);
        NS_DURING
        {
            if(![self loadMyNibNamed:@"ScriptingMenu"])
            {
                [NSApp setMainMenu:mainMenu];
                RELEASE(mainMenu);
                return nil;
            }
        }
        NS_HANDLER
        {
            [NSApp setMainMenu:mainMenu];
            RELEASE(mainMenu);
            [localException raise];
        }
        NS_ENDHANDLER
        [NSApp setMainMenu:mainMenu];
        RELEASE(mainMenu);
	[scriptingMenu close];
    }
    return scriptingMenu;
}

/* FIXME: rewrite this */
- (void)updateObjectReferences
{
    STEnvironment  *env = [self actualScriptingEnvironment];
    NSEnumerator *enumerator;
    NSString     *name;
    NSString     *object = nil;
    NSString     *reference;
    id            target;
    
    target = [NSApp delegate];
    
    enumerator = [objectRefereceDict keyEnumerator];
    
    while( (name = [enumerator nextObject]) )
    {
        reference = [objectRefereceDict objectForKey:name];

        NSLog(@"Adding reference '%@' object '%@'", name, reference);
        
        NS_DURING
            object = [target valueForKeyPath:reference];
            [env setObject:object forName:name];
        NS_HANDLER
            if([[localException name] isEqualToString:NSUndefinedKeyException])
            {
                NSLog(@"Warning: Invalid object reference '%@'.", reference);
            }
            else
            {
                [localException raise];
            }
        NS_ENDHANDLER
    }
}

/** Execute script <var>script</var> in actual scripting environment. If an 
    exception occured, it will be logged into the Transcript window. */
- (id)executeScript:(STFileScript *)script
{
    STEnvironment  *env = [self actualScriptingEnvironment];
    STEngine       *engine;
    NSString       *error;
    id             retval;
    
    NSDebugLog(@"Execute a script '%@'", [script localizedName]);

    engine = [STEngine engineForLanguage:[script language]];

    if(!engine)
    {
        NSLog(@"Unable to get scripting engine for language '%@'",
              [script language]);

        return nil;
    }

    if(!env)
    {
        NSLog(@"No scripting environment");
        return nil;
    }
    
    NSDebugLog(@"Updating references");
    [self updateObjectReferences];

#ifndef DEBUG_EXCEPTIONS
    NS_DURING
#endif
        retval = [engine interpretScript:[script source] inContext:env];

#ifndef DEBUG_EXCEPTIONS
    NS_HANDLER

        error = [NSString stringWithFormat:
                            @"Error: "
                            @"Execution of script '%@' failed. %@. (%@)",
                            [script localizedName],
                            [localException reason],
                            [localException name]];

        [[STTranscript sharedTranscript] showError:error];

        retval = nil;
    NS_ENDHANDLER
#endif
    
    return retval;
}

/** Execute script string <var>source</var> in environment <var>env</var>. */
- (id)executeScriptString:(NSString *)source
            inEnvironment:(STEnvironment *)env
{
    STEngine       *engine;
    NSString       *error;
    id             retval = nil;
    
    engine = [STEngine engineForLanguage:
                            [[STLanguageManager defaultManager] defaultLanguage]];
    if(!engine)
    {
        NSLog(@"Unable to get scripting engine.");
        return nil;
    }

    if(!env)
    {
        NSLog(@"No scripting environment");
        return nil;
    }

    NSLog(@"Updating references");
    [self updateObjectReferences];

    NS_DURING
        retval = [engine interpretScript:source inContext:env];
    NS_HANDLER
        error = [NSString stringWithFormat:
                            @"Error: "
                            @"Execution of script failed. %@. (%@)",
                            [localException reason],
                            [localException name]];

        [[STTranscript sharedTranscript] showError:error];

        NSLog(@"Script exception: %@", error);

        retval = nil;
    NS_ENDHANDLER

    return retval;
}
@end
