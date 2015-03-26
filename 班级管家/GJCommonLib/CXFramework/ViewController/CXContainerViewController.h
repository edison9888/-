//
//  MainViewController.h
//  掌上理工大
//
//  Created by apple on 14/7/11.
//  Copyright (c) 2014年 cx. All rights reserved.


#import <UIKit/UIKit.h>
#import "CXFrameworkCommonUse.h"
@class CXNavigationController,iWUTMMDrawerController;
@interface CXContainerViewController : UIViewController
@property (nonatomic ,strong,readonly ) CXNavigationController *navigationController;
@property (nonatomic ,strong,readonly ) UIViewController         *selectedViewController;
/**
 *  用于在外部推送控制器
 */
-(void)pushToControllerType:(CXViewControllerType)type;
@end
