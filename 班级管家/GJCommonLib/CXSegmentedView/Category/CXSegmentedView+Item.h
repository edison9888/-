//
//  CXSegmentedView+Item.h
//  控件开发项目专用
//
//  Created by apple on 15/1/29.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "CXSegmentedView.h"
@interface CXSegmentedView (Item)

//用于某些特定情况
-(CGFloat)getItemWidth;
-(CGFloat)getItemHeight;
-(NSArray *)getItems;

@end
