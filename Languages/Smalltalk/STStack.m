/**
    STStack.m
    Temporaries and stack storage.
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StepTalk project.
 
 */

#import "STStack.h"

#import <StepTalk/STExterns.h>

#import <Foundation/NSException.h>
#import <Foundation/NSDebug.h>

@implementation STStack
+ stackWithSize:(NSUInteger)newSize
{
    return AUTORELEASE([[self alloc] initWithSize:newSize]);
}

- initWithSize:(NSUInteger)newSize
{
    if ((self = [super init]) != nil)
    {
        size = newSize;
        pointer = 0;
        stack = NSZoneMalloc( NSDefaultMallocZone(), size * sizeof(id) );
    }
    return self;
}

- (void)invalidPointer:(NSUInteger)ptr
{
    [NSException raise:STInternalInconsistencyException
                format:@"%@: invalid pointer %lu (sp=%lu size=%lu)",
                        self,
                        (unsigned long)ptr,
                        (unsigned long)pointer,
                        (unsigned long)size];
}
- (void)dealloc
{
    NSZoneFree(NSDefaultMallocZone(),stack);
    [super dealloc];
}

#define INDEX_IS_VALID(index) \
            ((index >= 0) && (index < size))
            
#define CHECK_POINTER(value) \
            do {\
                if(!INDEX_IS_VALID(value)) \
                {\
                    [self invalidPointer:value];\
                } \
            }\
            while(0) 
/*
- (void)setPointer:(NSUInteger)newPointer
{
    CHECK_POINTER(newPointer);
    pointer=newPointer;
}
*/

- (NSUInteger)pointer
{
    return pointer;
}

- (void)push:(id)value
{
    CHECK_POINTER(pointer);

    NSDebugLLog(@"STStack",@"stack:%p %02lu push '%@'",
                self,(unsigned long)pointer,value);
    
    stack[pointer++] = value;
}

- (void)duplicateTop
{
    [self push:[self valueAtTop]];
}
#define CONVERT_NIL(obj) ((obj == STNil) ? nil : (obj))
- (id)valueAtTop
{
    CHECK_POINTER(pointer-1);

    return CONVERT_NIL(stack[pointer-1]);
}
- (id)valueFromTop:(NSUInteger)index
{
    id value;

    CHECK_POINTER(pointer-index-1);

    value = stack[pointer - index - 1];
    NSDebugLLog(@"STStack",@"stack:%p %02li from top %li '%@'",
                  self,(unsigned long)pointer,(unsigned long)index,value);

    return CONVERT_NIL(value);
}

- (id)pop
{
    CHECK_POINTER(pointer-1);

    NSDebugLLog(@"STStack",@"stack:%p %02li pop '%@'",
                self,(unsigned long)pointer,stack[pointer-1]);

    pointer --;
    return CONVERT_NIL(stack[pointer]);
}

- (void)popCount:(NSUInteger)count
{
    CHECK_POINTER(pointer-count);

    NSDebugLLog(@"STStack",@"stack:%p %02lu pop count %lu (%li)",self,
                 (unsigned long)pointer,(unsigned long)count,
                 (long)(pointer-count));
    pointer -= count;
}
- (void)empty
{
    pointer = 0;
}

@end
