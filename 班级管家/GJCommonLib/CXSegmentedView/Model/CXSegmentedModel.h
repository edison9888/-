//
//  CXSegmentedModel.h
//
//  Created by apple on 14/10/29.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CXSegmentedButton;
@interface CXSegmentedModel : NSObject
@property (nonatomic ,weak   ) CXSegmentedButton *item;

@property (nonatomic ,strong ) NSString          *text;
@property (nonatomic ,strong ) NSString          *selectedText;

@property (nonatomic ,strong ) UIImage           *image;
@property (nonatomic ,strong ) UIImage           *selectedImage;


@property (nonatomic ,strong) UIColor            *backgroundColor;
@property (nonatomic ,strong) UIColor            *selectedBackgroundColor;


@property (nonatomic ,strong) UIColor            *textColor;
@property (nonatomic ,strong) UIColor            *selectedTextColor;

+(instancetype)modelWithText:(NSString *)text;

@end
