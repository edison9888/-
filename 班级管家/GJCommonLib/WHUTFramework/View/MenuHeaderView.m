//
//  MenuHeaderView.m
//  iWUT
//
//  Created by apple on 14/12/13.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import "MenuHeaderView.h"
#define kDockTableHeaderViewHeight (IPHONE4S?150.0f:177.5f)
#define KDockWidth kScreenWidth*0.7

@implementation MenuHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self setHeaderViewUI];
        
    }
    return self;
}

+(instancetype)headerView
{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, KDockWidth, kDockTableHeaderViewHeight)];
}


-(void)setHeaderViewUI
{
    CGFloat userButtonHeight=IPHONE6Plus?(80.0f*1.2):(80.0f);
    CGFloat userButtonWidth=userButtonHeight;
    self.userButton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.userButton.frame=CGRectMake(0, 20, userButtonWidth, userButtonHeight);
    [self addSubview:self.userButton];
    [self.userButton setImage:[UIImage imageNamed:@"bangbangtang"] forState:UIControlStateNormal];
    
    
    self.nameLable=[[UILabel alloc] init];
    self.nameLable.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.nameLable];
    
    self.majorLabel=[[UILabel alloc] init];
    self.majorLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:self.majorLabel];
    
    NSDictionary *views=@{@"userButton":self.userButton,@"nameLable":self.nameLable,@"majorLabel":self.majorLabel};
    NSDictionary *metrics=@{@"marign":@5.0f,@"verticalMarign":@7.0f,@"topMarign":@48.0f};
    self.nameLable.textColor=[UIColor darkGrayColor];
    self.majorLabel.textColor=[UIColor lightGrayColor];
    self.nameLable.font=[UIFont systemFontOfSize:IPHONE6Plus?20.0f:16.0f];
    self.majorLabel.font=[UIFont systemFontOfSize:IPHONE6Plus?16.0f:14.0f];
    
    NSArray *hArray=[NSLayoutConstraint constraintsWithVisualFormat:@"H:[userButton]-marign-[nameLable]" options:0 metrics:metrics views:views];
    NSArray *vArray=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMarign-[nameLable]-verticalMarign-[majorLabel]" options:NSLayoutFormatAlignAllLeft metrics:metrics views:views];
    [self addConstraints:hArray];
    [self addConstraints:vArray];
    
    [self upDateLabelTitles];
}

-(void)upDateLabelTitles
{
    self.nameLable.text=@"陈雄";
    self.majorLabel.text=@"物流工程";
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
