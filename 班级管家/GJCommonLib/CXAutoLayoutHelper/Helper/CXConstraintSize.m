//
//  CXConstraintSize.m
//  控件开发项目专用
//
//  Created by apple on 15/2/15.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CXConstraintSize.h"

@interface CXConstraintSize()
@property(nonatomic ,strong) NSLayoutConstraint *widthConstraint;
@property(nonatomic ,strong) NSLayoutConstraint *heightConstraint;
@end

@implementation CXConstraintSize


+(instancetype)sizeWithFirstItem:(UIView *)firstItem
{
    CXConstraintSize *obj=[[CXConstraintSize alloc] init];
    obj.firstItem=firstItem;
    return obj;
}

-(void)equalToCGsize:(CGSize)size
{
    NSAssert(self.firstItem.superview, @"%@未添加到父视图上",self.firstItem);
    self.firstItem.translatesAutoresizingMaskIntoConstraints=NO;
    self.widthConstraint=[NSLayoutConstraint constraintWithItem:self.firstItem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:size.width];
    self.heightConstraint=[NSLayoutConstraint constraintWithItem:self.firstItem attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:size.height];
    [self.firstItem addConstraint:self.widthConstraint];
    [self.firstItem addConstraint:self.heightConstraint];
}

-(CGFloat)widthConstant
{
    return self.widthConstraint.constant;
}

-(void)setWidthConstant:(CGFloat)widthConstant
{
    self.widthConstraint.constant=widthConstant;
}

-(CGFloat)heightConstant
{
    return self.heightConstraint.constant;
}

-(void)setHeightConstant:(CGFloat)heightConstant
{
    self.heightConstraint.constant=heightConstant;
}


-(CGSize)sizeConstant
{
    return CGSizeMake(self.widthConstraint.constant, self.heightConstraint.constant);
}

@end
