

#import "UIView+FrameworkExtension.h"

@implementation UIView (FrameworkExtension)

- (void)setOrignX:(CGFloat)orignX
{
    CGRect frame = self.frame;
    frame.origin.x = orignX;
    self.frame = frame;
}

- (CGFloat)orignX
{
    return self.frame.origin.x;
}

- (void)setOrignY:(CGFloat)orignY
{
    CGRect frame = self.frame;
    frame.origin.y = orignY;
    self.frame = frame;
}

- (CGFloat)orignY
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}
@end
