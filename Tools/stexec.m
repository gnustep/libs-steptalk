/**
    stexec.m
    Script executor
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2000
   
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

#import <Foundation/NSArray.h>
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSProcessInfo.h>
#import <Foundation/NSString.h>

#include <stdio.h>

@interface Executor:STExecutor
{
    NSString      *envName;
    BOOL           enableFull;
}
@end

@implementation Executor
- (void)createEnvironment
{
    if(!envName || [envName isEqualToString:@""])
    {
        env = [STEnvironment defaultScriptingEnvironment];
    }
    else
    {
        env = [STEnvironment environmentWithDescriptionName:envName];
    }

    [env loadModule:@"Foundation"];
    [env loadModule:@"SimpleTranscript"];
          
    [env setCreatesUnknownObjects:YES];
    
    RETAIN(env);
}

- (int)processOption:(NSString *)option
{
    if ([@"environment" hasPrefix:option])
    {
        RELEASE(envName);

        envName = [self nextArgument];
        if(!envName)
        {
            [NSException raise:STExecutorException
                        format:@"Environment name expected"];
        }
    }
    else if ([@"full" hasPrefix:option])
    {
        enableFull = YES;
    }
    else
    {
         [NSException raise:STExecutorException
                     format:@"Unknown option -%@", option];
    }
    return 0;
}

- (void)beforeExecuting
{
    [env setFullScriptingEnabled:enableFull];
}

- (void) printHelp
{
    printf(
"stexec - execute StepTalk script (in GNUstep-base environment)\n"
"Usage: stexec [options] script [args ...] [ , script ...]\n"
"   Options:\n"
"%s"
"   -full               enable full scripting\n"
"   -environment env    use scripting environment with name env\n",
STExecutorCommonOptions
    );
}
@end

int main(int argc, const char **argv)
{	
    Executor          *executor;
    NSArray           *args;
    NSAutoreleasePool *pool;
    NSProcessInfo     *procInfo;

    pool = [NSAutoreleasePool new];

//    [NSAutoreleasePool enableDoubleReleaseCheck:YES];

    procInfo = [NSProcessInfo processInfo];

    if (procInfo == nil)
    {
        NSLog(@"Unable to get process information");
        RELEASE(pool);
        exit(1);
    }

    executor = [[Executor alloc] init];

    args = [procInfo arguments];
    [executor runWithArguments:args];
    
    RELEASE(executor);
    RELEASE(pool);

    return 0;
}
