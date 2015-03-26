//
//  MBProgressHUD+MJ.h
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MJ)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;


//add by CX

+ (void)showSuccessWithText:(NSString *)text dimBackground:(BOOL)dim hideAfterDelay:(NSTimeInterval)time;
+ (void)showErrorWithText:(NSString *)text dimBackground:(BOOL)dim hideAfterDelay:(NSTimeInterval)time;

+(MBProgressHUD *)showMessageInView:(UIView *)view text:(NSString *)text;
@end
