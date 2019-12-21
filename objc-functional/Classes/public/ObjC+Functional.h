//
//  Objc+Functional.h
//  Pods
//
//  Created by Deheng Xu on 2019/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (NXFunctional)

- (instancetype)nx_map:(id(^)(id value))mapBlock;
- (instancetype)nx_filter:(BOOL(^)(id value))filterBlock;
- (id)nx_reduce:(id(^)(id _Nullable previousResult, id current, NSUInteger currentIndex))reduceBlock;
- (id)nx_reduce:(id(^)(id _Nullable previousResult, id current, NSUInteger currentIndex))reduceBlock withInitial:(id _Nullable) value;

@end

@interface NSOrderedSet (NXFunctional)

- (instancetype)nx_map:(id(^)(id value))mapBlock;
- (instancetype)nx_filter:(BOOL(^)(id value))filterBlock;
- (id)nx_reduce:(id(^)(id _Nullable previousResult, id current, NSUInteger currentIndex))reduceBlock;
- (id)nx_reduce:(id(^)(id _Nullable previousResult, id current, NSUInteger currentIndex))reduceBlock withInitial:(id _Nullable) value;

@end

NS_ASSUME_NONNULL_END
