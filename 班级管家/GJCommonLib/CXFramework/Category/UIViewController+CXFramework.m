//
//  UIViewController+CXFramework.m
//  iWUT
//
//  Created by apple on 14/11/10.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import "UIViewController+CXFramework.h"
#import "CXContainerViewController.h"
#import "CXNavigationController.h"
#import <objc/runtime.h>

@implementation UIViewController(CXFramework)
static char CXFrameworkDrawOpenModeKey;
//static char shouldRefreshKey;

-(CXFrameworkDrawOpenMode)openMode
{
    return [objc_getAssociatedObject(self, &CXFrameworkDrawOpenModeKey) intValue];
}

- (void)setOpenMode:(CXFrameworkDrawOpenMode )openMode
{
    objc_setAssociatedObject(self, &CXFrameworkDrawOpenModeKey,@(openMode), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


//#pragma mark 增加一个BOOL类型的成员变量
//-(BOOL)shouldRefresh
//{
//    return [objc_getAssociatedObject(self, &shouldRefreshKey) boolValue];
//}
//
//-(void)setShouldRefresh:(BOOL)shouldRefresh
//{
//    objc_setAssociatedObject(self, &shouldRefreshKey,@(shouldRefresh), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}


-(void)navPushToViewController:(UIViewController *)viewController
{
    CXContainerViewController *rootViewController=(CXContainerViewController *)self.view.window.rootViewController;
    [rootViewController.navigationController pushViewController:viewController animated:YES];
}


-(UIViewController *)getCurrentViewControllerFromFramework
{
    CXContainerViewController *rootViewController=(CXContainerViewController *)self.view.window.rootViewController;
    return rootViewController.selectedViewController;
}


-(CXContainerViewController *)getMainViewControllerFromFramework;
{
    return (CXContainerViewController *)self.view.window.rootViewController;
}

@end
