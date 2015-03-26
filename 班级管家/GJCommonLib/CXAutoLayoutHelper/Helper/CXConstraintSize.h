//
//  CXConstraintSize.h
//  控件开发项目专用
//
//  Created by apple on 15/2/15.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface CXConstraintSize : NSObject

/**
 *  被约束的视图
 */
@property (nonatomic ,weak    ) UIView             *firstItem;


/**
 *  size的Width常量 改变可以引起视图width变化
 */
@property (nonatomic ,assign  ) CGFloat            widthConstant;

/**
 *  size的Height常量 改变可以引起视图Height变化
 */
@property (nonatomic ,assign  ) CGFloat            heightConstant;

/**
 *  size的size常量  可以用于给其他视图做参考 也可以更改
 */
@property (nonatomic ,assign  ) CGSize             sizeConstant;

+(instancetype)sizeWithFirstItem:(UIView *)firstItem;
-(void)equalToCGsize:(CGSize )size;
@end
