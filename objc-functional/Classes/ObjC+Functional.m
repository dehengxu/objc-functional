//
//  Objc+Functional.h
//  Pods
//
//  Created by Deheng Xu on 2019/12/21.
//

#import "public/ObjC+Functional.h"

@implementation NSArray (NXFunctional)

- (instancetype)nx_map:(id _Nonnull (^)(id value))mapBlock {

    // Return directly
    if (!mapBlock) return self;

    NSMutableArray *retVal = @[].mutableCopy;
    for (id obj in self) {
        [retVal addObject:mapBlock(obj)];
    }
    return retVal.copy;
}

- (instancetype)nx_filter:(BOOL (^)(id _Nonnull))filterBlock
{
    if (!filterBlock) return self;

    NSMutableArray *retVal = @[].mutableCopy;
    for (id obj in self) {
        if (filterBlock(obj)) {
            [retVal addObject:obj];
        }
    }
    return retVal.copy;
}

- (id)nx_reduce:(id  _Nonnull (^)(id _Nonnull, id _Nonnull, NSUInteger))reduceBlock
{
    if (!reduceBlock) return [NSNull null];

    return [self nx_reduce:reduceBlock withInitial:nil];
}

- (id)nx_reduce:(id  _Nonnull (^)(id _Nonnull, id _Nonnull, NSUInteger))reduceBlock withInitial:(id)value
{
    if (!reduceBlock) return [NSNull null];

    id retVal = value;
    for (NSUInteger i = 0; i < self.count; i ++) {
        retVal = reduceBlock(retVal, self[i], i);
    }
    return retVal;
}

@end

@implementation NSOrderedSet (NXFunctional)

- (instancetype)nx_map:(id _Nonnull (^)(id value))mapBlock {

    // Return directly
    if (!mapBlock) return self;

    NSMutableArray *retVal = @[].mutableCopy;
    for (id obj in self) {
        [retVal addObject:mapBlock(obj)];
    }
    return retVal.copy;
}

- (instancetype)nx_filter:(BOOL (^)(id _Nonnull))filterBlock
{
    if (!filterBlock) return self;

    NSMutableArray *retVal = @[].mutableCopy;
    for (id obj in self) {
        if (filterBlock(obj)) {
            [retVal addObject:obj];
        }
    }
    return retVal.copy;
}

- (id)nx_reduce:(id  _Nonnull (^)(id _Nonnull, id _Nonnull, NSUInteger))reduceBlock
{
    if (!reduceBlock) return [NSNull null];

    return [self nx_reduce:reduceBlock withInitial:nil];
}

- (id)nx_reduce:(id  _Nonnull (^)(id _Nonnull, id _Nonnull, NSUInteger))reduceBlock withInitial:(id)value
{
    if (!reduceBlock) return [NSNull null];

    id retVal = value;
    for (NSUInteger i = 0; i < self.count; i ++) {
        retVal = reduceBlock(retVal, self[i], i);
    }
    return retVal;
}

@end

