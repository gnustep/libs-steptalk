/**
    STObjCRuntime.m
    Objective C runtime additions 
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2000
   
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

#import <Foundation/NSObject.h>

@class NSMutableDictionary;
@class NSString;
@class NSValue;
@class NSMethodSignature;

extern NSMutableDictionary *STAllObjectiveCClasses(void);
extern NSMutableDictionary *STGetFoundationConstants(void);
extern NSMutableDictionary *STClassDictionaryWithNames(NSArray *classNames);
extern NSArray             *STAllObjectiveCSelectors(void);

extern NSValue *STValueFromSelector(SEL sel);
extern SEL STSelectorFromValue(NSValue *val);
extern SEL STSelectorFromString(NSString *aString);
NSMethodSignature *STMethodSignatureForSelector(SEL sel);

