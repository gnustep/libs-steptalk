/**
    STSmalltalkScriptObject.m
    Object that represents script 
 
    Copyright (c) 2002 Free Software Foundation
 
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

#import "STSmalltalkScriptObject.h"

#import "STBytecodeInterpreter.h"
#import "STCompiledScript.h"

#import <Foundation/NSArray.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSMethodSignature.h>
#import <Foundation/NSString.h>

#import <StepTalk/NSInvocation+additions.h>
#import <StepTalk/STEnvironment.h>
#import <StepTalk/STObjCRuntime.h>
#import <StepTalk/STExterns.h>

@implementation STSmalltalkScriptObject
- initWithEnvironment:(STEnvironment *)env
       compiledScript:(STCompiledScript *)compiledScript
{
    int count = [compiledScript variableCount];
    int i;

    [super init];

    NSDebugLLog(@"STEngine",
                @"creating script object %p with %i ivars",compiledScript,
                count);
                
    environment = RETAIN(env);
    script = RETAIN(compiledScript);
    variables = [[NSMutableArray alloc] initWithCapacity:count];

    for(i=0;i<count;i++)
    {
        [variables addObject:STNil];
    }
    
    return self;
}
- (void)dealloc
{
    RELEASE(interpreter);
    RELEASE(script);
    RELEASE(variables);
    RELEASE(environment);
    
    [super dealloc];
}
- (STCompiledScript *)script
{
    return script;
}
- (void)setInstanceVariable:(id)anObject atIndex:(int)anIndex;
{
    if(anObject == nil)
    {
        anObject = STNil;
    }
    
    [variables replaceObjectAtIndex:anIndex withObject:anObject];
}
- (id)instanceVariableAtIndex:(int)anIndex;
{
    return [[variables objectAtIndex:anIndex] self];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if( [super respondsToSelector:(SEL)aSelector] )
    {
        return YES;
    }
    
    return ([script methodWithName:NSStringFromSelector(aSelector)] != nil);
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *signature = nil;
    
    signature = [super methodSignatureForSelector:sel];

    if(!signature)
    {
        signature = STMethodSignatureForSelector(sel);
    }

    return signature;
}

- (void) forwardInvocation:(NSInvocation *)invocation
{
    STCompiledMethod  *method;
    NSString          *methodName = NSStringFromSelector([invocation selector]);
    NSMutableArray    *args;
    id                arg;
    int               index;
    int               count;
    id                retval = nil;

    if(!interpreter)
    {
        NSDebugLLog(@"STEngine",
                   @"creating new interpreter for script '%@'",
                   name);
        interpreter = [[STBytecodeInterpreter alloc] init];
        [interpreter setEnvironment:environment];
    }
    

    if([methodName isEqualToString:@"exit"])
    {
        [interpreter halt];
        return;
    }

    method = [script methodWithName:methodName];
    
    count = [[invocation methodSignature] numberOfArguments];

    NSDebugLLog(@"STSending",
                @"script object perform: %@ with %i args",
                methodName,count-2);

    args = [NSMutableArray array];
    
    for(index = 2; index < count; index++)
    {
        arg = [invocation getArgumentAsObjectAtIndex:index];
        [args addObject:arg];
    }

    NSDebugLLog(@"STSending",
                @">> forwarding to self ...");

    retval = [interpreter interpretMethod:method 
                              forReceiver:self
                                arguments:args];

    NSDebugLLog(@"STSending",
                @"<< returned from forwarding");

    [invocation setReturnValue:&retval];
}
@end
