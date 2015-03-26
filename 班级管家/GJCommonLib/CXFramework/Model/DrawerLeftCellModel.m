//
//  MenuCellDescribe.m
//  掌上理工大
//
//  Created by apple on 14/8/15.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import "DrawerLeftCellModel.h"

@implementation DrawerLeftCellModel
+(NSArray *)modelObjects
{
    return [DrawerLeftCellModel objectArrayWithFile:kMenuArrayPath];
}
@end
