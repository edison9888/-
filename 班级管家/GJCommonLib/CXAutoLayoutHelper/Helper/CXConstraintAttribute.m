//
//  CXConstraintAttribute.m
//  控件开发项目专用
//
//  Created by apple on 15/2/15.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "CXConstraintAttribute.h"
#import "UIView+ConstraintsHelper.h"
@interface CXConstraintAttribute()
@property(nonatomic ,strong) NSLayoutConstraint *layoutConstraint;
@end

@implementation CXConstraintAttribute
+(instancetype)attribute
{
    return [[CXConstraintAttribute alloc] init];
}

+(instancetype)attributeWithLayoutAttribute:(CXLayoutAttribute)layoutAttribute
{
    CXConstraintAttribute *obj=[CXConstraintAttribute attribute];
    obj.layoutAttribute=layoutAttribute;
    return obj;
}


-(void)equalTo:(CXConstraintAttribute *)attr multiplier:(NSUInteger)mul constant:(CGFloat)con
{
    
    NSAssert(self.firstItem.superview, @"%@未添加到父视图上",self.firstItem);
    self.secondItem=attr.firstItem;
    self.layoutConstraint=[NSLayoutConstraint constraintWithItem:self.firstItem attribute:(NSLayoutAttribute)self.layoutAttribute relatedBy:NSLayoutRelationEqual toItem:self.secondItem attribute:(NSLayoutAttribute)attr.layoutAttribute multiplier:mul constant:con];
    self.firstItem.translatesAutoresizingMaskIntoConstraints=NO;
    
    UIView *commonSuperView;
    if ( (self.layoutAttribute==CXLayoutAttributeWidth || self.layoutAttribute==CXLayoutAttributeHeight) && (attr==nil)) {
        commonSuperView=self.firstItem;
    }
    else{
        commonSuperView=[self.firstItem getCommonSuperview:self.secondItem];
    }
    [commonSuperView addConstraint:self.layoutConstraint];
}

-(CGFloat)constant
{
    return self.layoutConstraint.constant;
}


-(void)setConstant:(CGFloat)constant
{
    self.layoutConstraint.constant=constant;
}

@end
