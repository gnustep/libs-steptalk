/**
    STScriptObject.h
    Object that represents script 
 
    Copyright (c) 2002 Free Software Foundation
 
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

@class NSMutableArray;
@class NSMutableDictionary;
@class STBytecodeInterpreter;
@class STCompiledScript;
@class STEnvironment;

@interface STScriptObject:NSObject
{
    NSString              *name;
    STBytecodeInterpreter *interpreter;
    STEnvironment         *environment;
    STCompiledScript      *script;
    NSMutableArray        *variables;
}
- initWithEnvironment:(STEnvironment *)env
       compiledScript:(STCompiledScript *)compiledScript;
       
- (void)setInstanceVariable:(id)anObject atIndex:(int)anIndex;
- (id)instanceVariableAtIndex:(int)anIndex;
@end
