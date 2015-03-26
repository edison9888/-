//
//  NewMMDrawerController.m
//  班级管家
//
//  Created by 陈雄 on 15/3/26.
//  Copyright (c) 2015年 陈雄. All rights reserved.
//

#import "NewMMDrawerController.h"

@interface NewMMDrawerController ()

@end

@implementation NewMMDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateShadowForCenterView{
    self.centerViewController.view.layer.shadowRadius = 5;
    self.centerViewController.view.layer.shadowOpacity = 0.3;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
