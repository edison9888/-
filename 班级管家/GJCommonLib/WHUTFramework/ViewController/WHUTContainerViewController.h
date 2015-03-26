//
//  MainViewController.h
//  掌上理工大
//
//  Created by apple on 14/7/11.
//  Copyright (c) 2014年 cx. All rights reserved.


#import <UIKit/UIKit.h>
#import "WHUTFrameworkCommonUse.h"
@class WHUTNavigationController,iWUTMMDrawerController;
@interface WHUTContainerViewController : UIViewController
@property (nonatomic ,strong,readonly ) WHUTNavigationController *navigationController;
@property (nonatomic ,strong,readonly ) UIViewController         *selectedViewController;
/**
 *  用于在外部推送控制器
 */
-(void)pushToControllerType:(WHUTViewControllerType)type;
@end
