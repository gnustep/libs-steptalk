/**
    STShell
    StepTalk Shell
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2002 May 29
   
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

#import "STShell.h"

#import <StepTalk/StepTalk.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

#include <readline/readline.h>

static Class NSString_class;
static Class NSNumber_class;

NSArray *objcSelectors = nil;

static STShell *sharedShell = nil;

int complete_handler(void)
{
    return [sharedShell completition];
}

@implementation STShell
+ (void)initialize
{
    NSString_class = [NSString class];
    NSNumber_class = [NSNumber class];
}
+ sharedShell
{
    if(!sharedShell)
    {
        sharedShell = [[STShell alloc] init];
    }
    return sharedShell;
}
- init
{
    self = [super init];
    
    [self initReadline];

    /* FIXME: update on change */
    objcSelectors = RETAIN(STAllObjectiveCSelectors());
    
    objectStack = [[NSMutableArray alloc] init];
    
    prompt = @"StepTalk > ";
    
    return self;
}

- (void)initReadline
{
    rl_initialize();
    rl_bind_key('\t', complete_handler);
}

- (void)setLanguage:(NSString *)langName
{
    NSDebugLog(@"Setting language to %@", langName);

    RELEASE(engine);
    engine = [STEngine engineForLanguageWithName:langName];
     RETAIN(engine);
}

- (void)setEnvironment:(STEnvironment *)newEnv
{
    ASSIGN(env, newEnv);
}

- (STEnvironment *)environment
{
    return env;
}

- (void)run
{
    NSString *line;
    id        result;
        
    [env setCreatesUnknownObjects:YES];

    [env setObject:self forName:@"Shell"];
    [env setObject:self forName:@"Transcript"];
    [env setObject:objectStack forName:@"Objects"];

    [self showLine:@"Welcome to the StepTalk shell."];
    
    while(1)
    {
        line = [self readLine];

        if(exitRequest)
            break;

        if(!line)
            continue;

        result = [self executeLine:line];

        if(result)
        {
            [objectStack addObject:result];
            [self showResult:result];
        }
        else
        {
            [self showResult:result];
        }
        
    }
    printf("\n");
}
- (id)executeLine:(NSString *)line
{
    id result = nil;

    /* FIXME: why? */
    line = [line stringByAppendingString:@" "];
    NS_DURING
        result = [engine executeCode:line inEnvironment:env];
    NS_HANDLER
        [self showException:localException];
    NS_ENDHANDLER

    return result;
}

- (NSString *)readLine
{
    const char *str;
    NSString   *actualPrompt = prompt;
    NSString   *line = @"";
    BOOL        done = NO;
    int         len;
    
    while(!done)
    {
        str = readline([actualPrompt cString]);
        done = YES;

        if(!str)
        {
            exitRequest = YES;
            return nil;
        }

        len = strlen(str);
        if(!len)
            return nil;
        
        if(str[len-1] == '\\')
        {
            actualPrompt = @"... ? ";
            str[strlen(str) - 1] = '\0';
            done = NO;
        }
         
        line = [line stringByAppendingString:[NSString stringWithCString:str]];
    }

    add_history([line cString]);
    
    return line;
}

- (int)completition
{
    NSEnumerator *enumerator;
    NSMutableSet *set;
    NSString     *match;
    NSString     *tail;
    NSString     *str;
    NSArray      *array;
    int pos = 0;
    int c;
    
    if(rl_point <= 0)
    {
        return 0;
    }
    
    pos = rl_point - 1;
    c = rl_line_buffer[pos];
    
    while((isalnum(c) || c == '_') && pos >= 0)
    {
        pos--;
        c = rl_line_buffer[pos];
    }
    pos++;

    match = [NSString stringWithCString:rl_line_buffer + pos
                                 length:rl_point - pos];

    set = [NSMutableSet set];
    
    enumerator = [[env allObjectsDictionary] keyEnumerator];
    while( (str = [enumerator nextObject]) )
    {
        if( [str hasPrefix:match] )
        {
            [set addObject:str];
        }
    }
    
    /* FIXME: update on change */
    array = objcSelectors;

    enumerator = [array objectEnumerator];
    while( (str = [enumerator nextObject]) )
    {
        if( [str hasPrefix:match] )
        {
            [set addObject:str];
        }
    }

    array = [set allObjects];

    if( [array count] == 0 )
    {
        printf("\nNo match for completition.\n");
        rl_forced_update_display();
    }
    else if ( [array count] == 1 )
    {
        str = [array objectAtIndex:0];
        str = [str substringFromIndex:rl_point - pos];
        rl_insert_text([str cString]);
        rl_insert_text(" ");

        rl_redisplay();
    }
    else
    {
        enumerator = [array objectEnumerator];

        tail = [enumerator nextObject];
        
        while( (str = [enumerator nextObject]) )
        {
            tail = [str commonPrefixWithString:tail options:NSLiteralSearch];
        }
        
        tail = [tail substringFromIndex:[match length]];

        if( tail && ![tail isEqualToString:@""] )
        {
            rl_insert_text([tail cString]);
            rl_redisplay();
        }
        else
        {
            printf("\n");
            enumerator = [array objectEnumerator];
            while( (str = [enumerator nextObject]) )
            {
                printf("%s\n", [str cString]);
            }
            rl_forced_update_display();
        }
    }


    return 0;
}

- show:(id)anObject
{
    printf("%s", [[anObject description] cString]);

    return self;
}
- showLine:(id)anObject
{
    [self show:anObject];
    putchar('\n');
    
    return nil;
}
- showResult:(id)anObject
{
    if(anObject)
    {
        printf("%i: ", [objectStack count] - 1);
        [self show:anObject];
        putchar('\n');
    }

    return self;
}
- showException:(NSException *)exception
{
    printf("Error (%s): %s\n", 
            [[exception name] cString], 
            [[exception reason] cString]);

    
    return self;
}
- (id)listObjects
{
    int i;
    id  object;
    NSString *str;
    
    printf("Objects\n");
    for(i = 0; i < [objectStack count]; i++)
    {
        object = [objectStack objectAtIndex:i];
        
        str = [object description];
        
        if( [str length] > 40 )
        {
            str = [str substringToIndex:40];
            str = [str stringByAppendingString:@"..."];
        }
        
        printf("%4i: '%s' (%s)\n", i,
                [str cString],
                [[[object class] description] cString]);
    }
    return nil;
}

- (void)exit
{   
    /* FIXME: this is not nice */
    exit(0);
}
@end
