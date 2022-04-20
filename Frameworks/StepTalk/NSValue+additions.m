/**
    NSNumber-additions.m
    Various methods for NSValue to deal with pointers

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

#import "NSValue+additions.h"

#import "STExterns.h"
#import "NSInvocation+additions.h"

#import <Foundation/NSException.h>

@implementation NSValue(STPointerAdditions)
+ valueWithPointer:(void *)pointer objCType:(const char *)type
{
    if (!type || *type != _C_PTR)
    {
        [NSException raise:STInvalidArgumentException
                    format:@"Not a pointer type '%s'", type];
    }
    return [self valueWithBytes:&pointer objCType:type];
}
- valueWithObjCType:(const char *)type
{
    if (!strcmp(type, [self objCType]))
    {
        return self;
    }
    return [[self class] valueWithPointer:[self pointerValue] objCType:type];
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
    return [[self class] valueWithPointer:value objCType:type];
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
