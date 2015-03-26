//
//  MenuCellDescribe.h
//  掌上理工大
//
//  Created by apple on 14/8/15.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MJExtension.h"

@interface DrawerLeftCellModel : NSObject

@property (nonatomic ,copy) NSString *text;
@property (nonatomic ,copy) NSString *image;
+(NSArray *)modelObjects;

@end
