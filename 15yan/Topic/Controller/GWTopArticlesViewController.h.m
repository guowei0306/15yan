//
//  GWTestViewController.m
//  15yan
//
//  Created by 郭薇 on 15/3/10.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import "GWTopArticlesViewController.h"
#import "GWTopicHeaderCell.h"
#import "GWTopicArticleListCell.h"
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


@interface GWTopArticlesViewController ()<MJRefreshBaseViewDelegate>
@property(nonatomic,strong) NSMutableArray *statuses;
@property(nonatomic,copy) NSString *article_id;
@property(nonatomic,weak) MJRefreshFooterView *footer;
@property(nonatomic,weak) MJRefreshHeaderView *header;
@end

@implementation GWTopArticlesViewController

#pragma mark
#pragma mark 懒加载status
-(NSMutableArray *)statuses
{
    if (_statuses == nil) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}
//
//-(instancetype)init{
//    self = [super init];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
    //集成刷新控件
    [self setupRefreshView];
}

-(void)setupTableView{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
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
    param.retrieve_type = @"by_topic";
    param.topic_id = self.topic.id;
    
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
    param.retrieve_type = @"by_topic";
    param.topic_id = self.topic.id;
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        GWTopicHeaderCell *cell = [GWTopicHeaderCell cellWithTableView:tableView];
        cell.topic = self.topic;
        return cell;
    }else{
        GWTopicArticleListCell *cell = [GWTopicArticleListCell cellWithTableView:tableView];
        cell.status = self.statuses[indexPath.row];
        return cell;
    }
  
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height;
    if (indexPath.row == 0) {
        height = 300;
    }else{
        height = 125;
    }
    return height;
}

-(void)dealloc{
    [_header free];
    [_footer free];
}

@end
