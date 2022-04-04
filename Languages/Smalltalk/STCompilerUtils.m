/**
    STCompilerUtils.m
    Various compiler utilities.
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of StepTalk.
 
 */

#import "STCompiler.h"

#import "STCompilerUtils.h"
#import "STSourceReader.h"
#import "Externs.h"

#import <StepTalk/STExterns.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSException.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>

/* 
 * Compiler utilities
 * --------------------------------------------------------------------------
 */

/*
 * STCMethod
 * ---------------------------------------------------------------------------
 */



@implementation STCMethod
+ methodWithPattern:(STCMessage *)patt statements:(STCStatements *)stats
{
    STCMethod *method;
    method = [[STCMethod alloc] initWithPattern:patt statements:stats];
    return AUTORELEASE(method);
}
- initWithPattern:(STCMessage *)patt statements:(STCStatements *)stats
{
    if ((self = [super init]) != nil)
    {
        messagePattern = RETAIN(patt);
        statements = RETAIN(stats);
    }
    return self;
}
- (void)dealloc
{
    RELEASE(messagePattern);
    RELEASE(statements);
    [super dealloc];
}
- (STCStatements *)statements
{
    return statements;
}

- (STCMessage *)messagePattern
{
    return messagePattern;
}
@end

/*
 * STCStatements
 * ---------------------------------------------------------------------------
 */
@implementation STCStatements
+ statements
{
    STCStatements *statements = [[STCStatements alloc] init];
    return AUTORELEASE(statements);
}
- (void)setTemporaries:(NSArray *)vars
{
    ASSIGN(variables,vars);
}
- (void)setExpressions:(NSArray *)exprs
{
    ASSIGN(expressions,exprs);
}
- (void)setReturnExpression:(STCExpression *)ret
{
    ASSIGN(retexpr,ret);
}
- (void)dealloc
{
    RELEASE(variables);
    RELEASE(expressions);
    RELEASE(retexpr);
    [super dealloc];
}
- (NSArray *)temporaries
{
    return variables;
}
- (NSArray *)expressions
{
    return expressions;
}
- (STCExpression *)returnExpression
{
    return retexpr;
}
@end

/*
 * STCMessage
 * ---------------------------------------------------------------------------
 */

@implementation STCMessage
+ message
{
    STCMessage *message = [[self alloc] init];
    return AUTORELEASE(message);    
}
- init
{
    if ((self = [super init]) != nil)
    {
        selector = [[NSMutableString alloc] init];
        args = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)dealloc
{
    RELEASE(selector);
    RELEASE(args);
    [super dealloc];
}
-(void) addKeyword:(NSString *)keyword object:object
{
    [selector appendString:keyword];
    if(object!=nil)
    {
        [args addObject:object];
    }
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

@implementation STCTypedMessage
static NSString *idType;
static NSString *selType;
static void initializeParserTypes();
+ (void)initialize
{
    if (self == [STCTypedMessage class])
    {
        idType = [[NSString alloc] initWithCString:@encode(id)];
        selType = [[NSString alloc] initWithCString:@encode(SEL)];
        initializeParserTypes();
    }
}
- init
{
    if ((self = [super init]) != nil)
    {
        objcTypes = [[NSMutableString alloc] init];
    }
    return self;
}
- (void)dealloc
{
    RELEASE(objcTypes);
    [super dealloc];
}
- (void) setReturnType:(NSString *)retType
{
    if (retType == nil)
    {
        retType = idType;
    }
    [objcTypes insertString:retType atIndex:0];
    [objcTypes insertString:idType atIndex:[retType length]];
    [objcTypes insertString:selType atIndex:[retType length] + [idType length]];
}
-(void) addKeyword:(NSString *)keyword object:object
{
    [self addKeyword:keyword type:nil object:object];
}
-(void) addKeyword:(NSString *)keyword type:(NSString *)type object:object
{
    [super addKeyword:keyword object:object];
    if(object!=nil)
    {
        if (type == nil)
        {
            type = idType;
        }
        [objcTypes appendString:type];
    }
}
- (NSString *)objCTypes
{
    return objcTypes;
}
@end


/*
 * STCExpression
 * ---------------------------------------------------------------------------
 */
@implementation STCExpression:NSObject
+ (STCExpression *) primaryExpressionWithObject:(id)anObject
{
    STCPrimaryExpression *expr;
    expr = [[STCPrimaryExpression alloc] initWithObject:anObject];
    return AUTORELEASE(expr);
}

+ (STCExpression *) messageExpressionWithTarget:(id)anObject
                                        message:(STCMessage *)message
{
    STCMessageExpression *expr;
    expr = [[STCMessageExpression alloc] initWithTarget:anObject
                                                message:message];
    return AUTORELEASE(expr);
}

- (void)dealloc
{
    RELEASE(cascade);
    RELEASE(assignments);
    [super dealloc];
}
- (void)setCascade:(NSArray *)casc
{
    ASSIGN(cascade,casc);
}
- (void)setAssignments:(NSArray *)asgs
{
    ASSIGN(assignments,asgs);
}
- (NSArray *)cascade
{
    return cascade;
}
- (NSArray *)assignments
{
    return assignments;
}
- (BOOL)isPrimary
{
    [self subclassResponsibility:_cmd];
    return NO;
}
- (id) target
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (STCMessage *)message
{
    [self subclassResponsibility:_cmd];
    return nil;
}
- (id) object
{
    [self subclassResponsibility:_cmd];
    return nil;
}

@end

@implementation STCMessageExpression:STCExpression
- initWithTarget:(id)anObject message:(STCMessage *)aMessage;
{
    if ((self = [super init]) != nil)
    {
        target = RETAIN(anObject);
        message = RETAIN(aMessage);
    }
    return self;
}
- (void)dealloc
{
    RELEASE(target);
    RELEASE(message);
    [super dealloc];
}
- (id) target
{
    return target;
}
- (STCMessage *)message
{
    return message;
}
- (BOOL)isPrimary
{
    return NO;
}
@end

@implementation STCPrimaryExpression:STCExpression
- (void)dealloc
{
    RELEASE(object);
    [super dealloc];
}
- initWithObject:(id)anObject
{
    if ((self = [super init]) != nil)
        object = RETAIN(anObject);
    return self;
}

- (id) object
{
    return object;
}
- (BOOL)isPrimary
{
    return YES;
}
@end

/*
 * STCPrimary
 * ---------------------------------------------------------------------------
 */
@implementation STCPrimary
+ primaryWithVariable:(id) anObject
{
    STCPrimary *primary;
    primary = [[STCPrimary alloc] initWithType:STCVariablePrimaryType
                                        object:anObject];
    return AUTORELEASE(primary);
}
+ primaryWithLiteral:(id) anObject
{
    STCPrimary *primary;
    primary = [[STCPrimary alloc] initWithType:STCLiteralPrimaryType
                                        object:anObject];
    return AUTORELEASE(primary);
}
+ primaryWithBlock:(id) anObject
{
    STCPrimary *primary;
    primary = [[STCPrimary alloc] initWithType:STCBlockPrimaryType
                                        object:anObject];
    return AUTORELEASE(primary);
}
+ primaryWithExpression:(id) anObject
{
    STCPrimary *primary;
    primary = [[STCPrimary alloc] initWithType:STCExpressionPrimaryType
                                        object:anObject];
    return AUTORELEASE(primary);
}
- initWithType:(int)newType object:obj
{
    if ((self = [super init]) != nil)
    {
	type = newType;
	object = RETAIN(obj);
    }
    return self;
}
- (void)dealloc
{
    RELEASE(object);
    [super dealloc];
}
- (int)type
{
    return type;
}
- object
{
    return object;
}
@end


/*
 * Compiler additions for literals
 * ---------------------------------------------------------------------------
 */

@implementation NSString(STCompilerAdditions)
+ (NSString *) symbolFromString:(NSString *)aString
{
    return [self stringWithString:aString];
}
+ (id) characterFromString:(NSString *)aString
{
    return [self stringWithString:aString];
}
@end

@implementation NSMutableString(STCompilerAdditions)
+ (id) stringFromString:(NSString *)aString
{
    return [self stringWithString:aString];
}
@end

@implementation NSNumber(STCompilerAdditions)
+ (id) intNumberFromString:(NSString *)aString
{
    return [self numberWithInt:[aString intValue]];
}
+ (id) realNumberFromString:(NSString *)aString
{
    return [self numberWithDouble:[aString doubleValue]];
}
@end

@implementation NSMutableArray(STCompilerAdditions)
+ (id) arrayFromArray:(NSArray *)anArray
{
    return [self arrayWithArray:anArray];
}
@end


/*
 * Additions for parsing types in message definitions
 * ---------------------------------------------------------------------------
 */

@implementation STCTypedMessage(Parsing)

static NSString *ptrPrefix;
static NSString *ptr2Prefix;
static NSString *charPtrType;
static NSString *charPtr2Type;

static NSDictionary *typeMap;

#define OBJC_TYPE_STR(type) [NSString stringWithCString:@encode(type)]

static void initializeParserTypes()
{
    NSString *tmp;

    charPtrType = [[NSString alloc] initWithCString:@encode(char*)];
    charPtr2Type = [[NSString alloc] initWithCString:@encode(char**)];

    tmp = [[NSString alloc] initWithCString:@encode(void**)];
    ptrPrefix = RETAIN([tmp substringToIndex:1]);
    ptr2Prefix = RETAIN([tmp substringToIndex:2]);
    RELEASE(tmp);

    typeMap = [[NSDictionary alloc] initWithObjectsAndKeys:
        OBJC_TYPE_STR(id), @"id",
        OBJC_TYPE_STR(Class), @"Class",
        OBJC_TYPE_STR(SEL), @"SEL",
        OBJC_TYPE_STR(BOOL), @"BOOL",
        OBJC_TYPE_STR(char), @"char",
        OBJC_TYPE_STR(unsigned char), @"unsigned char",
        OBJC_TYPE_STR(short), @"short",
        OBJC_TYPE_STR(unsigned short), @"unsigned short",
        OBJC_TYPE_STR(int), @"int",
        OBJC_TYPE_STR(unsigned int), @"unsigned int",
        OBJC_TYPE_STR(long), @"long",
        OBJC_TYPE_STR(unsigned long), @"unsigned long",
        OBJC_TYPE_STR(long long), @"long long",
        OBJC_TYPE_STR(unsigned long long), @"unsigned long long",
        OBJC_TYPE_STR(float), @"float",
        OBJC_TYPE_STR(double), @"double",
        OBJC_TYPE_STR(NSInteger), @"NSInteger",
        OBJC_TYPE_STR(NSUInteger), @"NSUInteger",
        OBJC_TYPE_STR(CGFloat), @"CGFloat",
        OBJC_TYPE_STR(NSRange), @"NSRange",
        OBJC_TYPE_STR(NSPoint), @"NSPoint",
        OBJC_TYPE_STR(NSSize), @"NSSize",
        OBJC_TYPE_STR(NSRect), @"NSRect",
        OBJC_TYPE_STR(void), @"void",
        nil];
}

+ (NSString *)objCType:(NSString *)str, ...
{
    va_list ap;
    NSString *type;
    NSString *arg;

    va_start(ap, str);
    arg = va_arg(ap, id);
    while (arg != nil)
    {
        str = [NSString stringWithFormat: @"%@ %@", str, arg];
        arg = va_arg(ap, id);
    }
    va_end(ap);

    type = [typeMap objectForKey:str];
    if (!type)
    {
        [NSException raise:STCompilerSyntaxException
                    format:@"Unknown type '%@'", str];
    }
    return type;
}

+ (NSString *)objCType:(NSString *)type withPointer:(NSString *)str
{
    NSUInteger n;

    if ([str isEqualToString: @"*"])
    {
        if (strcmp([type cString], @encode(char)) == 0)
        {
            type = charPtrType;
        }
        else
        {
            type = [ptrPrefix stringByAppendingString:type];
        }
    }
    else if ([str isEqualToString: @"**"])
    {
        if (strcmp([type cString], @encode(char)) == 0)
        {
            type = charPtr2Type;
        }
        else
        {
            type = [ptr2Prefix stringByAppendingString:type];
        }
    }
    else
    {
        n = [str characterAtIndex:0] == '*' ? 1 : 0;
        [NSException raise:STCompilerSyntaxException
                    format:@"Invalid character in type specification '%@'",
                           [str substringWithRange:NSMakeRange(n, 1)]];
    }
    return type;
}
@end
