//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftMenuViewController.h"
#import "GWStatusCell.h"
#import "GWHomeStatusesParam.h"
#import "GWHomeStatusesResult.h"
#import "GWStatusTool.h"
#import "GWStatus.h"
#import "GWArticleViewController.h"
#import "GWArticle.h"
#import "GWArticleParam.h"
#import "GWArticleResult.h"
#import "MJRefresh.h"
#import "MBProgressHUD+MJ.h"


@interface HomeViewController ()<MJRefreshBaseViewDelegate>

@property(nonatomic,strong) NSMutableArray *statuses;
@property(nonatomic,weak) MJRefreshFooterView *footer;
@property(nonatomic,weak) MJRefreshHeaderView *header;
@end

@implementation HomeViewController

#pragma mark
#pragma mark 懒加载status
-(NSMutableArray *)statuses
{
    if (_statuses == nil) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}

#pragma mark
#pragma mark 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTableView];
    
    //集成刷新控件
    [self setupRefreshView];
    
}

-(void)setupRefreshView
{
    //1.下拉刷新
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = self.tableView;
    header.delegate = self;
    [header beginRefreshing];
    self.header = header;
    
    //2.上拉刷新
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = self.tableView;
    footer.delegate = self;
    self.footer = footer;
}

/**
 *  代理方法：刷新控件进入开始刷新时候调用
 *
 *  @param refreshView
 */
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshFooterView class]]) {
        [self loadMoreDatas];
    }else{
        [self loadNewDatas];
    }
    
}

/**
 *  加载更多文章
 */
-(void)loadMoreDatas
{
    //发送请求
    GWHomeStatusesParam *param = [[GWHomeStatusesParam alloc]init];
    param.limit = @(5);
    param.retrieve_type = @"reading_list";
    
    if (self.statuses.count) {
        NSUInteger max_count = self.statuses.count;
        param.offset = @(max_count + 1);
    }
    
    [GWStatusTool homeStatusWithParam:param success:^(GWHomeStatusesResult *result) {
        if (result.result.count == 0) {
            [MBProgressHUD showError:@"很抱歉哦，到头啦，没有文章了～"];
        }else{
            //将字典数组转为模型数组
            NSMutableArray *statusFrameArray = [NSMutableArray array];
            for (GWStatus *status in result.result) {
                [statusFrameArray addObject:status];
            }
            //添加新数据到旧数据最后面
            [self.statuses addObjectsFromArray:statusFrameArray];
            //刷新表格
            [self.tableView reloadData];
        }
        //停止刷新
        [self.footer endRefreshing];
    } failure:^(NSError *error) {
        //停止刷新
        [self.footer endRefreshing];
    }];
}


/**
 *  刷新页面
 */
-(void)loadNewDatas
{
    //封装参数
    GWHomeStatusesParam *param = [[GWHomeStatusesParam alloc]init];
    param.limit = @(10);
    param.retrieve_type = @"reading_list";

    param.offset = @(0);
    
    [GWStatusTool homeStatusWithParam:param success:^(GWHomeStatusesResult *result) {
        //将字典数组转为模型数组
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (GWStatus *status in result.result) {
            [statusFrameArray addObject:status];
        }
        self.statuses = statusFrameArray;
        //刷新表格
        [self.tableView reloadData];
        //让刷新的菊花消失
        [self.header endRefreshing];
        
    } failure:^(NSError *error) {
        //让刷新的菊花消失
        [self.header endRefreshing];
    }];
}

-(void)setupTableView
{
    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = self.view.bounds;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    self.tableView = tableView;
}


#pragma mark
#pragma mark SlideNavigationController Methods

/**
 *  代理方法(是否展示左右两个菜单)
 *
 *  @return YES:显示菜单  NO:显示返回上一页图标
 */
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}

#pragma mark
#pragma mark tableview的数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    GWStatusCell *cell = [GWStatusCell cellWithTableView:tableView];
    
    //传递模型
    cell.status = self.statuses[indexPath.row];
    
    return  cell;
}

#pragma mark
#pragma mark tableview代理方法

/**
 *  设置cell高度
 *
 *  @param tableView
 *  @param indexPath
 *
 *  @return cell高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

#pragma mark 点击某篇文章，跳转到文章详情
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GWStatus *status = self.statuses[indexPath.row];
    GWStatus *nextStatus = self.statuses[indexPath.row + 1];
    GWArticleViewController *vc = [[GWArticleViewController alloc]init];
    [vc setValue:status.id forKey:@"story_id"];
    vc.nextStatus = nextStatus;
    SlideNavigationController *slider = (SlideNavigationController *)self.parentViewController;
    [slider pushViewController:vc animated:NO];
}


- (void)dealloc
{
    [ _header free ];
    [ _footer free ];
}
@end
