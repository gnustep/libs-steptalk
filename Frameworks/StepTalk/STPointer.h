/**
    STPointer.h
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

#import <Foundation/NSValue.h>

@interface STPointer : NSValue
{
    const char *objCType;
    void       *pointer;
    BOOL        releasedWhenDone;
}
+ malloc:(NSUInteger)size;
+ calloc:(NSUInteger)num withObjCType:(const char *)type;
+ valueWithPointer:(void *)pointer;
+ valueWithPointer:(void *)pointer objCType:(const char *)type;
- (void)getValue:(void *)value;
- (const char *)objCType;
- (void)setObjCType:(const char *)type;
- (BOOL)releasedWhenDone;
- (void)setReleasedWhenDone:(BOOL)released;
- (void *)pointerValue;
@end

@interface NSValue(STPointerAdditions)
- (void)free;
- (void *)pointerValueWithIndex:(NSInteger)index;
- valueWithPointerAtIndex:(NSInteger)index;
- valueAtIndex:(NSInteger)index;
- (void)setValue:anObject atIndex:(NSInteger)index;
@end
