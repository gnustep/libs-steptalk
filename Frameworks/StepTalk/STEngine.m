/**
    STEngine.m
    Scripting engine
 
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
 
 */

#import <StepTalk/STEngine.h>

#import <StepTalk/STEnvironment.h>
#import <StepTalk/STExterns.h>
#import <StepTalk/STFunctions.h>
#import <StepTalk/STLanguage.h>
#import <StepTalk/STUndefinedObject.h>

#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>

NSZone *STMallocZone = NULL;

void _STInitMallocZone(void)
{
    if(!STMallocZone)
    {
        STMallocZone = NSCreateZone(NSPageSize(),NSPageSize(),NO);
    }
    
}

@implementation STEngine
+ (void)initialize
{
    _STInitMallocZone();

    if(!STNil)
    {
        STNil = (STUndefinedObject *)NSAllocateObject([STUndefinedObject class],
                                                      0, STMallocZone);
    }
}

/**
    Return a scripting engine for the language used in files of type 
    <var>fileType</var>
*/
+ (STEngine *) engineForFileType:(NSString *)fileType
{
    STLanguage *language = [STLanguage languageForFileType:fileType];

    return [language engine];
}

/**
    Return a scripting engine for language with specified name.
*/
+ (STEngine *) engineForLanguageWithName:(NSString *)name
{
    if(!name)
    {
        NSLog(@"No language name given");
        return NULL;
    }
    
    return [[STLanguage languageWithName:name] engine];
}

- (void)dealloc
{
    RELEASE(defaultEnvironment);
    
    [super dealloc];
}

/** Return the default scripting environment for the engine. */
- (STEnvironment *)defaultEnvironment
{
    return defaultEnvironment;
}

/** Set the default scripting environment for the engine. */
- (void) setDefaultEnvironment:(STEnvironment *)anEnvironment
{
    ASSIGN(defaultEnvironment,anEnvironment);
}

/** Execude source code <var>code</var> in default scripting environment.  */
- (id)  executeCode:(NSString *)code
{
   return [self    executeCode:code 
                 inEnvironment:defaultEnvironment];
}

/** Execude source code <var>code</var> in an environment <var>env</var>. 
    This is the method, that has to be implemented by those who are writing 
    a language engine. 
    <override-subclass /> 
*/
- (id)  executeCode:(NSString *)code 
      inEnvironment:(STEnvironment *)env
{
    [self subclassResponsibility:_cmd];

    return nil;
}

- (BOOL)understandsCode:(NSString *)code 
{
    [self subclassResponsibility:_cmd];

    return NO;
}

- (STMethod *)methodFromSource:(NSString *)sourceString
                   forReceiver:(id)receiver
                 inEnvironment:(STEnvironment *)env
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (id)  executeMethod:(id <STMethod>)aMethod
          forReceiver:(id)anObject
        withArguments:(NSArray *)args
        inEnvironment:(STEnvironment *)env;
{
    [self subclassResponsibility:_cmd];
    return nil;
}

@end
