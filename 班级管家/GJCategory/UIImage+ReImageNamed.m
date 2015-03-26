//
//  UIImageView+ReImageNamed.m
//  iWUT
//
//  Created by apple on 15/1/12.
//  Copyright (c) 2015年 WUTNEWS. All rights reserved.
//

#import "UIImage+ReImageNamed.h"


@implementation UIImage(ReImageNamed)

+(NSString *)getSuffixWithImageName
{
    switch ([self getIphoneType]) {
        case IphoneTypeIphone4:
            return @"";
            break;
        case IphoneTypeIphone5:
            return @"-568h";
            break;
        case IphoneTypeIphone6:
            return @"-1334h";
            break;
        case IphoneTypeIphone6Plus:
            return @"";
            break;
        default:
            return nil;
            break;
    }
}

+(UIImage *)imageWithIntelligentName:(NSString *)name
{
    NSString *intelligentName;
    NSString *suffix=[self getSuffixWithImageName];
    if (suffix) {
        intelligentName=[NSString stringWithFormat:@"%@%@",name,suffix];
    }
    else {
        intelligentName=name;
    }
    return [UIImage imageNamed:intelligentName];
}

@end
