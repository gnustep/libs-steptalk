/**
    STScript
  
    Copyright (c) 2002 Stefan Urbanek
  
    Written by: Stefan Urbanek <stefanurbanek@yahoo.fr>
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

#import <StepTalk/STScript.h>

#import <StepTalk/STLanguage.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSUserDefaults.h>

@interface NSDictionary(LocalizedKey)
- (id)localizedObjectForKey:(NSString *)key;
@end

@implementation NSDictionary(LocalizedKey)
- (id)localizedObjectForKey:(NSString *)key
{
    NSEnumerator   *enumerator;
    NSDictionary   *dict = [self objectForKey:key];
    NSString       *language;
    NSArray        *languages;
    id              obj = nil;
    
    languages = [NSUserDefaults userLanguages];

    enumerator = [languages objectEnumerator];

    while( (language = [enumerator nextObject]) )
    {
        obj = [dict objectForKey:language];
        if(obj)
        {
            return obj;
        }
    }

    return [dict objectForKey:@"Default"];
}
@end

@implementation STScript
+ scriptWithFile:(NSString *)file
{
    STScript *script;
    
    script = [[STScript alloc] initWithFile:file];

    return AUTORELEASE(script);
}

- initWithFile:(NSString *)aFile
{
    NSFileManager  *manager = [NSFileManager defaultManager];
    NSDictionary   *info = nil;
    NSString       *infoFile;
    BOOL            isDir;

    infoFile = [aFile stringByDeletingPathExtension];
    infoFile = [infoFile stringByAppendingPathExtension: @"stinfo"];

    if([manager fileExistsAtPath:infoFile isDirectory:&isDir] && !isDir )
    {
        info = [NSDictionary dictionaryWithContentsOfFile:infoFile];
    }

    self = [super init];
    
    fileName = RETAIN(aFile);
    
    localizedName = [info localizedObjectForKey:@"Name"];

    if(!localizedName)
    {
        localizedName = [fileName lastPathComponent];
    }
    
    RETAIN(localizedName);

    menuKey = RETAIN([info localizedObjectForKey:@"MenuKey"]);
    description = RETAIN([info localizedObjectForKey:@"Description"]);
    language = [info localizedObjectForKey:@"Language"];

    if(!language)
    {
        language = [STLanguage languageNameForFileType:[fileName pathExtension]];
    }
    if(!language)
    {
        language = @"Unknown";
    }
    
    RETAIN(language);
    
    return self;
}

- (void)dealloc
{
    RELEASE(fileName);
    RELEASE(localizedName);
    RELEASE(menuKey);
    RELEASE(description);
    RELEASE(language);
    [super dealloc];
}

- (NSString *)fileName
{
    return fileName;
}
- (NSString *)menuKey
{
    return menuKey;
}

- (NSString *)source
{
    return [NSString stringWithContentsOfFile:fileName];
}

- (NSString *)scriptName
{
    return fileName;
}

- (NSString *)localizedName
{
    return localizedName;
}

- (NSString *)description
{
    return description;
}

- (NSString *)language
{
    return language;
}
@end
