/* 2003 Aug 5 */

#import "STScriptObject.h"

@implementation STScriptObject
/** Return new instance of script object without any instance variables */
+ scriptObject
{
    return AUTORELEASE([[self alloc] init]);
}
- init
{
    self = [super init];
    
    methods = [[NSMutableDictionary alloc] init];
    
    return self;
}
- initWithInstanceVariableNames:(NSString *)names
{
    return [self init];
}
- (void)dealloc
{
    RELEASE(methods);
    RELEASE(ivars);
    [super dealloc];
}

- (void)setObject:(id)anObject forVariable:(NSString *)aName
{
    [self notImplemented:_cmd];
}
- (id)objectForVariable:(NSString *)aName
{
    [self notImplemented:_cmd];
}

- (NSArray *)instanceVariableNames
{
    return [ivars allKeys];
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
    [self notImplemented:_cmd];
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
