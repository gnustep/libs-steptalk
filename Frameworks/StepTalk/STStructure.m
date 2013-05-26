/**
    STStructure.m
    C structure wrapper
 
    Copyright (c) 2002 Free Software Foundation
 
    Written by: Stefan Urbanek <urbanek@host.sk>
    Date: 2000
   
    This file is part of StepTalk.
 
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

#import "STStructure.h"

#import "STExterns.h"
#import <Foundation/NSArray.h>
#import <Foundation/NSException.h>
#import <Foundation/NSObjCRuntime.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>
#import <Foundation/NSDebug.h>
#import "NSInvocation+additions.h"

@implementation STStructure
+ structureWithValue:(void *)value type:(const char*)type
{
    STStructure *str;
    str = [[self alloc] initWithValue:value type:type];
    return AUTORELEASE(str);
}
+ structureWithRange:(NSRange)range
{
    STStructure *str;
    str = [[self alloc] initWithValue:&range type:@encode(NSRange)];
    return AUTORELEASE(str);
}

+ structureWithPoint:(NSPoint)point
{
    STStructure *str;
    str = [[self alloc] initWithValue:&point type:@encode(NSPoint)];
    return AUTORELEASE(str);
}
+ structureWithSize:(NSSize)size
{
    STStructure *str;
    str = [[self alloc] initWithValue:&size type:@encode(NSSize)];
    return AUTORELEASE(str);
}

+ structureWithRect:(NSRect)rect
{
    STStructure *str;
    str = [[self alloc] initWithValue:&rect type:@encode(NSRect)];
    return AUTORELEASE(str);
}

+ structureWithOrigin:(NSPoint)point size:(NSSize)size
{
    NSRect rect;
    STStructure *str;
    rect = NSMakeRect(point.x, point.y, size.width, size.height);
    str = [[self alloc] initWithValue:&rect type:@encode(NSRect)];
    return AUTORELEASE(str);
}

- initWithValue:(void *)value type:(const char*)type
{
    const char *nameBeg, *nextType;
    NSUInteger  offset = 0;
    NSUInteger  size, align;
    NSUInteger  rem;
    
    if ((self = [super init]) != nil)
    {
        NSDebugLLog(@"STStructure",
                    @"creating structure of type '%s' value ptr %p",type,value);

        structType = [[NSString alloc] initWithCString:type];

        fields = [[NSMutableArray alloc] init];

        type++;

        nameBeg = type;
        while (*type != _C_STRUCT_E && *type++ != '=');
        name = [[NSString alloc] initWithCString:nameBeg length:type-nameBeg];

        while (*type != _C_STRUCT_E)
        {
            nextType = NSGetSizeAndAlignment(type, &size, &align);

            rem = offset % align;
            if (rem != 0)
            {
                offset += align - rem;
            }

            [fields addObject:STObjectFromValueOfType(((char *)value)+offset,
                                                      type)];

            offset += size;
            type = nextType;
        }
    }
    return self;
}
- (void)dealloc
{
    RELEASE(fields);
    RELEASE(structType);
    RELEASE(name);
    [super dealloc];
}

- (void)getValue:(void *)value
{
    const char *type = [structType cString];
    const char *nextType;
    NSUInteger  offset = 0;
    NSUInteger  size, align;
    NSUInteger  rem;
    NSUInteger  i = 0;
    
    type++;
    while (*type != _C_STRUCT_E && *type++ != '=');

    while(*type != _C_STRUCT_E)
    {
        nextType = NSGetSizeAndAlignment(type, &size, &align);

        rem = offset % align;
        if(rem != 0)
        {
            offset += align - rem;
        }

        STGetValueOfTypeFromObject((char*)value+offset,
                                   type,
                                   [fields objectAtIndex:i++]);

        offset += size;                                 
	type = nextType;
    }
}

- (const char *)type
{
    return [structType cString];
}
- (NSString *)structureName
{
    return name;
}
- (const char *)typeOfFieldAtIndex:(NSUInteger)index
{
    const char *type = [structType cString];
    
    for(type += 1; *type != _C_STRUCT_E && index>0; index--)
    {
        type = objc_skip_argspec(type);
    }

    if(*type == _C_STRUCT_E)
    {
        [NSException raise:STInternalInconsistencyException
                    format:@"invalid structure field index"];
        return 0;
    }
    return type;    
}
- (NSRange)rangeValue
{
    /* FIXME: do some checking */
    return NSMakeRange([self integerValueAtIndex:0],[self integerValueAtIndex:1]);
}

- (NSPoint)pointValue
{
    /* FIXME: do some checking */
    return NSMakePoint([self floatValueAtIndex:0],[self floatValueAtIndex:1]);
}

- (NSSize)sizeValue
{
    /* FIXME: do some checking */
    return NSMakeSize([self floatValueAtIndex:0],[self floatValueAtIndex:1]);
}

- (NSRect)rectValue
{
    NSPoint origin = [[fields objectAtIndex:0] pointValue];
    NSSize size = [[fields objectAtIndex:1] sizeValue];
    NSRect rect;
    
    /* FIXME: do some checking */
    rect.origin = origin;
    rect.size = size;
    return rect;
}

- valueAtIndex:(NSUInteger)index
{
    return [fields objectAtIndex:index];
}
- (void)setValue:anObject atIndex:(NSUInteger)index
{
    [fields replaceObjectAtIndex:index withObject:anObject];
}

- (int)intValueAtIndex:(NSUInteger)index
{
    return [[fields objectAtIndex:index] intValue];
}
- (NSInteger)integerValueAtIndex:(NSUInteger)index
{
    return [[fields objectAtIndex:index] integerValue];
}
- (float)floatValueAtIndex:(NSUInteger)index
{
    return (float)[[fields objectAtIndex:index] floatValue];
}

/* NSRange */

- (NSUInteger)location
{
    return [[fields objectAtIndex:0] integerValue];
}

- (NSUInteger)length
{
    return [[fields objectAtIndex:1] integerValue];
}

- (void)setLocation:(NSUInteger)location
{
    NSNumber *n = [NSNumber numberWithUnsignedInteger:location];
    [fields replaceObjectAtIndex:0 withObject:n];
}

- (void)setLength:(NSUInteger)length
{
    NSNumber *n = [NSNumber numberWithUnsignedInteger:length];
    [fields replaceObjectAtIndex:1 withObject: n];
}

/* NSPoint */

- (float)x
{
    return [[fields objectAtIndex:0] floatValue];
}

- (void)setX:(float)x
{
    [fields replaceObjectAtIndex:0 withObject: [NSNumber numberWithFloat:x]];
}

- (float)y
{
    return [[fields objectAtIndex:1] floatValue];
}

- (void)setY:(float)y
{
    [fields replaceObjectAtIndex:1 withObject: [NSNumber numberWithFloat:y]];
}

- extent:(NSSize)size
{
    NSRect rect;
    rect = NSMakeRect([self x], [self y], size.width, size.height);
    return [[self class] structureWithRect:rect];
}

- corner:(NSPoint)corner
{
    NSRect rect;
    rect = NSMakeRect([self x], [self y], 0, 0);
    if (corner.x >= rect.origin.x)
    {
	rect.size.width = corner.x - rect.origin.x;
    }
    else
    {
	rect.size.width = rect.origin.x - corner.x;
	rect.origin.x = corner.x;
    }
    if (corner.y >= rect.origin.y)
    {
	rect.size.height = corner.y - rect.origin.y;
    }
    else
    {
	rect.size.height = rect.origin.y - corner.y;
	rect.origin.y = corner.y;
    }
    return [[self class] structureWithRect:rect];
}

/* NSSize */

- (float)width
{
    return [[fields objectAtIndex:0] floatValue];
}

- (float)height
{
    return [[fields objectAtIndex:1] floatValue];
}

- (void)setWidth:(float)width
{
    [fields replaceObjectAtIndex:0 withObject: [NSNumber numberWithFloat:width]];
}
- (void)setHeight:(float)height
{
    [fields replaceObjectAtIndex:1 withObject: [NSNumber numberWithFloat:height]];
}

/* NSRect */

- (id)origin
{
    NSLog(@"Origin %@", [fields objectAtIndex:0]);
    return [fields objectAtIndex:0];
}

- (id)size
{
    NSLog(@"Size %@", [fields objectAtIndex:1]);
    return [fields objectAtIndex:1] ;
}

@end
