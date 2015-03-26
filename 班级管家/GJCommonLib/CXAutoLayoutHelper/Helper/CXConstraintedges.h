//
//  CXConstraintPoint.h
//  控件开发项目专用
//
//  Created by apple on 15/2/15.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CXConstraintEdges : NSObject

/**
 *  被约束的视图
 */
@property (nonatomic ,weak    ) UIView            *firstItem;

/**
 *  边界常量 改变会引起视图变化
 */
@property (nonatomic ,assign) UIEdgeInsets insetsConstant;

+(instancetype)edgesWithFirstItem:(UIView *)firstItem;
-(void)equalToInsets:(UIEdgeInsets)insets;
@end
