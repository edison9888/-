//
//  MenuHeaderView.h
//  iWUT
//
//  Created by apple on 14/12/13.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuHeaderView : UIView
@property(nonatomic ,strong) UIButton *userButton;
@property(nonatomic ,strong) UILabel *nameLable;
@property(nonatomic ,strong) UILabel *majorLabel;
+(instancetype)headerView;
@end
