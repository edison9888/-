//
//  CXSegmentedModel.m
//
//  Created by apple on 14/10/29.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import "CXSegmentedModel.h"
#import "CXSegmentedButton.h"

@interface CXSegmentedModel()
@end

@implementation CXSegmentedModel

+(instancetype)modelWithText:(NSString *)text
{
    CXSegmentedModel *obj=[[CXSegmentedModel alloc] init];
    obj.text=text;
    return obj;
}

-(void)setText:(NSString *)text
{
    _text=text;
    [self.item setTitle:text forState:UIControlStateNormal];
}

-(void)setSelectedText:(NSString *)selectedText
{
    _selectedText=selectedText;
    [self.item setTitle:selectedText forState:UIControlStateSelected];
}


-(void)setImage:(UIImage *)image
{
    _image=image;
    [self.item setImage:image forState:UIControlStateNormal];
}


-(void)setSelectedImage:(UIImage *)selectedImage
{
    _selectedImage=selectedImage;
    [self.item setImage:selectedImage forState:UIControlStateSelected];
}


-(void)setTextColor:(UIColor *)textColor
{
    _textColor=textColor;
    [self.item setTitleColor:_textColor forState:UIControlStateNormal];
}

-(void)setSelectedTextColor:(UIColor *)selectedTextColor
{
    _selectedTextColor=selectedTextColor;
    [self.item setTitleColor:_selectedTextColor forState:UIControlStateSelected];
}

-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor=backgroundColor;
    if (!self.item.selected) {
        self.item.backgroundColor=_backgroundColor;
    }
}

-(void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor
{
    _selectedBackgroundColor=selectedBackgroundColor;
    self.item.selectedBackgroundColor=_selectedBackgroundColor;
}


@end
