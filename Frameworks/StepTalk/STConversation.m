/**
    STConversation
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
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

#import "STEngine.h"
#import "STEnvironment.h"
#import "STLanguage.h"

@implementation STConversation
/** Creates a new conversation with environment created using default 
    description and default language. */
+ conversation
{
    STEnvironment *env = [STEnvironment environmentWithDefaultDescription];
    
    return AUTORELEASE([[self alloc] initWithEnvironment:env language:nil]);
}
/** Creates a new conversation with environment created using default 
    description and language with name <var>langName</var>. */
+ conversationWithEnvironment:(STEnvironment *)env 
                   language:(NSString *)langName
{
    STConversation *c;
    c = [[self alloc] initWithEnvironment:env language:langName];
    return AUTORELEASE(c);
}

- initWithEnvironment:(STEnvironment *)env 
             language:(NSString *)langName
{
    self = [super init];

    if(!env)
    {
        [NSException raise:@"STConversationException"
                     format:@"Unspecified environment for a conversation"];
        [self dealloc];
        return nil;
    }

    if(!langName || [langName isEqual:@""])
    {
        languageName = RETAIN([STLanguage defaultLanguageName]);
    }    
    else
    {
        languageName = RETAIN(langName);
    }
    
    environment = RETAIN(env);
    return self;
}

- (void)dealloc
{
    RELEASE(languageName);
    RELEASE(environment);
    RELEASE(engine);
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
    return environment;
}
- (id)runScriptFromString:(NSString *)aString
{
    if(!engine)
    {
        [self _createEngine];
    }
    NSLog(@"Run script in %@", environment);
    return [engine executeCode: aString inEnvironment:environment];
}
@end
