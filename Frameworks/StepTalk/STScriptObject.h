/* 2003 Aug 5 */

#import <Foundation/NSObject.h>

@class NSMutableDictionary;
@class NSDictionary;
@class NSArray;
@class STMethod;

@interface STScriptObject:NSObject
{
    NSMutableDictionary *ivars;
    NSMutableDictionary *methods;
}
+ scriptObject;
- initWithInstanceVariableNames:(NSString *)names;

- (void)setObject:(id)anObject forVariable:(NSString *)aName;
- (id)objectForVariable:(NSString *)aName;

- (NSArray *)instanceVariableNames;

- (void)addMethod:(STMethod *)aMethod;
- (STMethod *)methodWithName:(NSString *)aName;
- (void)removeMethod:(STMethod *)aMethod;
- (void)removeMethodWithName:(NSString *)aName;
- (NSArray *)methodNames;
- (NSDictionary *)methodDictionary;
@end
