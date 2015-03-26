//
//  MenuTableViewCell.h
//  iWUT
//
//  Created by apple on 14/12/14.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WHUTLeftCellModel.h"
@interface MenuTableViewCell : UITableViewCell
@property(nonatomic ,strong) WHUTLeftCellModel *model;
-(void)startAnimationWithDelay:(CGFloat)delay;
@end
