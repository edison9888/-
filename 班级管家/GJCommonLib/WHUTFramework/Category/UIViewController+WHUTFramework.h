//
//  UIViewController+WHUTFramework.h
//  iWUT
//
//  Created by apple on 14/11/10.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSInteger, WHUTFrameworkDrawOpenMode){
    WHUTFrameworkDrawOpenModeNone                   = 0,     //关闭
    WHUTFrameworkDrawOpenModePanningNavigationBar   = 1 << 1,//导航条触发开启手势
    WHUTFrameworkDrawOpenModePanningCenterView      = 1 << 2,//非边缘触发侧滑菜单开启手势
    WHUTFrameworkDrawOpenModeBezelPanningCenterView = 1 << 3,//边缘触发侧滑菜单开启手势
};

@class CXFrameworlControllerModel,WHUTContainerViewController;
@interface UIViewController(WHUTFramework)

@property(nonatomic ,assign) WHUTFrameworkDrawOpenMode openMode;
-(void)navPushToViewController:(UIViewController *)viewController;
-(UIViewController *)getCurrentViewControllerFromFramework;
-(WHUTContainerViewController *)getMainViewControllerFromFramework;

@end
