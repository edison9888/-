//
//  UIView+AutoLayout.m
//  控件开发项目专用
//
//  Created by apple on 15/1/26.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "UIView+ConstraintsHelper.h"
#import "ConstraintsHelper.h"
#import <objc/runtime.h>

@interface UIView()
@property(nonatomic ,strong) NSCache *cache;
@end


@implementation UIView (constraintsHelper)

- (NSCache *)cache
{
    static NSCache *_cache=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _cache=[[NSCache alloc] init];
    });
    return objc_getAssociatedObject(self, @selector(cache))?:_cache;
}


-(void)setCache:(NSCache *)cache
{
    objc_setAssociatedObject(self, @selector(cache), cache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (ConstraintsHelper *)constraintHelper {
    ConstraintsHelper * _helper = [self.cache objectForKey:[self viewID]];
    if (_helper==nil) {
        _helper=[ConstraintsHelper helper];
        _helper.firstItem=self;
        [self.cache setObject:_helper forKey:[self viewID]];
        [_helper setHelperCache:self.cache viewID:[self viewID]];
    };
    return _helper;
}

-(void)setConstraintHelper:(ConstraintsHelper *)constraintHelper
{
    objc_setAssociatedObject(self, @selector(constraintHelper), constraintHelper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/*
 *  from GITHUB Masonry
 *  UIView *commonSuperview = [firstView cx_CommonSuperview:secondView];
 *
 */
- (instancetype)getCommonSuperview:(UIView *)view {
    UIView *closestCommonSuperview = nil;
    UIView *secondViewSuperview = view;
    while (!closestCommonSuperview && secondViewSuperview) {
        UIView *firstViewSuperview = self;
        while (!closestCommonSuperview && firstViewSuperview) {
            if (secondViewSuperview == firstViewSuperview) {
                closestCommonSuperview = secondViewSuperview;
            }
            firstViewSuperview = firstViewSuperview.superview;
        }
        secondViewSuperview = secondViewSuperview.superview;    }
    return closestCommonSuperview;
}

-(NSString *)viewID
{
    return [NSString stringWithFormat:@"%p",self];
}


@end
