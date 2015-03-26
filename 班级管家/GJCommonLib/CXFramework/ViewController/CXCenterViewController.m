//
//  BodyViewController.m
//  掌上理工大
//
//  Created by apple on 14/7/11.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import "CXCenterViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface CXCenterViewController()
@end

@implementation CXCenterViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buildNavUI];
}

#pragma mark 建立Center的导航UI
-(void)buildNavUI
{
    UIView *customView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    UIButton *leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame=CGRectMake(0, 0, customView.width, customView.height);
    [leftButton addTarget:self action:@selector(showDock) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitle:@"班级管家" forState:UIControlStateNormal];
    leftButton.titleLabel.adjustsFontSizeToFitWidth=YES;
//    [leftButton setImage:[UIImage imageNamed:@"hamburger"] forState:UIControlStateNormal];
//    [leftButton setImage:[UIImage imageNamed:@"hamburger_highlight"] forState:UIControlStateHighlighted];
    [customView addSubview:leftButton];    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.titleLabel=[[UILabel alloc] init];
    self.titleLabel.bounds                = CGRectMake(0, 0, 100, 30);
    self.titleLabel.center                = CGPointMake(kScreenWidth/2, 44);
    self.titleLabel.font=[UIFont fontWithName:kGJMainFont size:18];
    self.titleLabel.textColor=kColor(80, 80, 80);
    self.titleLabel.textAlignment         = NSTextAlignmentCenter;
    [self.navigationItem setTitleView:self.titleLabel];
}

#pragma mark 开启菜单栏 通知代理
-(void)showDock
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

@end
