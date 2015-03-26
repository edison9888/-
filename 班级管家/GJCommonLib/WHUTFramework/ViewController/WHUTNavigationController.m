//
//  TitleViewController.m
//  掌上理工大
//
//  Created by apple on 14/7/10.
//  Copyright (c) 2014年 cx. All rights reserved.
//
#import "WHUTNavigationController.h"
@interface WHUTNavigationController()
@end

@implementation WHUTNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.translucent=NO;
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    //遮住恶心的黑线
    UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, 1)];
    lineView.backgroundColor=[UIColor whiteColor];
    [self.navigationBar addSubview:lineView];
}




@end
