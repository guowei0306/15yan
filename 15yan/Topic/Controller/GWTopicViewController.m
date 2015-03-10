//
//  GWTopicViewControllerTableViewController.m
//  15yan
//
//  Created by 郭薇 on 15/3/9.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#define TYPE_HOT by_top
#define TYPE_INTRO by_recommend

#import "GWTopicViewController.h"
#import "GWTopicCell.h"
#import "MJRefresh.h"
#import "MBProgressHUD+MJ.h"
#import "GWTopicListParam.h"
#import "GWTopicListResult.h"
#import "GWStatusTool.h"
#import "HomeViewController.h"
#import "GWFirstTopic.h"
#import "SlideNavigationController.h"
#import "GWTopArticlesViewController.h"

@interface GWTopicViewController ()<MJRefreshBaseViewDelegate>
@property (nonatomic,strong)NSMutableArray *topics;
@property (nonatomic,strong)GWFirstTopic *selected_topic;
@property (nonatomic,assign)long long total;
@property(nonatomic,weak) MJRefreshFooterView *footer;
@property(nonatomic,weak) MJRefreshHeaderView *header;
@end

@implementation GWTopicViewController

#pragma mark
#pragma mark 懒加载status
-(NSMutableArray *)topics
{
    if (_topics == nil) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor blueColor];
    
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"topic_articles" source:self destination:vc performHandler:^{
        NSLog(@"跳转啦");
    }];
    
    
    [self setupTableView];
    
    //集成刷新控件
    [self setupRefreshView];
}

-(void)setupTableView{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
 *  加载更多话题
 */
-(void)loadMoreDatas
{
    //发送请求
    GWTopicListParam *param = [[GWTopicListParam alloc]init];
    param.limit = @(5);
    if ([self.by_key isEqualToString:@"top"]) {
        param.retrieve_type = @"by_top";
    }else{
        param.retrieve_type = @"by_recommend";
    }
    
    
    if (self.topics.count) {
        NSUInteger max_count = self.topics.count;
        param.offset = @(max_count + 1);
    }
    
    [GWStatusTool topicListWithParam:param success:^(GWTopicListResult *result) {
        if (result.total == self.topics.count) {
            [MBProgressHUD showError:@"很抱歉哦，到头啦，没有话题了～"];
        }else{
            //将字典数组转为模型数组
            NSMutableArray *topicArray = [NSMutableArray array];
            for (GWFirstTopic *topic in result.result) {
                [topicArray addObject:topic];
            }
            //添加新数据到旧数据最后面
            [self.topics addObjectsFromArray:topicArray];
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
 *  刷新话题内容
 */
-(void)loadNewDatas
{
    //封装参数
    GWTopicListParam *param = [[GWTopicListParam alloc]init];
    param.limit = @(10);
    if ([self.by_key isEqualToString:@"top"]) {
        param.retrieve_type = @"by_top";
    }else{
        param.retrieve_type = @"by_recommend";
    }
    param.offset = @(0);
    
    [GWStatusTool topicListWithParam:param success:^(GWTopicListResult *result) {
        //将字典数组转为模型数组
        NSMutableArray *topicArray = [NSMutableArray array];
        for (GWFirstTopic *topic in result.result) {
            [topicArray addObject:topic];
        }
        self.topics = topicArray;
        //刷新表格
        [self.tableView reloadData];
        //让刷新的菊花消失
        [self.header endRefreshing];
        
    } failure:^(NSError *error) {
        //让刷新的菊花消失
        [self.header endRefreshing];
    }];
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

#pragma mark
#pragma mark tableview的数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _topics.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    GWTopicCell *cell = [GWTopicCell cellWithTableView:tableView];
    
    //传递模型
    cell.topic = self.topics[indexPath.row];
    
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
    return 124;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark 点击某篇文章，跳转到文章详情
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GWFirstTopic *topic = self.topics[indexPath.row];
    self.selected_topic = topic;
    //    //请求文章详情接口
    GWTopArticlesViewController *vc = [[GWTopArticlesViewController alloc]init];
    vc.topic = topic;
    SlideNavigationController *slider = (SlideNavigationController *)self.parentViewController.parentViewController;
    [slider pushViewController:vc animated:NO];
   
}


#pragma mark 
#pragma mark 销毁前的函数
- (void)dealloc
{
    [_header free];
    [_footer free];
}




@end
