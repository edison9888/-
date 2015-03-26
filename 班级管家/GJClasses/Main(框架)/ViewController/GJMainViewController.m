//
//  GJMainViewController.m
//  班级管家
//
//  Created by 陈雄 on 15/3/26.
//  Copyright (c) 2015年 陈雄. All rights reserved.
//

#import "GJMainViewController.h"
#import "GJMsgViewController.h"
#import "GJSaveViewController.h"
#import "GJDownloadViewController.h"
#import "GJAddViewController.h"

@interface GJMainViewController ()

@end

@implementation GJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self addControllers];
}

-(void)addControllers
{
    GJMsgViewController *msgViewController=[[GJMsgViewController alloc] init];
    [self addChildViewController:msgViewController];
    
    
    GJSaveViewController *saveViewController=[[GJSaveViewController alloc] init];
    [self addChildViewController:saveViewController];
    
    GJDownloadViewController *downLoadViewController=[[GJDownloadViewController alloc] init];
    [self addChildViewController:downLoadViewController];
    
    GJAddViewController *addViewController=[[GJAddViewController alloc] init];
    [self addChildViewController:addViewController];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
