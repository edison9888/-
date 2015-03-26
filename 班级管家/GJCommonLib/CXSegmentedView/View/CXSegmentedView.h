//
//  CXSegmentedView.h
//
//  Created by apple on 14/10/29.
//  Copyright (c) 2014年 cx. All rights reserved.
//

/**
 *    用法描述
 *    用模型数组来初始化一个实例
 *    model1.normalText=@"按钮1普通文字";
 *    model1.selectedText=@"按钮1选中文字";
 *    //详细设置请看 CXSegmentedModel.h头文件
 *
 *    CXSegmentedModel *model1=[[CXSegmentedModel alloc] init];
 *    CXSegmentedView  *segmentedView=[[CXSegmentedView alloc] initWithFrame:CGRectMake(0, 40, 320, 60) modelArray:@[model1,model2]];
 *    [self.view addSubview:segmentedView];
 *     想要更改item显示效果 可以直接修改item对应的模型  模型可以从modelArray中获取
 *
 *    //提供两种方式来处理回调
 *   1.>代理
 *   2.>添加 (SEL)action
 */

#import <UIKit/UIKit.h>
#import "CXSegmentedModel.h"
#import "CXContentView.h"

/**
 *  用于一些代码选中后的回调
 */
@class CXSegmentedView;
@protocol CXSegmentedViewDelegate <NSObject>
@optional
/**
 *  用于用户交互点击后的回调
 *
 *  @param view  当前调用回调函数的CXSegmentedView
 *  @param index 当前选中的指示器
 */
-(void)cxSegmentedView:(CXSegmentedView *)view itemPressAtIndex:(NSInteger)index;
@end

@interface CXSegmentedView : UIView
{
    UIView *_decorateViewForSelectedItem;
    @private
    CGFloat         _pageWidth;
    NSMutableArray *_items;
}

/**
 *  代理  选中后可以执行相应函数
 */
@property (nonatomic ,assign) id <CXSegmentedViewDelegate> delegate;
/**
 *  内部滚动视图
 */
@property (nonatomic ,readonly) CXContentView           *contentView;
/**
 *  当前选中项
 */
@property (nonatomic ,readonly) CXSegmentedButton       *selectedItem;
/**
 *  装饰View 即显示在selectedIndex的Item下方的指示视图
 */
@property (nonatomic ,strong  ) UIView                  *decorateViewForSelectedItem;
/**
 *  当前选中索引
 */
@property (nonatomic ,assign ) NSUInteger     selectedIndex;
/**
 *  模型数组  改变该属性生成新的效果
 */
@property (nonatomic ,strong  ) NSArray                 *models;
/**
 *  内容视图的缩进
 */
@property (nonatomic ,assign) UIEdgeInsets            contentEdgeInsets;
/**
 *  装饰View的偏移量
 */
@property (nonatomic ,assign) UIEdgeInsets            decorateViewEdgeInsets;
/**
 *  一排最少的Item个数  默认是4
 */
@property (nonatomic ,assign) NSInteger               minimumItemNumberForLine;
/**
 *  每个item之间的间距默认是0  默认改变不带动画
 */
@property (nonatomic ,assign) CGFloat                 itemSpacing;
/**
 *  所有item显示的字体
 */
@property (nonatomic ,strong) UIFont                  *textFont;
/**
 *  所有item的默认字体颜色  避免所有model单独设置 不与单独设置冲突
 */
@property (nonatomic ,strong) UIColor                 *textColor;
/**
 *  选中item字体颜色  避免所有model单独设置 不与单独设置冲突
 */
@property (nonatomic ,strong) UIColor                 *selectedTextColor;
/**
 *  所有item的默认背景  避免所有model单独设置 不与单独设置冲突
 */
@property (nonatomic ,strong) UIColor                 *itemBackgroundColor;
/**
 *  选中item字选中背景颜色  避免所有model单独设置 不与单独设置冲突
 */
@property (nonatomic ,strong) UIColor                 *itemSelectedBackgroundColor;
/**
 *  内部scrollView是否带有弹簧效果
 */
@property (nonatomic ,assign) BOOL                    bounces;
/**
 *  是否允许滚动
 */
@property (nonatomic ,assign) BOOL                    scrollEnable;
/**
 *  是否开启分页
 */
@property (nonatomic ,assign) BOOL                    pagingEnable;
/**
 *  是否显示水平滚动条
 */
@property (nonatomic ,assign) BOOL                    showsHorizontalScrollIndicator;

/**
 *  实例化方法
 *
 *  @param frame  frame
 *  @param models models
 *
 *  @return 实例对象
 */
-(instancetype)initWithFrame:(CGRect)frame modelArray:(NSArray *)models;

/**
 *  用titles初始化
 *
 *  @param titles titles
 *
 *  @return 不带Frame的对象
 */
-(instancetype)initWithTitles:(NSArray *)titles;

/**
 *  用于用户交互点击后的回调
 *
 *  @param target target
 *  @param action 回调函数
 */
-(void)addTarget:(id)target itemPressAtIndex:(SEL)action;

/**
 *  删除某个Item
 *
 *  @param index   item对应的index
 *  @param animate 是否动画
 */
-(void)deleteItemAtIndex:(NSUInteger)index animate:(BOOL)animate;

/**
 *  在index位置插入item
 *
 *  @param index   index
 *  @param model   model
 *  @param animate 动画
 */
-(void)insertItemAtIndex:(NSUInteger)index withModel:(CXSegmentedModel *)model animate:(BOOL)animate;

/**
 *  为第Index个Item重置模型
 *
 *  @param model model
 *  @param index index
 */
-(void)setModel:(CXSegmentedModel *)model forItemAtIndex:(NSUInteger)index;

/**
 *  选中对象
 *
 *  @param selectedIndex 选中指针
 *  @param animate       是否动画
 */
-(void)setSelectedIndex:(NSUInteger)selectedIndex animate:(BOOL)animate;

/**
 *  设置间距
 *
 *  @param itemSpacing 间距
 *  @param animate     是否动画
 */
-(void)setItemSpacing:(CGFloat)itemSpacing animate:(BOOL)animate;

@end
