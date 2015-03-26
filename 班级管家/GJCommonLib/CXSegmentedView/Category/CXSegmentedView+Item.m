//
//  CXSegmentedView+Item.m
//  控件开发项目专用
//
//  Created by apple on 15/1/29.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "CXSegmentedView+Item.h"
#import "CXSegmentedModel.h"
#import "CXSegmentedButton.h"

@implementation CXSegmentedView (Item)
-(NSArray *)getItems
{
    NSMutableArray *items=[NSMutableArray array];
    for (NSInteger i = 0; i <self.models.count; i ++) {
        CXSegmentedButton *item=[CXSegmentedButton buttonWithType:UIButtonTypeCustom];
        [items addObject:item];
    }
    return items;
}

-(CGFloat)getItemWidth
{
    CGFloat itemWidth;
    CGFloat contentViewWidth=CGRectGetWidth(self.frame)-self.contentEdgeInsets.left-self.contentEdgeInsets.right;
    if (self.models.count<=self.minimumItemNumberForLine) {
        itemWidth = (contentViewWidth-(self.minimumItemNumberForLine-1)*self.itemSpacing)/self.models.count;
    }
    else{
        itemWidth = (contentViewWidth-(self.minimumItemNumberForLine-1)*self.itemSpacing)/self.minimumItemNumberForLine;
    }
    _pageWidth=self.itemSpacing+itemWidth;
    return itemWidth;
}

-(CGFloat)getItemHeight
{
    return (CGRectGetHeight(self.frame)-self.contentEdgeInsets.top-self.contentEdgeInsets.bottom);
}

@end
