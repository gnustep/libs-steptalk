/**
    STMoudle.m
    StepTalk module
  
    Copyright (c) 2002 Free Software Foundation
  
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2001 May 7 
  
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

#import <StepTalk/STModule.h>

#import <StepTalk/STFunctions.h>
#import <StepTalk/STExterns.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSBundle.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSString.h>

@implementation STModule
+ (NSArray *)allModuleNames
{
    NSLog(@"+[STModule allModuleNames] not implemented yet");
    
    return nil;
}

+ moduleWithName:(NSString *)moduleName
{
    NSString *file = STFindResource(moduleName, STModulesDirectory,
                                      STModuleExtension);
    if(!file)
    {
        NSLog(@"Could not find module with name '%@'", moduleName);
        return nil;
    }

    return [self moduleWithPath:file];
}

+ moduleWithPath:(NSString *)modulePath
{
    NSBundle *bundle;
    STModule *module;
    Class     class;

    bundle = [NSBundle bundleWithPath:modulePath];

    if(!bundle)
    {
        NSLog(@"Could not load module '%@'", modulePath);
        return nil;
    }
    

    NSDebugLog(@"Instantiating module '%@'", modulePath);
    class = [bundle principalClass];
    
    if(!class)
    {
        NSLog(@"Could not get pricipal class of module '%@'", modulePath);
        return nil;
    }

    module = [[class alloc] init];

    if(!module)
    {
        NSLog(@"Could not instantiate class '%@' from module '%@'", 
                [class className], modulePath);
        return nil;
    }

    NSDebugLog(@"Module '%@' loaded", modulePath);
    return AUTORELEASE(module);
}

- (NSArray *)providedClasses
{
    return [[[self bundle] infoDictionary] objectForKey:@"STClasses"];
}

/* Subclass responsibility */
- (NSDictionary *)namedObjects
{
    return nil;
}

- (NSBundle *)bundle
{
    return [NSBundle bundleForClass:[self class]];
}
@end
