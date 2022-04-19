/**
    STPointer.m
    Work with pointers to objects and data

    Copyright (c) 2022 Free Software Foundation

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

#import "STPointer.h"

#import "STExterns.h"
#import "NSInvocation+additions.h"

#import <Foundation/NSException.h>

@implementation STPointer

+ malloc:(NSUInteger)size
{
    void      *value;
    STPointer *p;

    value = malloc(size);
    memset(value, 0, size);
    p = [[self alloc] initWithBytes:&value objCType:@encode(void *)];
    [p setReleasedWhenDone:YES];
    return AUTORELEASE(p);
}
+ calloc:(NSUInteger)num withObjCType:(const char *)type;
{
    NSUInteger align;
    void      *value;
    STPointer *p;

    if (!type || *type != _C_PTR)
    {
        [NSException raise:STInvalidArgumentException
                    format:@"Not a pointer type '%s'", type];
    }

    NSGetSizeAndAlignment(type + 1, NULL, &align);
    value = calloc(num, align);
    p = [[self alloc] initWithBytes:&value objCType:type];
    [p setReleasedWhenDone:YES];
    return AUTORELEASE(p);
}

+ valueWithPointer:(void *)pointer
{
    return [self valueWithBytes:&pointer objCType:@encode(void *)];
}
+ valueWithPointer:(void *)pointer objCType:(const char *)type
{
    return [self valueWithBytes:&pointer objCType:type];
}
+ value:(const void *)value withObjCType:(const char *)type
{
    return [self valueWithBytes:value objCType:type];
}
+ valueWithBytes:(const void *)value objCType:(const char *)type
{
    return AUTORELEASE([[self alloc] initWithBytes:value objCType:type]);
}
- initWithBytes:(const void *)data objCType:(const char *)type
{
    if (!type || *type != _C_PTR)
    {
        [NSException raise:STInvalidArgumentException
                    format:@"Not a pointer type: '%s'", type];
    }

    if ((self = [super init]))
    {
        pointer = *(void **)data;
        objCType = strdup(type); // FIXME Is strdup necessary here?
        releasedWhenDone = NO;
    }
    return self;
}
- (void)dealloc
{
    if (releasedWhenDone)
        free(pointer);
    free((char *)objCType); // type cast to avoid compiler warning
    [super dealloc];
}

- copy
{
    // FIXME: NSValue implements the copy method instead of using the
    // NSObject implementation that calls copyWithZone:.
    return [self copyWithZone: NULL];
}
- copyWithZone:(NSZone *)zone
{
    [self doesNotRecognizeSelector: _cmd];
    return nil;
}

- (void)getValue:(void *)value
{
    *(void **)value = pointer;
}
- (void *)pointerValue
{
    return pointer;
}

- (const char *)objCType
{
    return objCType;
}
- (void)setObjCType:(const char *)type
{
    if (!type || *type != _C_PTR)
    {
        [NSException raise:STInvalidArgumentException
                    format:@"Not a pointer type: '%s'", type];
    }

    if (type != objCType)
    {
        free((char *)objCType); // type cast to avoid compiler warning
        objCType = strdup(type); // FIXME Is strdup necessary here?
    }
}

- (BOOL)releasedWhenDone
{
    return releasedWhenDone;
}
- (void)setReleasedWhenDone:(BOOL)released
{
    releasedWhenDone = released;
}
@end

@implementation NSValue(STPointerAdditions)
- (void)free
{
    free([self pointerValue]);
}
- (void *)pointerValueWithIndex:(NSInteger)index
{
    NSUInteger  align;
    void       *value;
    const char *type;

    type = [self objCType];
    if (*type != _C_PTR)
    {
        [NSException raise:STInvalidArgumentException
                    format:@"Not a pointer value"];
    }

    value = [self pointerValue];
    if (index > 0)
    {
        NSGetSizeAndAlignment(++type, NULL, &align);
        value = (char *)value + index * align;
    }
    return value;
}
- valueWithPointerAtIndex:(NSInteger)index
{
    void       *value;
    const char *type;

    value = [self pointerValueWithIndex:index];
    type = [self objCType];
    return [[self class] valueWithBytes:&value objCType:type];
}
- valueAtIndex:(NSInteger)index
{
    void       *value;
    const char *type;

    value = [self pointerValueWithIndex:index];
    type = [self objCType];
    return STObjectFromValueOfType(value, ++type);
}
- (void)setValue:anObject atIndex:(NSInteger)index
{
    void       *value;
    const char *type;

    value = [self pointerValueWithIndex:index];
    type = [self objCType];
    // FIXME STGetValueOfTypeFromObject may write through const pointers
    STGetValueOfTypeFromObject(value, ++type, anObject);
}
@end
