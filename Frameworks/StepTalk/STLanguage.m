/**
    STLanguage.m
    StepTalk language bundle
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2001 Oct 24
 
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

#import <StepTalk/STLanguage.h>

#import <StepTalk/STEngine.h>
#import <StepTalk/STExterns.h>
#import <StepTalk/STFunctions.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSTask.h>
#import <Foundation/NSUserDefaults.h>

static NSDictionary *fileTypeDictionary = nil;

@implementation STLanguage
/** Returns an array containing the names of all available languages*/
+ (NSArray *)allLanguageNames
{
    NSArray        *bundles;
    NSEnumerator   *enumerator;
    NSString       *path;
    NSMutableArray *languages = [NSMutableArray array];
    STLanguage     *lang;
    
    bundles = STFindAllResources(STLanguageBundlesDirectory, 
                              STLanguageBundleExtension);

    enumerator = [bundles objectEnumerator];    
    
    while( (path = [enumerator nextObject]) )
    {
        lang = [STLanguage languageWithPath:path];
        
        [languages addObject:[lang languageName]];        
    }
    
    return AUTORELEASE([languages copy]);
}

/** Returns the name of default scripting language specified by the
    STDefaultLanguageName default. If there is no such default in user's
    defaults database, then Smalltalk is used. */

+ (NSString *)defaultLanguageName
{
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSString       *name= [defs objectForKey:@"STDefaultLanguageName"];
    
    if(!name)
    {
        return @"Smalltalk";
    }
    else
    {
        return name;
    }
}

/** Returns language bundle for a language with name <var>languageName</var> */
+ languageWithName:(NSString *)languageName
{
    NSString   *file = STFindResource(languageName, STLanguageBundlesDirectory,
                                      STLanguageBundleExtension);
    if(!file)
    {
        NSLog(@"Could not find language with name '%@'", languageName);
        return nil;
    }
    
    return [self languageWithPath:file];

}

/** Returns language bundle for language with name <var>languageName</var>. */
+ languageWithPath:(NSString *)path
{
    if(!path)
    {
        return nil;
    }

    return AUTORELEASE([[STLanguage alloc] initWithPath:path]);
}
/** Update information about handling various files with StepTalk. */
+ (NSDictionary *)updateFileTypeDictionary
{
    NSString      *path = STUserConfigPath();
    NSFileManager *fm = [NSFileManager defaultManager];
    NSTask        *task;
    NSDictionary  *dict;

    RELEASE(fileTypeDictionary);
    
    path = [path stringByAppendingPathComponent:STLanguagesConfigFile];

    if( ![fm fileExistsAtPath:path])
    {
        NSLog(@"Creating lanugages configuration file...");
        task = [NSTask launchedTaskWithLaunchPath:@"stupdate_languages"
                                        arguments:nil];
        [task waitUntilExit];
    }

    if( ![fm fileExistsAtPath:path])
    {
        [NSException  raise:STGenericException
                     format:@"Unable to get languages configuration file"];
        return nil;
    }

    dict = [NSDictionary dictionaryWithContentsOfFile:path];
    fileTypeDictionary = [dict objectForKey:@"STFileTypes"];

    RETAIN(fileTypeDictionary);
}
/** Returns name of a language used by files of type <var>fileType</var>. */
+ (NSString *)languageNameForFileType:(NSString *)fileType
{
    if(!fileTypeDictionary)
    {
        [self updateFileTypeDictionary];
    }

    return [fileTypeDictionary objectForKey:fileType];
}

/** Return all known types (extensions) of StepTalk script files */
+ (NSArray *)allKnownFileTypes
{
    if(!fileTypeDictionary)
    {
        [self updateFileTypeDictionary];
    }

    return [fileTypeDictionary allKeys];    
}

/** Returns the language bundle for a language used by files of type 
    <var>fileType</var>. */
+ (STLanguage *)languageForFileType:(NSString *)fileType
{
    NSString     *langName = [STLanguage languageNameForFileType:fileType];

    if(langName)
    {
        return [STLanguage languageWithName:langName];
    }
    
    [NSException raise:STGenericException 
                 format:@"Unknown language for file type '%@'", fileType];
    
    return nil;
}

/** Returns the name of the language */
- (NSString *)languageName
{
    NSString *name;
    
    name = [[self infoDictionary] objectForKey:@"STLanguageName"];
    
    if(!name)
    {

        name = [[self bundlePath] lastPathComponent];
        name = [name stringByDeletingPathExtension];
    }
    
    return name;
}

/** Returns a scripting engine provided by the language. */
- (STEngine *)engine
{
    NSString  *className =[[self infoDictionary] objectForKey:@"STEngine"];
    Class      engineClass = nil;
    STEngine  *engine;
    
    if(className)
    {
        engineClass = [self classNamed:className];
    }
    
    if(!engineClass)
    {
        engineClass = [self principalClass];
    }

    engine = [[engineClass alloc] init];

    return AUTORELEASE(engine);
}

@end
