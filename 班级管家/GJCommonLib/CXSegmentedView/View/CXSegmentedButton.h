//
//  CXSegmentedButton.h
//
//  Created by apple on 14/10/31.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CXSegmentedModel;
@interface CXSegmentedButton : UIButton
@property(nonatomic ,strong) CXSegmentedModel *model;
@property(nonatomic ,strong) UIColor *selectedBackgroundColor;
@end
