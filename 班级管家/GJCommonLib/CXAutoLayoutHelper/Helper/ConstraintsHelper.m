//
//  ConstraintsHelper.m
//  控件开发项目专用
//
//  Created by apple on 15/2/14.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "ConstraintsHelper.h"
#import <UIKit/UIKit.h>
#import "CXConstraintAttribute.h"
#import "CXConstraintSize.h"
#import "CXConstraintEdges.h"

@interface ConstraintsHelper()
@property (nonatomic ,weak) NSCache  *cache;
@property (nonatomic ,copy) NSString *viewID;
@end

@implementation ConstraintsHelper

-(instancetype)init
{
    if (self=[super init]) {
    }
    return self;
}


+(instancetype)helper
{
    return [[ConstraintsHelper alloc] init];
}

-(void)makeVisible
{
    self.firstItem.translatesAutoresizingMaskIntoConstraints=NO;
}

#pragma mark getter
-(CXConstraintAttribute *)left
{
    getterImplementionCode(left , Left )
}

-(CXConstraintAttribute *)right
{
    getterImplementionCode(right , Right )
}

-(CXConstraintAttribute *)top
{
    getterImplementionCode(top , Top );
}

-(CXConstraintAttribute *)bottom
{
    getterImplementionCode(bottom , Bottom )
}

-(CXConstraintAttribute *)height
{
    getterImplementionCode(height , Height )
}

-(CXConstraintAttribute *)width
{
    getterImplementionCode(width , Width );
}

-(CXConstraintAttribute *)centerX
{
    getterImplementionCode(centerX, CenterX )
}

-(CXConstraintAttribute *)centerY
{
    getterImplementionCode(centerY, CenterY )
}


-(CXConstraintSize *)size
{
    if (_size==nil) {
        _size=[CXConstraintSize sizeWithFirstItem:self.firstItem];
    }
    return _size;
}

-(CXConstraintEdges *)edgeInstes
{
    if (_edgeInstes==nil) {
        _edgeInstes=[CXConstraintEdges edgesWithFirstItem:self.firstItem];
    }
    return _edgeInstes;
}


-(void)setHelperCache:(NSCache *)cache viewID:(NSString *)viewID
{
    _cache=cache;
    _viewID=viewID;
}


-(void)dealloc
{
    [_cache removeObjectForKey:_viewID];
}

@end
