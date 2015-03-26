//
//  ConstraintsHelper.h
//  控件开发项目专用
//
//  Created by apple on 15/2/14.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXConstraintCommonUse.h"

@import UIKit;
@class CXConstraintAttribute,CXConstraintSize,CXConstraintEdges;
@interface ConstraintsHelper : NSObject
/**
 *  被约束的视图
 */
@property (nonatomic ,weak  ) UIView      *firstItem;

/**
 *  和被约束视图有关系的视图
 */
@property (nonatomic ,weak  ) UIView      *secondItem;

/**
 *  被约束的视图的左边
 */
@property (nonatomic ,strong) CXConstraintAttribute     *left;

/**
 *  被约束的视图的右边
 */
@property (nonatomic ,strong) CXConstraintAttribute     *right;

/**
 *  被约束视图的顶部
 */
@property (nonatomic ,strong) CXConstraintAttribute     *top;

/**
 *  被约束视图的底部
 */
@property (nonatomic ,strong) CXConstraintAttribute     *bottom;

/**
 *  被约束视图的高
 */
@property (nonatomic ,strong) CXConstraintAttribute     *height;

/**
 *  被约束视图的宽
 */
@property (nonatomic ,strong) CXConstraintAttribute     *width;
/**
 *  被约束视图的中心X
 */
@property (nonatomic ,strong) CXConstraintAttribute     *centerX;
/**
 *  被约束视图的中心X
 */
@property (nonatomic ,strong) CXConstraintAttribute     *centerY;

/**
 *  被约束视图的Size
 */

@property (nonatomic ,strong) CXConstraintSize     *size;


/**
 *  距离父视图的缩进
 */
@property (nonatomic ,strong) CXConstraintEdges    *edgeInstes;



+(instancetype)helper;

-(void)setHelperCache:(NSCache *)cache viewID:(NSString *)viewID;
@end
