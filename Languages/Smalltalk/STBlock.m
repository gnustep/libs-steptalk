/**
    STBlock.m
    Wrapper for STBlockContext to make it invisible from the user  
 
    Copyright (c) 2002 Free Software Foundation
 
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


#import "STBlock.h"
#import "STLiterals.h"
#import "STBlockContext.h"
#import "STBytecodeInterpreter.h"
#import "STStack.h"

#import <StepTalk/STExterns.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>



@implementation STBlock
- initWithInterpreter:(STBytecodeInterpreter *)anInterpreter
          homeContext:(STMethodContext *)context
            initialIP:(unsigned)ptr
                 info:(STBlockLiteral *)info
{
    homeContext = context;
    argCount  = [info argumentCount];
    stackSize = [info stackSize];
    initialIP = ptr;
    interpreter = anInterpreter;
    
    return [super init];
}

- (unsigned)argumentCount
{
    return argCount;
}

- value
{
    if(argCount != 0)
    {
        [NSException  raise:STScriptingException
                     format:@"Block needs %i arguments", argCount];
        return nil;
    }
    return [self valueWithArgs:(id*)0 count:0];
}

- valueWith:arg
{
    id  args[1] = {arg};
    id  retval;

    retval = [self valueWithArgs:args count:1];
    return retval;
}

- valueWith:arg1 with:arg2
{
    id  args[2] = {arg1,arg2};
    id  retval;

    retval = [self valueWithArgs:args count:2];
    return retval;
}

- valueWith:arg1 with:arg2 with:arg3
{
    id  args[3] = {arg1,arg2,arg3};
    id  retval;

    retval = [self valueWithArgs:args count:3];
    return retval;
}

- valueWith:arg1 with:arg2 with:arg3 with:arg4
{
    id  args[4] = {arg1,arg2,arg3,arg4};
    id  retval;

    retval = [self valueWithArgs:args count:4];
    return retval;
}

- (STBlockContext *)createBlockContext
{
    STBlockContext *context;
 
    context = [[STBlockContext alloc] initWithInterpreter:interpreter
                                                initialIP:initialIP
                                                stackSize:stackSize];

    [context setHomeContext:homeContext];
 
    return context;
}
- valueWithArgs:(id *)args count:(unsigned)count;
{
    STBlockContext *context = nil;
    id              retval;

    if(argCount != count)
    {
        [NSException raise:STScriptingException
                    format:@"Invalid block argument count %i, " 
                           @"wants to be %i", count, argCount];
        return nil;
    }

    if(!defaultContext)
    {
        defaultContext = [self createBlockContext];
        
        context = RETAIN(defaultContext);
    }
    else
    {    
        if(!defaultContextInUse)
        {
            context = RETAIN(defaultContext);
            defaultContextInUse = YES;
        }
        else
        {
            context = [self createBlockContext];
        }
    }
    

    NSDebugLLog(@"STExecutionContext",
                @"new block context %@",context);

    retval = [self evaluateInContext:context arguments:args count:count];
    
    if(defaultContext == context)
    {
        defaultContextInUse = NO;
    }

    RELEASE(context);
    
    return retval;
}

- evaluateInContext:(STBlockContext *)context 
          arguments:(id *)args 
              count:(unsigned)count
{
    STStack *stack;
    id       retval;
    int      i;
    
    stack = [context stack];

    for(i=0;i<count;i++)
    {
        [stack push:args[i]];
    }

    retval = [interpreter valueOfBlockContext:context];
    [stack empty];

    return retval;
}

- handler:(STBlock *)handlerBlock
{
    STBlockContext *context;
    id              retval;

    context = [self createBlockContext];

    NS_DURING
        retval = [self evaluateInContext:context arguments:(id *)nil count:0];
    NS_HANDLER
        retval = [handlerBlock valueWith:localException];
        [context forceReturn];
    NS_ENDHANDLER

    RELEASE(context);

    return retval;
}

- whileTrue:(STBlock *)doBlock
{
    id retval;
    
    while([[self value] boolValue])
    {
        retval = [doBlock value];
    }
    return retval;
}

- whileFalse:(STBlock *)doBlock
{
    id retval;
    
    while(! [[self value] boolValue])
    {
        retval = [doBlock value];
    }
    return retval;
}
@end
