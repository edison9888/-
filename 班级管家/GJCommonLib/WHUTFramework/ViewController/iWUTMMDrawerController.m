//
//  iWUTMMDrawerController.m
//  iWUT
//
//  Created by psscar on 15/2/25.
//  Copyright (c) 2015年 WUTNEWS. All rights reserved.
//

#import "iWUTMMDrawerController.h"

@interface iWUTMMDrawerController ()

@end

@implementation iWUTMMDrawerController

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
