//
//  GWArticleContentView.m
//  15yan
//
//  Created by 郭薇 on 15/3/11.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#define MARGINTOP 66
#define TOPHEIGHT 240
#define MARGINSIDE 30
#define PADDING 10

#import "GWArticleContentView.h"
#import "GWArticle.h"
#import "GWAccount.h"
#import "GWFirstTopic.h"
#import "GWArticleRecommendView.h"
#import "GWArticleIntroView.h"

@interface GWArticleContentView ()

@property (nonatomic,weak) UIView *topBackView;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *subtitleLabel;
@property (nonatomic,weak) UILabel *authorLabel;
@property (nonatomic,weak) UILabel *contentLabel;
@property (nonatomic,weak) GWArticleRecommendView *recommendView;
@property (nonatomic,weak) GWArticleIntroView *nextView;

@end

@implementation GWArticleContentView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //开始布局
        [self setupSubviews];
    }
    return self;
}

#pragma mark
#pragma mark 创建子控件
-(void)setupSubviews{
    UILabel *contentLabel = [[UILabel alloc]init];
    [contentLabel setFont:[UIFont fontWithName:@"Courier" size:13]];
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    UIView *topBackView = [[UIView alloc]init];
    [self addSubview:topBackView];
    self.topBackView = topBackView;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [titleLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:20]];
    titleLabel.numberOfLines = 2;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = [UIColor whiteColor];
    [self.topBackView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *subtitleLabel = [[UILabel alloc]init];
    [subtitleLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:15]];
    subtitleLabel.numberOfLines = 2;
    subtitleLabel.textAlignment = NSTextAlignmentLeft;
    subtitleLabel.textColor = [UIColor whiteColor];
    [self.topBackView addSubview:subtitleLabel];
    self.subtitleLabel = subtitleLabel;
    
    UILabel *authorLabel = [[UILabel alloc]init];
    [authorLabel setFont:[UIFont fontWithName:@"Courier" size:13]];
    authorLabel.numberOfLines = 1;
    authorLabel.textAlignment = NSTextAlignmentLeft;
    authorLabel.textColor = [UIColor grayColor];
    [self.topBackView addSubview:authorLabel];
    self.authorLabel = authorLabel;
    
    GWArticleRecommendView *recommendView = [[GWArticleRecommendView alloc]init];
    [self addSubview:recommendView];
    self.recommendView = recommendView;
    
    GWArticleIntroView *nextView = [[GWArticleIntroView alloc]init];
    [self addSubview:nextView];
    self.nextView = nextView;
 
}

#pragma mark 设置子控件的frame
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat viewW = self.frame.size.width;
    
    //titleLabel
    CGFloat titleX = MARGINSIDE;
    CGFloat titleY = MARGINSIDE;
    CGFloat titleW = viewW - (2 * MARGINSIDE);
    CGFloat titleH = 50;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    //subtitleLabel
    CGFloat subtitleX = titleX;
    CGFloat subtitleY = CGRectGetMaxY(self.titleLabel.frame) + PADDING;
    CGFloat subtitleW = titleW;
    CGFloat subtitleH = 40;
    self.subtitleLabel.frame = CGRectMake(subtitleX, subtitleY, subtitleW, subtitleH);
    
    //authorLabel
    CGFloat authorX = subtitleX;
    CGFloat authorY = CGRectGetMaxY(self.subtitleLabel.frame) + PADDING;
    CGFloat authorW = titleW;
    CGFloat authorH = 20;
    self.authorLabel.frame = CGRectMake(authorX, authorY, authorW, authorH);
    
    //topView
    CGRect topFrame = self.bounds;
    topFrame.origin.y = MARGINTOP;
    topFrame.size.height = CGRectGetMaxY(self.authorLabel.frame);
    self.topBackView.frame = topFrame;
    self.topBackView.backgroundColor = [UIColor clearColor];
    
    //contentLabel
    CGFloat contentX = PADDING;
    CGFloat contentY = CGRectGetMaxY(self.topBackView.frame) + PADDING;
    CGFloat contentW = viewW - 2 * contentX;
    CGFloat contentH = 500;
    self.contentLabel.frame = CGRectMake(contentX, contentY, contentW, contentH);
    
    //recommend view
    CGFloat recommendX = 0;
    CGFloat recommendY = CGRectGetMaxY(self.contentLabel.frame) + MARGINSIDE;
    CGFloat recommendW = viewW;
    CGFloat recommendH = [self.recommendView heightForRecommendView];
    self.recommendView.frame = CGRectMake(recommendX, recommendY, recommendW, recommendH);
    
    //next view
    CGFloat nextX = 0;
    CGFloat nextY = CGRectGetMaxY(self.recommendView.frame);
    CGFloat nextW = viewW;
    CGFloat nextH = self.nextView.heightForArticleCellView;
    self.nextView.frame = CGRectMake(nextX, nextY, nextW, nextH);
    
}

-(void)setArticle:(GWArticle *)article{
    _article = article;
    self.titleLabel.text = article.title;
    self.subtitleLabel.text = article.subtitle;
    self.authorLabel.text = [NSString stringWithFormat:@"%@ 发表于 %@",article.account.realname,article.first_topic.name];
    self.contentLabel.text = article.content;
}

-(void)setNextStatus:(GWStatus *)nextStatus{
    _nextStatus = nextStatus;
    self.nextView.status = nextStatus;
}

-(void)setRecommendAccounts:(NSMutableArray *)recommendAccounts{
    _recommendAccounts = recommendAccounts;
    self.recommendView.recommendAccounts = recommendAccounts;
}

-(CGFloat)heightForArticleContentView{
    return CGRectGetMaxY(self.nextView.frame);
}

@end
