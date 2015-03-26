//
//  CXConstraintAttribute.h
//  控件开发项目专用
//
//  Created by apple on 15/2/15.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CXConstraintCommonUse.h"

@interface CXConstraintAttribute : NSObject

/**
 *  被约束的视图
 */
@property (nonatomic ,weak    ) UIView            *firstItem;

/**
 *  与被约束视图相关的视图
 */
@property (nonatomic ,weak    ) UIView            *secondItem;

/**
 *  被约束视图被约束的属性
 */
@property (nonatomic ,assign  ) CXLayoutAttribute layoutAttribute;

/**
 *  距离常数 修改可以引起变化
 */
@property (nonatomic ,assign  ) CGFloat           constant;

/**
 *  实例
 *
 *  @return CXConstraintAttribute 实例
 */
+(instancetype)attribute;

/**
 *  实例
 *
 *  @param layoutAttribute 被约束视图被约束的属性
 *
 *  @return 带有约束属性的 CXConstraintAttribute 实例
 */
+(instancetype)attributeWithLayoutAttribute:(CXLayoutAttribute )layoutAttribute;

#pragma mark 约束方式1
/**
 *  计算表达式
 *
 *  @param attr 相关视图的单一属性
 *  @param mul  倍数
 *  @param con  距离常数
 */
-(void)equalTo:(CXConstraintAttribute *)attr multiplier:(NSUInteger)mul constant:(CGFloat)con;
@end
