/**
    STMessage.m
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2001 Jun 18
 
    This file is part of StepTalk.
 
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

#import "STMessage.h"

#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSString.h>


@implementation STMessage
+ (STMessage *)messageWithSelector:(NSString *)aString
                         arguments:(NSArray *)anArray
{
    STMessage *message;
    
    message = [[STMessage alloc] initWithSelector:aString
                                        arguments:anArray];
    return AUTORELEASE(message);                                      
}
- initWithSelector:(NSString *)aString
         arguments:(NSArray *)anArray
{
    if ((self = [super init]) != nil)
    {
	selector = RETAIN(aString);
	args = RETAIN(anArray);
    }
    return self;
}

- (void)dealloc
{
    RELEASE(selector);
    RELEASE(args);
    
    [super dealloc];
}

- (NSString *)selector
{
    return selector;
}

- (NSString *)objCTypes
{
    return nil;
}

- (NSArray *)arguments
{
    return args;
}
@end
