//
//  CXConstraintCommonUse.h
//  控件开发项目专用
//
//  Created by apple on 15/2/15.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#define getterImplementionCode(propertyName,attribute) \
if (_##propertyName==nil) {\
_##propertyName=[CXConstraintAttribute attributeWithLayoutAttribute:CXLayoutAttribute##attribute];\
_##propertyName.firstItem=self.firstItem;\
}\
return _##propertyName;


typedef NS_ENUM(NSInteger, CXLayoutAttribute) {
    CXLayoutAttributeLeft    = NSLayoutAttributeLeft,
    CXLayoutAttributeRight   = NSLayoutAttributeRight,
    CXLayoutAttributeTop     = NSLayoutAttributeTop,
    CXLayoutAttributeBottom  = NSLayoutAttributeBottom,
    CXLayoutAttributeWidth   = NSLayoutAttributeWidth,
    CXLayoutAttributeHeight  = NSLayoutAttributeHeight,
    CXLayoutAttributeCenterX = NSLayoutAttributeCenterX,
    CXLayoutAttributeCenterY = NSLayoutAttributeCenterY,
};