/**
    stupdate_languages.m
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2002
   
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
#import "STExecutor.h"

#import <StepTalk/StepTalk.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSException.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSProcessInfo.h>
#import <Foundation/NSString.h>

#include <stdio.h>

NSFileManager *fm;

BOOL create_directory(NSString *path)
{
    NSString *par = [path stringByDeletingLastPathComponent];

    if( [fm fileExistsAtPath:path] )
    {
        return YES;
    }
    else if( ![fm fileExistsAtPath:par] )
    {
        if(!create_directory(par))
        {
            return NO;
        }
    }

    return [fm createDirectoryAtPath:path attributes:nil];
}

void update_languages(void)
{
    NSArray             *langNames = [STLanguage allLanguageNames];
    NSString            *path = STUserConfigPath();
    STLanguage          *lang;
    NSString            *langName;
    NSEnumerator        *enumerator;
    NSArray             *types;
    NSEnumerator        *typeenum;
    NSString            *type;
    NSMutableDictionary *typeDict;
    NSDictionary        *dict;
    typeDict = (id)[NSMutableDictionary dictionary];
    enumerator = [langNames objectEnumerator];
    
    NSLog(@"Updating languages...");
    
    while( (langName = [enumerator nextObject]) )
    {
        lang = [STLanguage languageWithName:langName];
        types = [[lang infoDictionary] objectForKey:@"STFileTypes"];

        typeenum = [types objectEnumerator];
        while( (type = [typeenum nextObject]) )
        {
            [typeDict setObject:langName forKey:type];
        }
    }
        
    dict = [NSDictionary dictionaryWithObject:typeDict
                                       forKey:@"STFileTypes"];

    if(!create_directory(path))
    {
        NSLog(@"Unable to create directory '%@'", path);
        return;
    }

    path = [path stringByAppendingPathComponent:STLanguagesConfigFile];
    
    [dict writeToFile:path atomically:YES];

    if([dict count] == 0)
    {
        NSLog(@"No StepTalk language bundles found.");
    }
}


int main(int argc, const char **argv)
{	
    NSAutoreleasePool *pool;

    pool = [NSAutoreleasePool new];

    fm = [NSFileManager defaultManager];

    update_languages();

    RELEASE(pool);

    return 0;
}
