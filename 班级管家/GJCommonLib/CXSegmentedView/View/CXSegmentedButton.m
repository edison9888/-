//
//  CXSegmentedButton.m
//
//  Created by apple on 14/10/31.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import "CXSegmentedButton.h"
#import "CXSegmentedModel.h"

@interface CXSegmentedButton()
@end

@implementation CXSegmentedButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self                                      = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment             = NSTextAlignmentCenter;
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}

-(void)setModel:(CXSegmentedModel *)model
{
    _model=model;
    _model.item=self;
    [self setTitle:_model.text forState:UIControlStateNormal];
    if (_model.selectedText) {
        [self setTitle:_model.selectedText forState:UIControlStateSelected];
    }
    else if (_model.textColor) {
        [self setTitleColor:_model.textColor forState:UIControlStateNormal];
    }
    else if(_model.selectedTextColor)
    {
        [self setTitleColor:_model.selectedTextColor forState:UIControlStateSelected];
    }
    else if (_model.image) {
        [self setImage:_model.image forState:UIControlStateNormal];
    }
    else if (_model.selectedImage) {
        [self setImage:_model.selectedImage forState:UIControlStateSelected];
    }
    else if (_model.backgroundColor)
    {
        [self setBackgroundColor:_model.backgroundColor];
    }
    else if (_model.selectedBackgroundColor)
    {
        self.selectedBackgroundColor=_model.selectedBackgroundColor;
    }
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        if (_model.selectedBackgroundColor) {
            [self setBackgroundColor:_model.selectedBackgroundColor];
        }
    }
    else
    {
        if (_model.backgroundColor) {
            [self setBackgroundColor:_model.backgroundColor];
        }
    }
}

-(void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor
{
    _selectedBackgroundColor=selectedBackgroundColor;
    if (self.selected) {
        [self setBackgroundColor:_selectedBackgroundColor];
    }
}

@end
