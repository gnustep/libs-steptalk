/**
    stexec.m
    Script executor
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2000
   
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
#import "STEnvironmentProcess.h"

#import <StepTalk/StepTalk.h>

#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSException.h>
#import <Foundation/NSConnection.h>
#import <Foundation/NSUserDefaults.h>
#import <Foundation/NSDistributedNotificationCenter.h>

#include <stdio.h>

const int MAX_SEQUENCES = 100; /* Maximal number of simulator sequence numbers */

int main(int argc, const char **argv)
{	
    NSDistributedNotificationCenter *dnc;
    STEnvironmentProcess *envprocess;
    NSArray            *args;
    NSAutoreleasePool  *pool;
    NSUserDefaults     *defs;
    NSString           *envIdentifier;
    NSString           *ownerIdentifier;
    BOOL                isRegistered = NO;
    int                 sequence = 0;
    NSConnection       *connection;
    NSDictionary       *dict;
    NSString           *serverName;
    
    pool = [NSAutoreleasePool new];

//    [NSAutoreleasePool enableDoubleReleaseCheck:YES];

    defs = [NSUserDefaults standardUserDefaults];

    ownerIdentifier = [defs objectForKey:@"STEnvironmentOwnerIdentifier"];
    envIdentifier   = [defs objectForKey:@"STEnvironmentIdentifier"];

    envprocess = [[STEnvironmentProcess alloc] init];

    /* Register environment */
    
    connection = RETAIN([NSConnection defaultConnection]);
    [connection setRootObject:envprocess];

    if(!envIdentifier)
    {
        for(sequence = 0; sequence < MAX_SEQUENCES; sequence++)
        {
            envIdentifier = [NSString stringWithFormat:@"Unnamed%i", sequence];
            serverName = [NSString stringWithFormat:@"STEnvironment:%@", envIdentifier];
            NSLog(@"Trying to register environment with name '%@'", envIdentifier);

            NS_DURING
                if([connection registerName:serverName])
                {
                    isRegistered = YES;
                }
            NS_HANDLER
                NSLog(@"WARNING: GNUstep is broken! Report this to bug-gnustep@gnu.org");
            NS_ENDHANDLER  
            if(isRegistered)
            {
                break;
            }              
        }
    }
    else
    {
        serverName = [NSString stringWithFormat:@"STEnvironment:%@", envIdentifier];
        if([connection registerName:serverName])
        {
            isRegistered = YES;
        }
    }
    
    /* Finish */
    
    if(isRegistered)
    {
        NSLog(@"Registered with name '%@'", envIdentifier);
        dnc = [NSDistributedNotificationCenter defaultCenter];

        dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                    envIdentifier, @"STDistantEnvironmentName",
                                    nil, nil];
                                        
        [dnc postNotificationName:@"STDistantEnvironmentConnectNotification"
                           object:ownerIdentifier
                         userInfo:dict];
                         
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"Terminating environment process %@", envIdentifier);
    }
    else
    {
        NSLog(@"Unable to register environment.");
    }
    
    RELEASE(pool);

    return 0;
}
