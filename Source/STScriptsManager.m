/**
    STScriptsManager
  
    Copyright (c)2002 Stefan Urbanek
  
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2002 Mar 10
 
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

#import <StepTalk/STScriptsManager.h>

#import <StepTalk/STExterns.h>
#import <StepTalk/STScript.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSBundle.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSException.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSPathUtilities.h>
#import <Foundation/NSProcessInfo.h>
#import <Foundation/NSString.h>

static STScriptsManager *sharedScriptsManager = nil;

@implementation STScriptsManager

+ (NSString *)defaultScriptsDomainName
{
    return [[NSProcessInfo processInfo] processName];
}

+ defaultManager
{
    if(!sharedScriptsManager)
    {
        sharedScriptsManager = [[STScriptsManager alloc] init];
    }
    
    return sharedScriptsManager;
}

- init
{
    return [self initWithDomainName:nil];
}

/**
    Initializes the receiver to be used with domain named <var>name</var>.
    If <var>name</var> is nil, default scripts domain name will be used.
    
    <init />
*/
- initWithDomainName:(NSString *)name
{
    self = [super init];
    
    if(!name)
    {
        name = [STScriptsManager defaultScriptsDomainName];
    }
    
    scriptsDomainName = RETAIN(name);

    return self;
}

- (void)dealloc
{
    RELEASE(scriptsDomainName);
    [super dealloc];
}

- (NSString *)scriptsDomainName
{
    return scriptsDomainName;
}

/**
    Retrun an array of script search paths. Scripts are searched 
    in Library/StepTalk/Scripts/<var>scriptsDomainName</var>, 
    Library/StepTalk/Scripts/Shared and in all loaded bundles in 
    <var>bundlePath</var>/Resources/Scripts.
*/

- (NSArray *)scriptSearchPaths
{
    NSMutableArray *scriptPaths = [NSMutableArray array];
    NSEnumerator   *enumerator;
    NSString       *path;
    NSString       *str;
    NSArray        *paths;
    NSBundle       *bundle;
    
    enumerator = [[NSBundle allBundles] objectEnumerator];
    
    while( (bundle = [enumerator nextObject]) )
    {
        path = [bundle resourcePath];
        path = [path stringByAppendingPathComponent:@"Scripts"];
        [scriptPaths addObject:path];
    }

    paths = NSStandardLibraryPaths();

    enumerator = [paths objectEnumerator];

    while( (path = [enumerator nextObject]) )
    {
        path = [path stringByAppendingPathComponent:STLibraryDirectory];
        path = [path stringByAppendingPathComponent:@"Scripts"];

        str = [path stringByAppendingPathComponent: scriptsDomainName];
        [scriptPaths addObject:str];

        str = [path stringByAppendingPathComponent:@"Shared"];
        [scriptPaths addObject:str];
    }
    
    /*
    str = [[NSBundle mainBundle] resourcePath];
    [scriptPaths addObject:[str stringByAppendingPathComponent:@"Scripts"]];
    */
    
    return [NSArray arrayWithArray:scriptPaths];
}

- (NSArray *)validScriptSearchPaths
{
    NSMutableArray *scriptPaths = [NSMutableArray array];
    NSFileManager  *manager = [NSFileManager defaultManager];
    NSEnumerator   *enumerator;
    NSString       *path;
    NSArray        *paths;
    BOOL            isDir;
 
    paths = [self scriptSearchPaths];
    
    enumerator = [paths objectEnumerator];

    while( (path = [enumerator nextObject]) )
    {
        if( [manager fileExistsAtPath:path isDirectory:&isDir] && isDir )
        {
            [scriptPaths addObject:path];
        }
    }

    return [NSArray arrayWithArray:scriptPaths];
}

/**
    Get a script with name <var>aString</var> for current scripting domain. 
*/
- (STScript *)scriptWithName:(NSString*)aString
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSEnumerator  *pEnumerator;
    NSEnumerator  *sEnumerator;
    NSString      *path;
    NSString      *file;
    NSString      *str;
    NSArray       *paths;

    paths = [self validScriptSearchPaths];

    pEnumerator = [paths objectEnumerator];

    while( (path = [pEnumerator nextObject]) )
    {
        sEnumerator = [[manager directoryContentsAtPath:path] objectEnumerator];
        
        while( (file = [sEnumerator nextObject]) )
        {

            if( ! [[file pathExtension] isEqualToString:@"stinfo"] )
            {
                NSDebugLLog(@"STScriptManager", @"Script %@", file);

                str = [file lastPathComponent];
                str = [str stringByDeletingPathExtension];

                if([str isEqualToString:aString])
                {
                    return [STScript scriptWithFile:
                                   [path stringByAppendingPathComponent:file]];
                }
            }
        }

    }
    
    return nil;
}
@end
