//
//  GWArticleCell.m
//  15yan
//
//  Created by 郭薇 on 15/3/11.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#define FOOTHEIGHT 240
#define MARGINSIDE 20
#define PADDING 10

#import "GWArticleIntroView.h"
#import "GWStatus.h"
#import "GWAccount.h"
#import "GWFirstTopic.h"
#import "UIImageView+WebCache.h"

@interface GWArticleIntroView ()
@property (nonatomic,weak)UILabel *titleLabel;
@property (nonatomic,weak)UILabel *subtitleLabel;
@property (nonatomic,weak)UILabel *authorLabel;
@property (nonatomic,weak)UIImageView *backgroundView;
@end

@implementation GWArticleIntroView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews{
    
    UIImageView *backgroundView = [[UIImageView alloc]init];
    [self addSubview:backgroundView];
    self.backgroundView = backgroundView;
    
    UILabel *titleLabel =  [[UILabel alloc]init];
    [titleLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:20]];
    titleLabel.numberOfLines = 2;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *subtitleLabel = [[UILabel alloc]init];
    [subtitleLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:15]];
    subtitleLabel.numberOfLines = 2;
    subtitleLabel.textAlignment = NSTextAlignmentLeft;
    subtitleLabel.textColor = [UIColor whiteColor];
    [self addSubview:subtitleLabel];
    self.subtitleLabel = subtitleLabel;
    
    UILabel *authorLabel = [[UILabel alloc]init];
    [authorLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:13]];
    authorLabel.numberOfLines = 1;
    authorLabel.textAlignment = NSTextAlignmentLeft;
    authorLabel.textColor = [UIColor grayColor];
    [self addSubview:authorLabel];
    self.authorLabel = authorLabel;
}

-(void)layoutSubviews{
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
    
    //backgroundView
    CGFloat backX = 0;
    CGFloat backY = 0;
    CGFloat backW = viewW;
    CGFloat backH = CGRectGetMaxY(self.authorLabel.frame) + MARGINSIDE;
    self.backgroundView.frame =CGRectMake(backX, backY, backW, backH);
}

-(void)setStatus:(GWStatus *)status{
    _status = status;
    self.titleLabel.text = status.title;
    self.subtitleLabel.text = status.subtitle;
    self.authorLabel.text = [NSString stringWithFormat:@"%@ 发表于 %@ %zd分钟阅读",status.account.realname,status.first_topic.name,status.read_cost];
    [self.backgroundView setImageWithURL:[NSURL URLWithString:status.image] placeholderImage:[UIImage imageNamed:@"cover"]];
}

-(CGFloat)heightForArticleCellView{
    return self.backgroundView.frame.size.height;
}
@end
