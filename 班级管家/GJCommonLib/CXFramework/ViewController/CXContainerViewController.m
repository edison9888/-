//
//  MainViewController.m
//  掌上理工大
//
//  Created by apple on 14/7/11.
//  Copyright (c) 2014年 cx. All rights reserved.

#import "CXContainerViewController.h"
#import "CXCenterViewController.h"
#import "CXNavigationController.h"
#import "CXLeftViewController.h"
#import "DrawerLeftCellModel.h"
#import "NewMMDrawerController.h"
#import "CXFrameworkCommonUse.h"
#import "MyObjectObserver.h"

static NSString *openModeStringKey=@"openMode";

@interface CXContainerViewController ()<CXLeftViewControllerDelegate,UINavigationControllerDelegate>
{
    MyObjectObserver *_observerKeeper;
    MyObjectObserver *_accountObserver;
}
@property (nonatomic ,strong ) NewMMDrawerController   *drawerController;
@property (nonatomic ,strong ) CXCenterViewController *center;
@property (nonatomic ,strong ) CXNavigationController *centerNav;
@property (nonatomic ,strong ) CXLeftViewController   *dock;
@property (nonatomic ,strong ) UIView                   *titleViewCopy;
@end

@implementation CXContainerViewController
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.center=[[CXCenterViewController alloc]init];
    self.centerNav                      =[[CXNavigationController alloc] initWithRootViewController:self.center];
    self.centerNav.delegate                          = self;
    _navigationController                            = self.centerNav;
    
    self.dock                           =[[CXLeftViewController alloc] initWithStyle:UITableViewStylePlain];
    self.dock.delegate                               = self;
    
    self.drawerController=[[NewMMDrawerController alloc] initWithCenterViewController:self.centerNav leftDrawerViewController:self.dock];
    [self.drawerController setMaximumLeftDrawerWidth:kMenuCellWidth];
    //定义默认关闭手势
    self.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeTapCenterView| MMCloseDrawerGestureModePanningCenterView | MMCloseDrawerGestureModePanningNavigationBar;
    [self.view addSubview:self.drawerController.view];
    self.drawerController.view.backgroundColor=[UIColor whiteColor];
    self.drawerController.shouldStretchDrawer        = NO;
}

#pragma mark CXLeftViewController代理
-(void)cxLeftViewController:(UIViewController *)controller fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    if (fromIndex==toIndex) return [self.drawerController closeDrawerAnimated:YES completion:nil];
    
    UIViewController *fromController=self.center.childViewControllers[fromIndex];
    UIViewController *toController=self.center.childViewControllers[toIndex];
    [fromController.view removeFromSuperview];
    [self.center.view addSubview:toController.view];
    [self.drawerController closeDrawerAnimated:YES completion:nil];
    
    _observerKeeper=[self getChildViewControllerObserver:toController];
    _selectedViewController                         = toController;
    
    [self navigationItemHandleWithController:toController];
    
    self.drawerController.openDrawerGestureModeMask=(MMOpenDrawerGestureMode)toController.openMode;

}


-(void)navigationItemHandleWithController:(UIViewController *)controller
{
    self.center.navigationItem.rightBarButtonItems = controller.navigationItem.rightBarButtonItems;
    if (controller.navigationItem.titleView==nil) {
        self.center.navigationItem.titleView       = self.titleViewCopy;
    }
    else self.center.navigationItem.titleView      = controller.navigationItem.titleView;
    self.title                                     = controller.title;
}

-(void)pushToControllerType:(CXViewControllerType)type;
{
    NSInteger fromIndex=[self.center.childViewControllers indexOfObject:self.selectedViewController];
    [self cxLeftViewController:self.dock fromIndex:fromIndex toIndex:type];
}


#pragma arguments 添加控制器
-(void)addChildViewController:(UIViewController *)childController
{
    [self.center addChildViewController:childController];
    //设置默认开启手势
    childController.openMode          = CXFrameworkDrawOpenModePanningCenterView;
    
    
    if (self.center.childViewControllers.count==1) {
        GJLog(@"设置第一个视图");
        UIViewController *firstController=self.center.childViewControllers[0];
        _observerKeeper=[self getChildViewControllerObserver:firstController];
        [self.center.view addSubview:firstController.view];
        [self navigationItemHandleWithController:firstController];
        _selectedViewController=firstController;
    }
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        self.drawerController.openDrawerGestureModeMask=(MMOpenDrawerGestureMode)childController.openMode;
//        _observerKeeper=[self getChildViewControllerObserver:childController];
//        [self.center.view addSubview:childController.view];
//        [self navigationItemHandleWithController:childController];
//        _selectedViewController=childController;
//    });
}

-(MyObjectObserver *)getChildViewControllerObserver:(UIViewController *)childViewController
{
    MyObjectObserver *observerWithOpenMode=[MyObjectObserver observeObject:childViewController keyPath:openModeStringKey target:self selector:@selector(openModeDidChange:ofObject:) options:NSKeyValueObservingOptionNew];
    return observerWithOpenMode;
}

-(void)openModeDidChange:(NSDictionary *)dictionary ofObject:(id)object
{
    NSNumber *value                   = dictionary[@"new"];
    self.drawerController.openDrawerGestureModeMask=[value integerValue];
}

//处理手势在二级控制器下得干涉问题
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isEqual:self.center]) {
        self.drawerController.openDrawerGestureModeMask=(MMOpenDrawerGestureMode)self.selectedViewController.openMode;
    }
    else {self.drawerController.openDrawerGestureModeMask=MMOpenDrawerGestureModeNone;}
}

#pragma mark setter and getter  ------------------------
#pragma arguments  重写title的set方法
-(void)setTitle:(NSString *)title
{
    self.center.titleLabel.text = title;
}

-(UIView *)titleViewCopy
{
    if (_titleViewCopy==nil) {
        _titleViewCopy=self.center.titleLabel;
    }
    return _titleViewCopy;
}

-(NSArray *)childViewControllers
{
    return self.center.childViewControllers;
}



-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
