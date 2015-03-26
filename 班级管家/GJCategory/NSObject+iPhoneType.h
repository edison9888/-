//
//  NSObject+iPhoneType.h
//  iWUT
//
//  Created by apple on 15/1/27.
//  Copyright (c) 2015年 WUTNEWS. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    IphoneTypeIphone4     = 480,
    IphoneTypeIphone5     = 568,
    IphoneTypeIphone6     = 667,
    IphoneTypeIphone6Plus = 736,
    IphoneTypeIphoneOther
} IphoneType;

@interface NSObject (iPhoneType)
-(IphoneType)getIphoneType;
@end
