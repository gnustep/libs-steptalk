/**
    STConversation
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek
    Date: 2003 Sep 21
   
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

#import "STConversation.h"

#import <Foundation/NSException.h>

#import "STEnvironment.h"
#import "STEngine.h"
#import "STLanguage.h"

// FIXME: add these two:
// @class STDistantEnvironment;
// @class STDistantConversation;

@interface STConcreteLocalConversation:STConversation
{
    STLanguage    *lanuage;
    STEngine      *engine;
    NSString      *languageName;
    STContext     *context;
}
@end

@implementation STConversation
/** Creates a new conversation with environment created using default 
    description and default language. */
+ conversation
{
    STEnvironment *env = [STEnvironment environmentWithDefaultDescription];
    
    NSLog(@"DEPRECATED");
    return AUTORELEASE([[self alloc] initWithContext:env language:nil]);
}
/** Creates a new conversation with environment created using default 
    description and language with name <var>langName</var>. */
+ conversationWithEnvironment:(STEnvironment *)env 
                     language:(NSString *)langName
{
    STConversation *c;

    NSLog(@"Warning: conversationWithEnvironment:language: is deprecated");
/* FIXME: use this:
    if([env isKindOfClass:[STDistantEnvironment class]])
    {
        c = [[STDistantConversation alloc] initWithEnvironment:env language:langName];
    }
    else
    {
        c = [[STConcreteLocalConversation alloc] initWithEnvironment:env language:langName];
    }
*/
    c = [[STConcreteLocalConversation alloc] initWithContext:env language:langName];
 
    return AUTORELEASE(c);
}

- initWithEnvironment:(STEnvironment *)env 
             language:(NSString *)langName
{
    NSLog(@"Warning: initWithEnvironment:language: is deprecated");

    return [self initWithContext:env language:langName];
}

- initWithContext:(STContext *)aContext
         language:(NSString *)aLanguage
{
    [self dealloc];
    
    return [[STConcreteLocalConversation alloc] initWithContext:aContext 
                                                       language:aLanguage];
}

- (void)setLanguage:(NSString *)newLanguage
{
    [self subclassResponsibility:_cmd];
}

/** Return name of the language used in the receiver conversation */
- (NSString *)language
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (STEnvironment *)environment
{
    NSLog(@"Warning: -environment in STConversation is deprecated, use -context");

    [self subclassResponsibility:_cmd];
    return nil;
}
- (id)runScriptFromString:(NSString *)aString
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (BOOL)isResumable
{
    return NO;
}
- (BOOL)resume
{
    [self subclassResponsibility:_cmd];
    return NO;
}

/** Returns all languages that are known in the receiver. Should be used by
    remote calls instead of NSLanguage query which gives local list of
    languages. */
- (NSArray *)knownLanguages
{
    return [STLanguage allLanguageNames];
}
@end

@implementation STConcreteLocalConversation
/** Creates a new conversation with environment created using default 
    description and language with name <var>langName</var>. */
+ conversationWithEnvironment:(STEnvironment *)env 
                   language:(NSString *)langName
{
    STConversation *c;
 
    NSLog(@"WARNING: +[STConversaion conversationWithEnvironment:language:] is deprecated, "
          @" use conversationWithContext:language: instead.");
 
    c = [[self alloc] initWithContext:env language:langName];
    return AUTORELEASE(c);
}

- initWithEnvironment:(STEnvironment *)env 
             language:(NSString *)langName
{
    NSLog(@"WARNING: -[STConversaion initWithEnvironment:language:] is deprecated, "
          @" use initWithContext:language: instead.");

    return [self initWithContext:env language:langName];
}

- initWithContext:(STContext *)aContext
         language:(NSString *)aLanguage
{
    self = [super init];

    if(!aLanguage || [aLanguage isEqual:@""])
    {
        languageName = RETAIN([STLanguage defaultLanguageName]);
    }    
    else
    {
        languageName = RETAIN(aLanguage);
    }
    
    context = RETAIN(aContext);
    return self;
}

- (void)dealloc
{
    RELEASE(languageName);
    RELEASE(context);
    RELEASE(engine);
    [super dealloc];
}

- (void)_createEngine
{
    ASSIGN(engine,[STEngine engineForLanguageWithName:languageName]);
}

- (void)setLanguage:(NSString *)newLanguage
{
    if(![newLanguage isEqual:languageName])
    {
        RELEASE(engine);
        engine = nil;
        ASSIGN(languageName, newLanguage);
    }
}

/** Return name of the language used in the receiver conversation */
- (NSString *)language
{
    return languageName;
}
- (STEnvironment *)environment
{
    NSLog(@"WARNING: -[STConversaion environment] is deprecated, "
          @" use -context instead.");

    return context;
}
- (STContext *)context
{
    return context;
}

- (id)runScriptFromString:(NSString *)aString
{
    if(!engine)
    {
        [self _createEngine];
    }
    return [engine executeCode: aString inEnvironment:context];
}
@end
