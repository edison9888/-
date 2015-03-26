//
//  CXConstraintPoint.m
//  控件开发项目专用
//
//  Created by apple on 15/2/15.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "CXConstraintEdges.h"
#import "CXConstraintAttribute.h"
#import "CXConstraintCommonUse.h"
#import "UIView+ConstraintsHelper.h"
#import "ConstraintsHelper.h"

@interface CXConstraintEdges()

@property (nonatomic ,strong) CXConstraintAttribute *left;
@property (nonatomic ,strong) CXConstraintAttribute *right;
@property (nonatomic ,strong) CXConstraintAttribute *top;
@property (nonatomic ,strong) CXConstraintAttribute *bottom;
@end

@implementation CXConstraintEdges

+(instancetype)edgesWithFirstItem:(UIView *)firstItem
{
    CXConstraintEdges *obj=[[CXConstraintEdges alloc] init];
    obj.firstItem=firstItem;
    
    return obj;
}

-(void)equalToInsets:(UIEdgeInsets)insets
{
    UIView *superView=self.firstItem.superview;
    [self.firstItem.constraintHelper.left equalTo:superView.constraintHelper.left multiplier:1 constant:insets.left];
    [self.firstItem.constraintHelper.right equalTo:superView.constraintHelper.right multiplier:1 constant:-insets.right];
    [self.firstItem.constraintHelper.top equalTo:superView.constraintHelper.top multiplier:1 constant:insets.top];
    [self.firstItem.constraintHelper.bottom equalTo:superView.constraintHelper.bottom multiplier:1 constant:-insets.bottom];
}


-(CXConstraintAttribute *)left
{
    getterImplementionCode(left, Left)
}

-(CXConstraintAttribute *)right
{
    getterImplementionCode(right, Right)
}

-(CXConstraintAttribute *)top
{
    getterImplementionCode(top , Top)
}

-(CXConstraintAttribute *)bottom
{
    getterImplementionCode(bottom, Bottom)
}


-(UIEdgeInsets)insetsConstant
{
    return UIEdgeInsetsMake(self.firstItem.constraintHelper.top.constant, self.firstItem.constraintHelper.left.constant, self.firstItem.constraintHelper.bottom.constant, self.firstItem.constraintHelper.right.constant);
}


-(void)setInsetsConstant:(UIEdgeInsets)insetsConstant
{
    if (UIEdgeInsetsEqualToEdgeInsets(self.insetsConstant, insetsConstant) ) return;
    self.firstItem.constraintHelper.left.constant=insetsConstant.left;
    self.firstItem.constraintHelper.right.constant=-insetsConstant.right;
    self.firstItem.constraintHelper.top.constant=insetsConstant.top;
    self.firstItem.constraintHelper.bottom.constant=-insetsConstant.bottom;
}


@end
