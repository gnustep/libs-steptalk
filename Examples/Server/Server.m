/*
    Server.m
 
    StepTalk scriptable server example
 */

#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSConnection.h>
#import <Foundation/NSHost.h>
#import <Foundation/NSRunLoop.h>

#import <StepTalk/StepTalk.h>

#include <stdio.h>

@interface Server:NSObject
- say:(NSString *)string;
@end

@implementation Server
- (STEnvironment *)scriptingEnvironment
{
    /* here we should add some objects or class references ... */
    
    return [STEnvironment defaultScriptingEnvironment];
}
- (NSDate *)date
{
    return [NSDate date];
}
- say:(NSString *)string
{
    printf("%s\n",[string cString]);

    return self;
}
@end

int main(int argc, const char **argv)
{	
    NSAutoreleasePool *pool;
    NSConnection      *connection;
    Server            *server = [Server new];

    pool = [NSAutoreleasePool new];

    connection = [NSConnection newRegisteringAtName:@"Server" 
                                     withRootObject:server];

    if (!connection) 
    {
        NSLog(@"Unable to register server");
        [pool release];
        return 1;
    }

    NSLog(@"Server started");
  
    [[NSRunLoop currentRunLoop] run];
  
    RELEASE(connection);
    RELEASE(pool);
    
    return 0;
}
