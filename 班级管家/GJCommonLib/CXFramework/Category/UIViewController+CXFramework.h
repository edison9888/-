//
//  UIViewController+CXFramework.h
//  iWUT
//
//  Created by apple on 14/11/10.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSInteger, CXFrameworkDrawOpenMode){
    CXFrameworkDrawOpenModeNone                   = 0,     //关闭
    CXFrameworkDrawOpenModePanningNavigationBar   = 1 << 1,//导航条触发开启手势
    CXFrameworkDrawOpenModePanningCenterView      = 1 << 2,//非边缘触发侧滑菜单开启手势
    CXFrameworkDrawOpenModeBezelPanningCenterView = 1 << 3,//边缘触发侧滑菜单开启手势
};

@class CXFrameworlControllerModel,CXContainerViewController;
@interface UIViewController(CXFramework)

@property(nonatomic ,assign) CXFrameworkDrawOpenMode openMode;
-(void)navPushToViewController:(UIViewController *)viewController;
-(UIViewController *)getCurrentViewControllerFromFramework;
-(CXContainerViewController *)getMainViewControllerFromFramework;

@end
