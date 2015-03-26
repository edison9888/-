//
//  DockViewController.h
//  掌上理工大
//
//  Created by apple on 14/7/10.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuHeaderView;
@protocol WHUTLeftViewControllerDelegate <NSObject>
@optional
-(void)whutLeftViewController:(UIViewController *)controller fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
@end

@interface WHUTLeftViewController : UITableViewController
@property (nonatomic ,weak  ) id <WHUTLeftViewControllerDelegate> delegate;
@property (nonatomic ,strong) MenuHeaderView                      *headerView;
@end
