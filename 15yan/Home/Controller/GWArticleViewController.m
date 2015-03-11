//
//  GWArticleViewController.m
//  15yan
//
//  Created by 郭薇 on 15/3/4.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import "GWArticleViewController.h"
#import "GWArticle.h"
#import "GWArticleParam.h"
#import "GWStatusTool.h"
#import "GWArticleResult.h"
#import "GWAccount.h"
#import "UIImageView+WebCache.h"
#import "GWArticleContentView.h"


@interface GWArticleViewController ()
@property (assign, nonatomic) CGFloat ImageWidth;
@property (assign, nonatomic) CGFloat ImageHeight;
@property (weak, nonatomic) GWArticleContentView *scrollView;
@property (weak, nonatomic) UIImageView *topImageView;
@property(nonatomic,strong) GWArticle *article;
@property(nonatomic,strong)NSMutableArray *recommendAccounts;
@end

@implementation GWArticleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubViews];
    [self loadArticleDatas:self.story_id];
    [self loadRecommendAccounts:self.story_id];
    

}


-(void)loadArticleDatas:(NSString *)story_id
{
    //封装参数
    GWArticleParam *param = [[GWArticleParam alloc]init];
    param.story_id = story_id;
    [GWStatusTool articleStatusWithParam:param success:^(GWArticleResult *result) {
        //将字典数组转为模型数组
        self.article = result.result[0];
        [self setupContent];
        self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.scrollView.heightForArticleContentView);
    } failure:^(NSError *error) {
        
    }];
}

-(void)loadRecommendAccounts:(NSString *)story_id{
    GWAccountParam *param = [[GWAccountParam alloc]init];
    param.retrieve_type = @"by_story_recommend";
    param.story_id = self.story_id;
    [GWStatusTool accountsRecommendWithParam:param success:^(GWAccountResult *result) {
        //将字典数组转为模型数组
        NSMutableArray *accountArray = [NSMutableArray array];
        for (GWAccount *account in result.result) {
            [accountArray addObject:account];
        }
        self.recommendAccounts = accountArray;
    } failure:^(NSError *error) {
        
    }];
}

-(void)setupSubViews
{
    
    UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240)];
    self.ImageWidth = topImageView.frame.size.width;
    self.ImageHeight = topImageView.frame.size.height;
    self.topImageView = topImageView;
    [self.view addSubview:topImageView];
    
    GWArticleContentView *scrollView = [[GWArticleContentView alloc]initWithFrame:self.view.bounds];
    scrollView.scrollEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
}

-(void)setupContent
{
    self.scrollView.article = self.article;
    self.scrollView.recommendAccounts = self.recommendAccounts;
    self.scrollView.nextStatus = self.nextStatus;
    if ([self.article.image isEqualToString:@""] || self.article.image == nil) {
        [self.topImageView setImage:[UIImage imageNamed:@"cover"]];
    }else{
        [self.topImageView setImageWithURL:[NSURL URLWithString:self.article.image]];
    }
}


#pragma mark
#pragma mark 代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset   = self.scrollView.contentOffset.y;
    if (yOffset < 0) {//起始点不是从0开始
        CGFloat factor = ((ABS(yOffset)+self.ImageHeight)*self.ImageWidth)/self.ImageHeight;//放大的比例
        CGRect f = CGRectMake(-(factor-self.ImageWidth)/2, 0, factor, self.ImageHeight+ABS(yOffset));
        self.topImageView.frame = f;
    }else {
        CGRect f = self.topImageView.frame;
        f.origin.y = -yOffset;
        self.topImageView.frame = f;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

@end
