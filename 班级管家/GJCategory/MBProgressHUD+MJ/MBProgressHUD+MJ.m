//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+MJ.h"

@implementation MBProgressHUD (MJ)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view dimBackground:(BOOL)dim hideAfterDelay:(NSTimeInterval)time
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    hud.dimBackground=dim;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:time];
}


// add by cx
+ (void)showSuccessWithText:(NSString *)text dimBackground:(BOOL)dim hideAfterDelay:(NSTimeInterval)time
{
    [self show:text icon:@"success.png" view:nil dimBackground:dim hideAfterDelay:time];
}

+ (void)showErrorWithText:(NSString *)text dimBackground:(BOOL)dim hideAfterDelay:(NSTimeInterval)time
{
    [self show:text icon:@"error.png" view:nil dimBackground:dim hideAfterDelay:time];
}


+(MBProgressHUD *)showMessageInView:(UIView *)view text:(NSString *)text
{
    MBProgressHUD *hudObj=[[MBProgressHUD alloc] initWithFrame:view.bounds];
    [view addSubview:hudObj];
    hudObj.labelText = text;
    hudObj.dimBackground=NO;
    [view bringSubviewToFront:hudObj];
    // 隐藏时候从父控件中移除
    hudObj.removeFromSuperViewOnHide = YES;
    [hudObj show:YES];
    return hudObj;
}



#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view dimBackground:YES hideAfterDelay:0];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view dimBackground:YES hideAfterDelay:0];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

@end
