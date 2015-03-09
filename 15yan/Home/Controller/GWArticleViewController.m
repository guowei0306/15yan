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

#if iPhone5
#define ImageWidth 320

#else
#define ImageWidth 375
#endif

#define ImageHeight 300

@interface GWArticleViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation GWArticleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    [self loadArticleDatas:self.param];

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
    } failure:^(NSError *error) {
        
    }];
}

-(void)setupSubViews
{
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1000);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
}

-(void)setupContent
{
    self.titleLabel.text = self.article.title;
    self.subtitleLabel.text = self.article.subtitle;
    self.authorLabel.text = [NSString stringWithFormat:@"%@  发表于  %@",self.article.account.realname,self.article.first_topic.name];
//    [self.topImageView setImageWithURL:[NSURL URLWithString:self.article.image] placeholderImage:[UIImage imageNamed:@"rightMenu"]];
    //暂时不需要placeholderImage
     [self.topImageView setImageWithURL:[NSURL URLWithString:self.article.image]];
    self.content.text = self.article.content;
}


#pragma mark
#pragma mark 代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset   = self.scrollView.contentOffset.y;
    if (yOffset < 0) {//起始点不是从0开始
        CGFloat factor = ((ABS(yOffset)+ImageHeight)*ImageWidth)/ImageHeight;//放大的比例
        CGRect f = CGRectMake(-(factor-ImageWidth)/2, 0, factor, ImageHeight+ABS(yOffset));
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



@end
