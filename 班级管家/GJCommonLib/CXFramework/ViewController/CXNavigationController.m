//
//  TitleViewController.m
//  掌上理工大
//
//  Created by apple on 14/7/10.
//  Copyright (c) 2014年 cx. All rights reserved.
//
#import "CXNavigationController.h"
@interface CXNavigationController()
@end

@implementation CXNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.translucent=NO;
    [self.navigationBar setBarTintColor:kColor(50, 59, 165)];
//    UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, 1)];
//    lineView.backgroundColor=kColor(50, 59, 165);
//    [self.navigationBar addSubview:lineView];
}




@end
