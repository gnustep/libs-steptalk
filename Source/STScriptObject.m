/* 2003 Aug 5 */

#import "StepTalk/STScriptObject.h"

@implementation STScriptObject
- initWithInstanceVariableNames:(NSString *)names
{
    self = [super init];

    methods = [[NSMutableDictionary alloc] init];

    return self;
}
- (void)dealloc
{
    RELEASE(methods);
    RELEASE(ivars);
    [super dealloc];
}

- (void)setObject:(id)anObject forVariable:(NSString *)aName
{
    [self _notImplemented:_cmd];
}
- (id)objectForVariable:(NSString *)aName
{
    [self _notImplemented:_cmd];
}

- (NSArray *)instanceVariableNames
{
    [self _notImplemented:_cmd];
}

- (void)addMethod:(STMethod *)aMethod
{
    [methods setObject:aMethod forKey:[aMethod methodName]];
}
- (STMethod *)methodWithName:(NSString *)aName
{
    return [methods objectForKey:aName];
}
- (void)removeMethod:(STMethod *)aMethod
{
    [self _notImplemented:_cmd];
}
- (void)removeMethodWithName:(NSString *)aName
{
    [methods removeObjectForKey:aName];
}
- (NSArray *)methodNames
{
    return [methods allKeys];
}
- (NSDictionary *)methodDictionary
{
    return [NSDictionary dictionaryWithDictionary:methods];
}
@end
