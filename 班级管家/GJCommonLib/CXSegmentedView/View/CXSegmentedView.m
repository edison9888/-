//
//  CXSegmentedView.m
//
//  Created by apple on 14/10/29.
//  Copyright (c) 2014年 cx. All rights reserved.
//

#import "CXSegmentedView.h"
#import "CXContentView.h"
#import "CXSegmentedButton.h"
#import "CXSegmentedView+Item.h"
#import "CXSegmentedView+decorateView.h"
#import <objc/message.h>

#define kAnimationDuration 0.18f

#define msgSend(...) ((void (*)(void *, SEL, NSInteger ))objc_msgSend)(__VA_ARGS__)

@interface CXSegmentedView()<UIScrollViewDelegate>
@property (nonatomic ,weak  ) id             tagetAfterItemPressed;
@property (nonatomic ,assign) SEL            actionAfterItemPressed;
@property (nonatomic ,strong) NSMutableArray *items;
@property (nonatomic ,assign) BOOL           useAnimation;
@end

@implementation CXSegmentedView
#pragma mark 三种初始化方法  每种执行不同的初始化
-(instancetype)init
{
    if (self=[super init]) {
        [self prepareForInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self prepareForInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame modelArray:(NSArray *)models
{
    if (self=[super initWithFrame:frame]) {
        [self prepareForInit];
        [self setModels:models];
    }
    return self;
}

-(instancetype)initWithTitles:(NSArray *)titles
{
    if (self=[super init]) {
        [self prepareForInit];
        NSMutableArray *models=[NSMutableArray array];
        for (NSString *title in titles) {
            CXSegmentedModel *model=[CXSegmentedModel modelWithText:title];
            [models addObject:model];
        }
        self.models=models;
    }
    return self;
}

#pragma 自身所需数据初始化操作
-(void)prepareForInit
{
    _contentView=[[CXContentView alloc] init];
    [self addSubview:self.contentView];
    self.pagingEnable                               = YES;
    self.contentView.pagingEnabled                  = NO;
    self.contentView.showsHorizontalScrollIndicator = NO;
    self.contentView.delegate                       = self;
    self.contentView.backgroundColor=[UIColor clearColor];
    _minimumItemNumberForLine                       = 4;
}

#pragma 添加Items
-(void)addItemsToContentView
{
    self.items=[NSMutableArray arrayWithArray:[self getItems]];
    NSInteger i=0;
    for (CXSegmentedButton  *item in self.items) {
        [item addTarget:self action:@selector(itemDidPressed:) forControlEvents:UIControlEventTouchUpInside];
        item.model=self.models[i];
        if (self.textColor) {
            if (!item.model.textColor) {
                item.model.textColor=self.textColor;
            }
        }
        if (self.selectedTextColor) {
            if (!item.model.selectedTextColor) {
                item.model.selectedTextColor=self.selectedTextColor;
            }
        }
        if (self.itemBackgroundColor) {
            if (!item.model.backgroundColor) {
                item.model.backgroundColor=self.itemBackgroundColor;
            }
        }
        if (self.itemSelectedBackgroundColor) {
            if (!item.model.selectedBackgroundColor) {
                item.model.selectedBackgroundColor=self.itemSelectedBackgroundColor;
            }
        }
        item.tag=i;
        [self.contentView addSubview:item];
        i+=1;
    }
}

#pragma mark 视图布局操作
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat contentViewWidth=self.frame.size.width-(self.contentEdgeInsets.left+self.contentEdgeInsets.right);
    CGFloat contentViewHeight=self.frame.size.height-(self.contentEdgeInsets.top+self.contentEdgeInsets.bottom);
    self.contentView.frame=CGRectMake(self.contentEdgeInsets.left, self.contentEdgeInsets.top, contentViewWidth, contentViewHeight);
    CGFloat itemWidth=[self getItemWidth];
    [UIView animateWithDuration:self.useAnimation?kAnimationDuration:0 animations:^{
        NSInteger i = 0 ;
        for (CXSegmentedButton *item in self.items) {
            item.frame=CGRectMake(i*(itemWidth+self.itemSpacing), 0, itemWidth, contentViewHeight);
            i ++;
        }
    }];
}

-(void)setNeedsLayoutWithAnimation:(BOOL)animation
{
    if (animation) {
        self.useAnimation=YES;
    }
    else self.useAnimation=NO;
    [self setNeedsLayout];
}

#pragma mark set方法集合
-(void)setModels:(NSArray *)models
{
    if (_models==models) return;
    _models=models;
    [self removeAllButtons];
    [self addItemsToContentView];
    self.selectedIndex=0;
    [self setNeedsLayout];
    self.contentView.contentSize = CGSizeMake([self getItemWidth]*self.models.count+self.itemSpacing*(self.models.count-1), 0);
}


#pragma mark 删除Items
-(void)removeAllButtons
{
    if (self.items.count) {
        [self.items makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.items removeAllObjects];
    }
}

-(void)itemDidPressed:(CXSegmentedButton *)item
{
    if ([self.tagetAfterItemPressed respondsToSelector:self.actionAfterItemPressed]) {
        msgSend((__bridge void *)self.tagetAfterItemPressed,self.actionAfterItemPressed,item.tag);
    }
    
    if ([self.delegate respondsToSelector:@selector(cxSegmentedView:itemPressAtIndex:)]) {
        [self.delegate cxSegmentedView:self itemPressAtIndex:item.tag];
    }
    
    //还原  原先选中的item
    _selectedItem.selected = NO;

    //变为新的选中的item
    item.selected = YES;
    _selectedItem = item;
    _selectedIndex = item.tag;
    

    //移动装饰View
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [self upDateDecorateViewFrame];
    }];
}

#pragma mark 回调函数处理
-(void)addTarget:(id)target itemPressAtIndex:(SEL)action
{
    self.tagetAfterItemPressed=target;
    self.actionAfterItemPressed=action;
}


#pragma mark item操作 
-(void)deleteItemAtIndex:(NSUInteger)index animate:(BOOL)animate
{
    if (!self.models.count) return;
    CXSegmentedButton *buttonToDie                              = self.items[index];
    [buttonToDie removeFromSuperview];
    [self.items removeObjectAtIndex:index];
    NSMutableArray *orignModels=[NSMutableArray arrayWithArray:self.models];
    [orignModels removeObjectAtIndex:index];
    self.models=[NSArray arrayWithArray:orignModels];
    [self setNeedsLayoutWithAnimation:YES];
}

-(void)insertItemAtIndex:(NSUInteger)index withModel:(CXSegmentedModel *)model animate:(BOOL)animate
{
    CXSegmentedButton *newButton=[CXSegmentedButton buttonWithType:UIButtonTypeCustom];
    newButton.model                                             = model;
    [self.contentView addSubview:newButton];
    [newButton addTarget:self action:@selector(itemDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.items insertObject:newButton atIndex:index];
    NSMutableArray *orignModels=[NSMutableArray arrayWithArray:self.models];
    [orignModels insertObject:model atIndex:index];
    self.models=[NSArray arrayWithArray:orignModels];
    [self setNeedsLayoutWithAnimation:YES];
}

#pragma mark 装饰View的设定
-(void)setDecorateViewForSelectedItem:(UIView *)decorateViewForSelectedItem
{
    if (_decorateViewForSelectedItem==decorateViewForSelectedItem) return;
    _decorateViewForSelectedItem=decorateViewForSelectedItem;
    if (_decorateViewForSelectedItem) {
        [self.contentView addSubview:_decorateViewForSelectedItem];
        //内部限定装饰View的宽度
        if (CGRectGetWidth(_decorateViewForSelectedItem.frame)>[self getItemWidth]) {
            _decorateViewForSelectedItem.bounds=CGRectMake(0, 0, [self getItemWidth], CGRectGetHeight(_decorateViewForSelectedItem.frame));
        }
        _decorateViewForSelectedItem.frame=[self getDecorateViewFrame];
        if (_items.count==0) {
            self.decorateViewForSelectedItem.frame=CGRectZero;
        }
    }
}

-(void)setDecorateViewEdgeInsets:(UIEdgeInsets)decorateViewEdgeInsets
{
    _decorateViewEdgeInsets=decorateViewEdgeInsets;
    [self upDateDecorateViewFrame];
}

-(void)setMinimumItemNumberForLine:(NSInteger)minimumItemNumberForLine
{
    if (_minimumItemNumberForLine==minimumItemNumberForLine) return;
    if(minimumItemNumberForLine<1) minimumItemNumberForLine = 1;
    _minimumItemNumberForLine                               = minimumItemNumberForLine;
    if (self.items.count) {
        [self setNeedsLayoutWithAnimation:YES];
        [self upDateDecorateViewFrame];
        self.contentView.contentSize = CGSizeMake([self getItemWidth]*self.models.count+self.itemSpacing*(self.models.count-1), 0);
    }
}

-(void)setBounces:(BOOL)bounces
{
    self.contentView.bounces                        = bounces;
}

-(void)setShowsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator
{
    self.contentView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
}

-(void)setItemSpacing:(CGFloat)itemSpacing
{
    if (_itemSpacing==itemSpacing) return;
    _itemSpacing                                    = itemSpacing;
    _pageWidth=_itemSpacing+[self getItemWidth];
    [self setNeedsLayoutWithAnimation:NO];
    [self upDateDecorateViewFrame];
}

-(void)setItemSpacing:(CGFloat)itemSpacing animate:(BOOL)animate
{
    [self setItemSpacing:itemSpacing];
    [self setNeedsLayoutWithAnimation:animate];
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    _selectedIndex=selectedIndex;
    [self setSelectedIndex:selectedIndex animate:NO];
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex animate:(BOOL)animate
{
    [self itemDidPressed:self.items[selectedIndex]];
    if (selectedIndex<=self.minimumItemNumberForLine-1) {
        [self.contentView setContentOffset:CGPointMake(0, 0) animated:animate];
    }
    else{
        [self.contentView setContentOffset:CGPointMake([self getItemWidth]*(selectedIndex-(self.minimumItemNumberForLine-1)), 0) animated:animate];}
}

-(void)setContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
{
    if (UIEdgeInsetsEqualToEdgeInsets(_contentEdgeInsets, _contentEdgeInsets)) return;
    _contentEdgeInsets     = contentEdgeInsets;
    [self setNeedsLayoutWithAnimation:NO];
}

-(void)setModel:(CXSegmentedModel *)model forItemAtIndex:(NSUInteger)index
{
    CXSegmentedButton *button                                   = self.items[index];
    button.model                                                = model;
}


-(void)setTextFont:(UIFont *)textFont
{
    _textFont=textFont;
    for (CXSegmentedButton *item in self.items) {
        item.titleLabel.font=_textFont;
    }
}

#pragma 颜色设置

-(void)setTextColor:(UIColor *)textColor
{
    _textColor=textColor;
    for (CXSegmentedModel *model in self.models) {
        if (!model.textColor) {
            model.textColor=_textColor;
        }
    }
}

-(void)setSelectedTextColor:(UIColor *)selectedTextColor
{
    _selectedTextColor=selectedTextColor;
    for (CXSegmentedModel *model in self.models) {
        if (!model.selectedTextColor) {
            model.selectedTextColor=_selectedTextColor;
        }
    }
}

-(void)setItemBackgroundColor:(UIColor *)itemBackgroundColor
{
    _itemBackgroundColor=itemBackgroundColor;
    for (CXSegmentedModel *model in self.models) {
        if (!model.backgroundColor) {
            model.backgroundColor=_itemBackgroundColor;
        }
    }
}

-(void)setItemSelectedBackgroundColor:(UIColor *)itemSelectedBackgroundColor
{
    _itemSelectedBackgroundColor=itemSelectedBackgroundColor;
    for (CXSegmentedModel *model in self.models) {
        if (!model.selectedBackgroundColor) {
            model.selectedBackgroundColor=_itemSelectedBackgroundColor;
        }
    }
}

#pragma mark 处理分页宽度 UIScrollView代理
- (CGPoint)nearestTargetOffsetForOffset:(CGPoint)offset
{
    CGFloat pageSize = _pageWidth;
    NSInteger page = roundf(offset.x / pageSize);
    CGFloat targetX = pageSize * page;
    return CGPointMake(targetX, offset.y);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (!self.pagingEnable) return ;
    CGPoint targetOffset = [self nearestTargetOffsetForOffset:*targetContentOffset];
    targetContentOffset->x = targetOffset.x;
    targetContentOffset->y = targetOffset.y;
}

@end
