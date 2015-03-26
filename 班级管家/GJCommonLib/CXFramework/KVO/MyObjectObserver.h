//
//  CXFrameworkObserver.h
//  iWUT
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyObjectObserver : NSObject
@property (nonatomic, weak  ) id  target;
@property (nonatomic, assign) SEL selector;
+ (instancetype)observeObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector __attribute__((warn_unused_result));

/// Create a key-value-observer with the given KVO options
+ (instancetype)observeObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options __attribute__((warn_unused_result));

@end
