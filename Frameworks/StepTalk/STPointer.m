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
    void      *pointer;
    STPointer *p;

    pointer = malloc(size);
    memset(pointer, 0, size);
    p = [[self alloc] initWithPointer:pointer objCType:@encode(void *)];
    [p setFreeWhenDone:YES];
    return AUTORELEASE(p);
}
+ calloc:(NSUInteger)num withObjCType:(const char *)type;
{
    NSUInteger align;
    void      *pointer;
    STPointer *p;

    if (!type || *type != _C_PTR)
    {
        [NSException raise:STInvalidArgumentException
                    format:@"Not a pointer type '%s'", type];
    }

    NSGetSizeAndAlignment(type + 1, NULL, &align);
    pointer = calloc(num, align);
    p = [[self alloc] initWithPointer:pointer objCType:type];
    [p setFreeWhenDone:YES];
    return AUTORELEASE(p);
}

+ pointer:(void *)pointer
{
    return [self pointer:pointer withObjCType:@encode(void *)];
}
+ pointer:(void *)pointer withObjCType:(const char *)type
{
    return AUTORELEASE([[self alloc] initWithPointer:pointer objCType:type]);
}
- initWithPointer:(void *)aPointer objCType:(const char *)type
{
    if (!type || *type != _C_PTR)
    {
        [NSException raise:STInvalidArgumentException
                    format:@"Not a pointer type: '%s'", type];
    }

    if ((self = [super init]))
    {
        pointer = aPointer;
        objCType = strdup(type); // FIXME Is strdup necessary here?
        freeWhenDone = NO;
    }
    return self;
}
- (void)dealloc
{
    if (freeWhenDone)
        free(pointer);
    free((char *)objCType); // type cast to avoid compiler warning
    [super dealloc];
}

- (void)free
{
    free(pointer);
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

- (BOOL)freeWhenDone
{
    return freeWhenDone;
}
- (void)setFreeWhenDone:(BOOL)free
{
    freeWhenDone = free;
}

- (void *)pointerValueWithIndex:(NSInteger)index
{
    NSUInteger  align;
    void       *value;

    value = pointer;
    if (index > 0)
    {
        NSGetSizeAndAlignment(objCType + 1, NULL, &align);
        value = (char *)value + index * align;
    }
    return value;
}
- pointerAtIndex:(NSInteger)index
{
    return [[self class] pointer:[self pointerValueWithIndex:index]
                    withObjCType:objCType];
}
- valueAtIndex:(NSInteger)index
{
    return STObjectFromValueOfType([self pointerValueWithIndex:index],
                                   objCType + 1);
}
- (void)setValue:anObject atIndex:(NSInteger)index
{
    // FIXME STGetValueOfTypeFromObject may write through const pointers
    STGetValueOfTypeFromObject([self pointerValueWithIndex:index],
                               objCType + 1, anObject);
}
@end
