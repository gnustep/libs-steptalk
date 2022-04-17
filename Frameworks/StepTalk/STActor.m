/**
    STActor
    StepTalk actor
  
    Copyright (c) 2002 Free Software Foundation
  
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2005 June 30
    License: LGPL
     
    This file is part of the StepTalk project.
*/

#import "STActor.h"

#import "NSInvocation+additions.h"
#import "STEngine.h"
#import "STEnvironment.h"
#import "STExterns.h"
#import "STObjCRuntime.h"

#import <Foundation/NSArray.h>
#import <Foundation/NSCoder.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSInvocation.h>
#import <Foundation/NSKeyValueCoding.h>
#import <Foundation/NSString.h>

@implementation STActor
/** Return new instance of script object without any instance variables */
+ actorInEnvironment:(STEnvironment *)env
{
    return AUTORELEASE([[self alloc] initWithEnvironment:env]);
}
+ actor
{
    return AUTORELEASE([[self alloc] init]);
}
- init
{
    if ((self = [super init]) != nil)
    {
        methodDictionary = [[NSMutableDictionary alloc] init];
        ivars = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- initWithEnvironment:(STEnvironment *)env;
{
    if ((self = [self init]) != nil)
    {
        [self setEnvironment:env];
    }
    return self;
}
- (void)dealloc
{
    RELEASE(methodDictionary);
    RELEASE(ivars);
    [super dealloc];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if (value == nil)
    {
        value = STNil;
    }

    /* FIXME: this is not optimal */
    if ([ivars valueForKey:key] != nil)
    {
        [ivars setValue:value forKey:key];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
- (id)valueForKey:(NSString *)key
{
    id value = nil;
    
    value = [ivars valueForKey:key];
    
    if (value == nil)
    {
        value = [super valueForKey:key];
    }
    return value;
}

- (NSArray *)instanceVariableNames
{
    return [ivars allKeys];
}
- (void)setInstanceVariables:(NSDictionary *)dictionary
{
    [ivars removeAllObjects];
    [ivars addEntriesFromDictionary:dictionary];
}
- (NSDictionary *)instanceVariables
{
    return [NSDictionary dictionaryWithDictionary:ivars];
}
- (void)addInstanceVariable:(NSString *)aName
{
    if ([ivars valueForKey:aName] == nil)
    {
	[ivars setValue: STNil forKey: aName];
    }
}
- (void)removeInstanceVariable:(NSString *)aName
{
    if ([ivars valueForKey:aName] != nil)
    {
	[ivars setValue: nil forKey: aName];
    }
}

- (void)addMethod:(id <STMethod>)aMethod
{
    [methodDictionary setObject:aMethod forKey:[aMethod methodName]];
}
- (id <STMethod>)methodWithName:(NSString *)aName
{
    return [methodDictionary objectForKey:aName];
}
- (void)removeMethod:(id <STMethod>)aMethod
{
    [self notImplemented:_cmd];
}
- (void)removeMethodWithName:(NSString *)aName
{
    [methodDictionary removeObjectForKey:aName];
}
- (NSArray *)methodNames
{
    return [methodDictionary allKeys];
}
- (NSDictionary *)methodDictionary
{
    return [NSDictionary dictionaryWithDictionary:methodDictionary];
}
/** Set object's environment. Note: This method should be replaced by
some other, more clever mechanism. */
- (void)setEnvironment:(STEnvironment *)env
{
    ASSIGN(environment, env);
}
- (STEnvironment *)environment
{
    return environment;
}
- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([super respondsToSelector:(SEL)aSelector])
    {
        return YES;
    }
    
    return ([methodDictionary objectForKey:NSStringFromSelector(aSelector)] != nil);
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *signature = nil;
    NSString          *methodName;
    id <STMethod>      method;
    
    signature = [super methodSignatureForSelector:sel];

    if (!signature)
    {
        methodName = NSStringFromSelector(sel);
        method = [methodDictionary objectForKey:methodName];
        if (method)
        {
            signature = [method methodSignature];
        }
        if (!signature)
        {
            signature = STConstructMethodSignatureForSelector(sel);
        }
    }

    return signature;
}

- (void) forwardInvocation:(NSInvocation *)invocation
{
    STEngine       *engine;
    id <STMethod>   method;
    NSString       *methodName = NSStringFromSelector([invocation selector]);
    NSMutableArray *args;
    id              arg;
    NSUInteger      index;
    NSUInteger      count;
    id              retval = nil;

    method = [methodDictionary objectForKey:methodName];
    
    if (!method)
    {
        [NSException raise:@"STActorException"
                     format:@"No script object method with name '%@'",
                            methodName];
        return;
    }

    engine = [STEngine engineForLanguage:[method languageName]];   

    /* Get arguments as array */
    count = [[invocation methodSignature] numberOfArguments];
    args = [NSMutableArray array];
    
    for (index = 2; index < count; index++)
    {
        arg = [invocation getArgumentAsObjectAtIndex:index];

        if (arg == nil)
        { 
            [args addObject:STNil];
        }
        else 
        { 
            [args addObject:arg];
        } 
    }

    retval = [engine executeMethod:method
                       forReceiver:self
                     withArguments:args
                         inContext:environment];

    [invocation setReturnValueAsObject:retval];
}
- (void)encodeWithCoder:(NSCoder *)coder
{
    // [super encodeWithCoder: coder];

    [coder encodeObject:methodDictionary];
    [coder encodeObject:ivars];
}

- initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init] /*[super initWithCoder: decoder]*/) != nil)
    {    
        [decoder decodeValueOfObjCType: @encode(id) at: &methodDictionary];
        [decoder decodeValueOfObjCType: @encode(id) at: &ivars];
    }
    return self;
}
@end
