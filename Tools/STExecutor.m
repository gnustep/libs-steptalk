/**
    STExecutor.m
    Common class for stalk and stexec tools
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2001
   
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

#import "STExecutor.h"

#import <StepTalk/StepTalk.h>

#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSException.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSFileManager.h>


NSString *STExecutorException = @"STExecutorException";

const char *STExecutorCommonOptions = 
"   -help               print this message\n"
"   -list-all-objects   list all available objects\n"
"   -list-classes       list available classes\n"
"   -list-objects       list named instances\n\n"
"   -language lang      force use of language lang\n"
"   -list-languages     list available languages\n"
"   -continue           do not stop when one of scripts failed to execute\n\n";
//"   -set obj=value    define named object 'obj' with string value 'value'\n"

@implementation STExecutor
- (void)createEnvironment
{
    [self subclassResponsibility:_cmd];
}

- (void) dealloc
{
    RELEASE(conversation);
    [super dealloc];
}

- (void)executeScripts
{
#ifndef DEBUG
    NSString       *logFmt = @"'%@': execution failed, reason: %@";
#endif
    NSMutableArray *scriptArgs;
    NSString       *script;
    NSString       *arg;
    
    script = [self nextArgument];

    if(!script)
    {
        NSLog(@"No script name specified");
        return;
    }

    scriptArgs = [NSMutableArray array];

    do
    {
        [scriptArgs removeAllObjects];
        arg = [self nextArgument];
        while(![arg isEqualToString:@","] && arg != nil)
        {
            [scriptArgs addObject:arg];
            arg = [self nextArgument];
        }

#ifndef DEBUG
        NS_DURING
#endif

            [self executeScript:script withArguments:scriptArgs];

#ifndef DEBUG
        NS_HANDLER
            if(contFlag)
            {
                NSLog(logFmt,script,[localException reason]);
            }
            else
            {
                [localException raise];
            }
        NS_ENDHANDLER
#endif

    } while( (script = [self nextArgument]) );
}

- (void)executeScript:(NSString *)file withArguments:(NSArray *)args;
{
    NSFileManager *manager = [NSFileManager defaultManager];
    STEnvironment *env;
    NSString      *convLanguageName;    
    
    if( [manager fileExistsAtPath:file isDirectory:NO] )
    {
        NSString *source = [NSString stringWithContentsOfFile:file];

        if(langName)
        {
            NSDebugLog(@"Using language %@", langName);

            [conversation setLanguage:langName];
        }
        else
        {
            NSDebugLog(@"Using language for file extension %@", 
                       [file pathExtension]);

            convLanguageName = [STLanguage languageNameForFileType:[file pathExtension]];
            [conversation setLanguage:convLanguageName];
        }
        

        if(conversation)
        {
            NSDebugLog(@"Executing file '%@'",file);

            env = [conversation environment];
            [env setObject:args forName:@"Args"];
            [env setObject:env forName:@"Environment"];
            
            [conversation runScriptFromString:source];
        }
        else
        {
            [NSException  raise:STExecutorException
                 format:@"Unable to create a StepTalk conversation."];

        }
    }
    else
    {
        [NSException  raise:STExecutorException
                     format:@"Could not find script '%@'", file];
    }
}

- (void)listLanguages
{
    NSArray      *languages;    
    NSEnumerator *enumerator;
    NSString     *name;
    
    languages = [STLanguage allLanguageNames];

    enumerator = [languages objectEnumerator];    
    
    while( (name = [enumerator nextObject]) )
    {
        printf("%s\n", [name cString]);
    }
}

- (NSString *)nextArgument
{
    if(currentArg < [arguments count])
    {
        return [arguments objectAtIndex:currentArg++];
    }
    
    return nil;
}

- (void)reuseArgument
{
    currentArg--;
}

- (void)listObjects
{
    NSEnumerator *enumerator;
    NSDictionary *dict;
    NSString     *name;
    NSArray      *objects;    

    dict = [[conversation environment] objectDictionary];
    
    objects = [[dict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    enumerator = [objects objectEnumerator];    
    
    if(listObjects == STListAll)
    {
        while( (name = [enumerator nextObject]) )
        {
            printf("%s\n", [name cString]);
        }
    }
    else if (listObjects == STListClasses)
    {
        while( (name = [enumerator nextObject]) )
        {
            if([[dict objectForKey:name] isClass])
            {
                printf("%s\n", [name cString]);
            }
        }
    }
    else /* (listObjects == STListInstances) */
    {
        while( (name = [enumerator nextObject]) )
        {
            if(! [[dict objectForKey:name] isClass])
            {
                printf("%s\n", [name cString]);
            }
        }
    }
    
}

- (int)parseOptions
{
    BOOL      isOption = NO;
    NSString *arg;

    listObjects = STListNone;

    while( (arg = [self nextArgument]) )
    {
        isOption = NO;
        if( [arg hasPrefix:@"--"] )
        {
            arg = [arg substringFromIndex:2];
            isOption = YES;
        }
        else if( [arg hasPrefix:@"-"] )
        {
            arg = [arg substringFromIndex:1];
            isOption = YES;
        }
        
        if ([@"help" hasPrefix:arg])
        {
            [self printHelp];
            return 1;
        }
        else if ([@"list-languages" hasPrefix:arg])
        {
            [self listLanguages];
            return 1;
        }
/*
        else if ([@"list-engines" hasPrefix:arg])
        {
            [self listEngines];
            return 1;
        }
        */
        
        else if ([@"list-objects" hasPrefix:arg])
        {
            listObjects = STListObjects;
        }
        else if ([@"list-classes" hasPrefix:arg])
        {
            listObjects = STListClasses;
        }
        else if ([@"list-all-objects" hasPrefix:arg])
        {
            listObjects = STListAll;
        }
        else if ([@"continue" hasPrefix:arg])
        {
            contFlag = YES;
        }
        else if ([@"language" hasPrefix:arg])
        {
            RELEASE(langName);

            langName = [self nextArgument];
            if(!langName)
            {
                [NSException raise:STExecutorException
                            format:@"Language name expected"];
            }
        }
        else
        {
            if(!isOption)
            {
                break;
            }
            else
            {
                if( [self processOption:arg] )
                {
                    return 1;
                }
            }
        }
	}
    
    if(arg)
    {
        [self reuseArgument];
    }
    
    return 0;
}

- (void)beforeExecuting
{
}

- (void)afterExecuting
{
}

- (void)runWithArguments:(NSArray *)args
{
    arguments = RETAIN(args);
    currentArg = 1;
    
    if([self parseOptions])
    {
        return;
    }

    [self beforeExecuting];

    [self createConversation];
    [self executeScripts];
    
    [self afterExecuting];

    if(listObjects != STListNone)
    {
        [self listObjects];
    }
}

- (void)printHelp
{
    [self subclassResponsibility:_cmd];
}

- (int)processOption:(NSString *)option
{
    [self subclassResponsibility:_cmd];
    
    return 0;
}
- (void)createConversation
{
    [self subclassResponsibility:_cmd];
}
@end
