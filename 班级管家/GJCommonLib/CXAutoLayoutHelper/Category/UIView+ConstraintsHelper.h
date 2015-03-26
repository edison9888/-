//
//  UIView+AutoLayout.h
//  控件开发项目专用
//
//  Created by apple on 15/1/26.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ConstraintsHelper;
@interface UIView (constraintsHelper)
/**
 *  约束助手
 */
@property(nonatomic ,strong ,readonly) ConstraintsHelper  *constraintHelper;


/**
 *  取得最近的公共父视图
 *
 *  @param view 与被约束视图相关的视图
 *
 *  @return 父视图
 */
- (instancetype)getCommonSuperview:(UIView *)view;
@end
