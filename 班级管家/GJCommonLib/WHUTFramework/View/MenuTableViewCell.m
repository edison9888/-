//
//  MenuTableViewCell.m
//  iWUT
//
//  Created by apple on 14/12/14.
//  Copyright (c) 2014年 WUTNEWS. All rights reserved.
//

#import "MenuTableViewCell.h"

@interface MenuTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftImageViewLeftConstraint;

@end
@implementation MenuTableViewCell

- (void)awakeFromNib {
    self.contentView.height=self.height=kMenuCellBaseHeight;
    CGFloat leftMarign=10.0f;
    self.leftImageViewLeftConstraint.constant=leftMarign;
    self.name.font=[UIFont systemFontOfSize:IPHONE6Plus?18:14];
    
}


-(void)startAnimationWithDelay:(CGFloat)delay
{
    self.contentView.transform=CGAffineTransformMakeTranslation(-self.frame.size.width, 0);
    [UIView animateWithDuration:0.5 delay:delay usingSpringWithDamping:2 initialSpringVelocity:0.1 options:0 animations:^{
        self.contentView.transform=CGAffineTransformIdentity;
    } completion:nil];
}

-(void)setModel:(WHUTLeftCellModel *)model
{
    _model=model;
    self.name.text=_model.text;
    self.leftImage.image=[UIImage imageNamed:_model.image];
}


-(void)drawRect:(CGRect)rect
{
    [kColor(209, 209, 209) setStroke];
    UIBezierPath *linePath=[[UIBezierPath alloc] init];
    if (self.tag==0) {
        [linePath moveToPoint:CGPointMake(0, 0)];
        [linePath addLineToPoint:CGPointMake(self.width, 0)];
    }
    [linePath moveToPoint:CGPointMake(0, self.height)];
    [linePath addLineToPoint:CGPointMake(self.width, self.height)];
    [linePath stroke];
}


-(void)setTag:(NSInteger)tag
{
    [super setTag:tag];
    [self setNeedsDisplay];
}

@end
