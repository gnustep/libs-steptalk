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

#import <Foundation/NSException.h>
#import <Foundation/NSString.h>

#import <AppKit/NSApplication.h>

#import <StepTalk/STEngine.h>
#import <StepTalk/STEnvironment.h>
#import <StepTalk/STLanguage.h>
#import <StepTalk/STScript.h>

#import "STScriptsPanel.h"
#import "STTranscript.h"
#import "NSObject+NibLoading.h"

@implementation STApplicationScriptingController
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
        if(![self loadMyNibNamed:@"ScriptingMenu"])
        {
            return nil;
        }
    }
    NSLog(@"Scripting menu: %@", scriptingMenu);
    return scriptingMenu;
}

- (id)executeScript:(STScript *)script
{
    STEnvironment  *env = [self actualScriptingEnvironment];
    STEngine       *engine;
    NSString       *error;
    id             retval;
    
    NSLog(@"Execute script a '%@'", [script localizedName]);

    engine = [STEngine engineForLanguageWithName:[script language]];
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
#ifndef DEBUG_EXCEPTIONS
    NS_DURING
#endif
        retval = [engine executeCode:[script source] inEnvironment:env];

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

- (id)executeScriptString:(NSString *)source
            inEnvironment:(STEnvironment *)env
{
    STEngine       *engine;
    NSString       *error;
    id             retval = nil;
    
    engine = [STEngine engineForLanguageWithName:
                            [STLanguage defaultLanguageName]];
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

    NS_DURING
        NSLog(@"Execute '%@'", source);
        retval = [engine executeCode:source inEnvironment:env];
        NSLog(@"Pre-returned %@", retval);
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
    
        NSLog(@"HERE 4");
    return retval;
}
@end
