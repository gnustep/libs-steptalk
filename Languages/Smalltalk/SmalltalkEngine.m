/**
    SmalltalkEngine
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2001 Oct 24
 
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

#import "SmalltalkEngine.h"

#import "STCompiler.h"
#import "STCompiledCode.h"
#import "STCompiledMethod.h"
#import "STCompiledScript.h"
#import "STBytecodeInterpreter.h"

#import <StepTalk/STEnvironment.h>
#import <StepTalk/STMethod.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>

@implementation SmalltalkEngine
- (BOOL)canExecuteCode:(NSString *)sourceCode
{
    STCompiler            *compiler;
    STCompiledScript      *script = nil;
    BOOL                   retval = NO;

    compiler = [[STCompiler alloc] init];

    NS_DURING
        script = [compiler compileString:sourceCode];
    NS_HANDLER
        NSLog(@"Smalltalk: Ignoring: %@", [localException reason]);
    NS_ENDHANDLER

    if(script)
    {
        retval = YES;
    }
    
    RELEASE(compiler);
    
    return retval;
}

- (id) executeCode:(NSString *)sourceCode 
       inEnvironment:(STEnvironment *)env
{
    STCompiler            *compiler;
    STCompiledScript      *script;
    id                     retval = nil;

    compiler = [[STCompiler alloc] init];

    [compiler setEnvironment:env];

    script = [compiler compileString:sourceCode];
    retval = [script executeInEnvironment:env];

    AUTORELEASE(compiler);

    return retval;
}

- (id <STMethod>)methodFromSource:(NSString *)sourceString
                   forReceiver:(id)receiver
                 inEnvironment:(STEnvironment *)env
{
    STCompiler   *compiler;
    id <STMethod> method;
    
    compiler = [STCompiler compilerWithEnvironment:env];
    
    method = [compiler compileMethodFromSource:sourceString
                                   forReceiver:receiver];

    return method;
}
- (id)  executeMethod:(id <STMethod>)aMethod
          forReceiver:(id)anObject
        withArguments:(NSArray *)args
        inEnvironment:(STEnvironment *)env
{
    STBytecodeInterpreter *interpreter;
    id                     result;
    interpreter = [STBytecodeInterpreter interpreterWithEnvrionment:env];

    result = [interpreter interpretMethod:(STCompiledMethod *)aMethod
                              forReceiver:anObject
                                arguments:args];
    return result;
}
@end
