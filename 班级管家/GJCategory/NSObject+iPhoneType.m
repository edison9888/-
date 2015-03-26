//
//  NSObject+iPhoneType.m
//  iWUT
//
//  Created by apple on 15/1/27.
//  Copyright (c) 2015年 WUTNEWS. All rights reserved.
//

#import "NSObject+iPhoneType.h"

@implementation NSObject (iPhoneType)
-(IphoneType)getIphoneType
{
    NSInteger height=[UIScreen mainScreen].bounds.size.height;
    switch (height) {
        case IphoneTypeIphone4:
            return IphoneTypeIphone4;
            break;
        case IphoneTypeIphone5:
            return IphoneTypeIphone5;
            break;
        case IphoneTypeIphone6:
            return IphoneTypeIphone6;
            break;
        case IphoneTypeIphone6Plus:
            return IphoneTypeIphone6Plus;
            break;
        default:
            return IphoneTypeIphoneOther;
            break;
    }
}



@end
