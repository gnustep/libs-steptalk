/**
    STExterns.m
    Misc. variables
 
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
#import <Foundation/NSString.h>

NSString *STGenericException = @"STGenericException";
NSString *STInvalidArgumentException = @"STInvalidArgumentException";
NSString *STInternalInconsistencyException = @"STInternalInconsistencyException";
NSString *STRangeException = @"STRangeException";
NSString *STScriptingException = @"STScriptingException";

NSString *STCompilerSyntaxException = @"STCompilerSyntaxException";
NSString *STCompilerGenericException = @"STCompilerGenericException";
NSString *STCompilerInconsistencyException = @"STCompilerInconsistencyException";

NSString *STInterpreterGenericException = @"STInterpreterGenericException";
NSString *STInvalidBytecodeException = @"STInterpreterInvalidBytecodeException";
NSString *STInterpreterInconsistencyException = @"STInterpreterInconsistencyException";


NSString *STLibraryDirectory = @"StepTalk";
NSString *STScriptsDirectory = @"Scripts";

NSString *STModulesDirectory = @"Modules";
NSString *STModuleExtension  = @"bundle";

NSString *STScriptingEnvironmentsDirectory = @"Environments";
NSString *STScriptingEnvironmentExtension  = @"stenv";

NSString *STLanguageBundlesDirectory = @"Languages";
NSString *STLanguageBundleExtension = @"stlanguage";

NSString *STLanguagesConfigFile = @"Languages.plist";
