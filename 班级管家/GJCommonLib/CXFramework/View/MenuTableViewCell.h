//
//  MenuTableViewCell.h
//  iWUT
//
//  Created by apple on 14/12/14.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DrawerLeftCellModel.h"
@interface MenuTableViewCell : UITableViewCell
@property(nonatomic ,strong) DrawerLeftCellModel *model;
-(void)startAnimationWithDelay:(CGFloat)delay;
@end
