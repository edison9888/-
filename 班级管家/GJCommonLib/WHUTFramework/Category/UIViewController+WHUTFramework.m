//
//  UIViewController+WHUTFramework.m
//  iWUT
//
//  Created by apple on 14/11/10.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import "UIViewController+WHUTFramework.h"
#import "WHUTContainerViewController.h"
#import "WHUTNavigationController.h"
#import <objc/runtime.h>

@implementation UIViewController(WHUTFramework)
static char WHUTFrameworkDrawOpenModeKey;
//static char shouldRefreshKey;

-(WHUTFrameworkDrawOpenMode)openMode
{
    return [objc_getAssociatedObject(self, &WHUTFrameworkDrawOpenModeKey) intValue];
}

- (void)setOpenMode:(WHUTFrameworkDrawOpenMode )openMode
{
    objc_setAssociatedObject(self, &WHUTFrameworkDrawOpenModeKey,@(openMode), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
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
    WHUTContainerViewController *rootViewController=(WHUTContainerViewController *)self.view.window.rootViewController;
    [rootViewController.navigationController pushViewController:viewController animated:YES];
}


-(UIViewController *)getCurrentViewControllerFromFramework
{
    WHUTContainerViewController *rootViewController=(WHUTContainerViewController *)self.view.window.rootViewController;
    return rootViewController.selectedViewController;
}


-(WHUTContainerViewController *)getMainViewControllerFromFramework;
{
    return (WHUTContainerViewController *)self.view.window.rootViewController;
}

@end
