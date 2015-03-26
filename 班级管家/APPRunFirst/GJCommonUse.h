//
//  GJCommonUse.h
//  班级管家
//
//  Created by 陈雄 on 15/3/26.
//  Copyright (c) 2015年 陈雄. All rights reserved.
//

#ifndef _____GJCommonUse_h
#define _____GJCommonUse_h

#define IPHONE4S    (([UIScreen mainScreen].bounds.size.height==480)?TRUE:FALSE)
#define IPHONE5     (([UIScreen mainScreen].bounds.size.height==568)?TRUE:FALSE)
#define IPHONE6     (([UIScreen mainScreen].bounds.size.height==667)?TRUE:FALSE)
#define IPHONE6Plus (([UIScreen mainScreen].bounds.size.height==736)?TRUE:FALSE)


#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define kScreenWidth    ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight   ([UIScreen mainScreen].bounds.size.height)
#define kNavgationBarHeight 64.0f


/**
 *  单例设计模式宏定义
 */
#define singletonInterface(className)   +(instancetype)shared##className;

//实现方法
#define singletonImplementation(className)   static className *_instance;\
+(instancetype)shared##className\
{    static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[self alloc]init];\
});return _instance;}\
+(id)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];});\
return _instance;}\
-(id)copyWithZone:(NSZone *)zone{\
return _instance;}

#endif
