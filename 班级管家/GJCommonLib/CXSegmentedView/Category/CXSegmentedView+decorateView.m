//
//  CXSegmentedView+decorateView.m
//  控件开发项目专用
//
//  Created by apple on 15/1/29.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "CXSegmentedView+decorateView.h"
#import "CXSegmentedView+Item.h"
#import "CXSegmentedButton.h"

@implementation CXSegmentedView (decorateView)

-(CGRect)getDecorateViewFrame
{
    if (_items.count==0) {
        self.decorateViewForSelectedItem.bounds=CGRectZero;
    }
    CGFloat decorateViewWidth=CGRectGetWidth(_decorateViewForSelectedItem.frame);
    CGFloat decorateViewHeight=CGRectGetHeight(_decorateViewForSelectedItem.frame);
    CGFloat orignX=self.selectedIndex*([self getItemWidth]+self.itemSpacing)+([self getItemWidth]-decorateViewWidth)/2+self.decorateViewEdgeInsets.left-self.decorateViewEdgeInsets.right;
    CGFloat orignY=[self getItemHeight]-decorateViewHeight+self.decorateViewEdgeInsets.top-self.decorateViewEdgeInsets.bottom;
    CGRect frame=CGRectMake(orignX, orignY, decorateViewWidth, decorateViewHeight);
    return frame;
}

-(void)upDateDecorateViewFrame
{
    self.decorateViewForSelectedItem.frame=[self getDecorateViewFrame];
}



@end
