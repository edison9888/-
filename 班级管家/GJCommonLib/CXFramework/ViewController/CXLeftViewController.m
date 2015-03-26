//
//  DockViewController.m
//  掌上理工大
//
//  Created by apple on 14/7/10.
//  Copyright (c) 2014年 cx. All rights reserved.


#import "CXLeftViewController.h"
#import "MenuTableViewCell.h"
#import "MenuHeaderView.h"

static NSString *cellIdentifier = @"DrawerLeftViewCell";
@interface CXLeftViewController()
{
    BOOL _isAnimating;
    NSInteger _oldIndex;
}
@property (nonatomic ,strong) NSArray *cellModels;
@end

@implementation CXLeftViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepares];
}

#pragma mark 设置自身参数
-(void)prepares
{
    self.view.backgroundColor=kColor(37, 46, 141);
    [self.tableView registerNib:[UINib nibWithNibName:@"MenuTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    self.headerView=[MenuHeaderView headerView];
    self.tableView.tableHeaderView=self.headerView;
    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight      = kMenuCellBaseHeight;
    if (IPHONE4S || IPHONE5) {
        self.tableView.rowHeight=38.0f;
    }
    [self.tableView setScrollEnabled:NO];
    _isAnimating                  = NO;
    self.cellModels=[DrawerLeftCellModel modelObjects];
}

#pragma mark TableView的数据源和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellModels.count;
}

#pragma mark TableView每一行的cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell         = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    DrawerLeftCellModel *model        = self.cellModels[indexPath.row];
    cell.model                      = model;
    cell.tag                        = indexPath.row;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(cxLeftViewController:fromIndex:toIndex:)]) {
        [self.delegate cxLeftViewController:self fromIndex:_oldIndex toIndex:indexPath.row];
    }
    _oldIndex=indexPath.row;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    static CGFloat stutter  = 0.01f;
    if (_isAnimating) {
        MenuTableViewCell *dealyCell =(MenuTableViewCell *)cell;
        [dealyCell startAnimationWithDelay:((indexPath.row)*stutter)];
        if (indexPath.row==self.cellModels.count) {
            _isAnimating=NO;
        }
    }
}

@end
