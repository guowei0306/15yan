//
//  GWTopicArticleListCell.m
//  15yan
//
//  Created by 郭薇 on 15/3/10.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#define MARGIN 10
#define GWStatusTableBorder 2

#import "GWTopicArticleListCell.h"
#import "UIImage+GW.h"
#import "GWStatus.h"
#import "GWAccount.h"
#import "UIImageView+WebCache.h"

@interface GWTopicArticleListCell ()
@property (nonatomic,weak) UIImageView *backView;
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *subtitleLabel;
@property (nonatomic,weak) UILabel *authorLabel;
@end

@implementation GWTopicArticleListCell

#pragma mark
#pragma mark 初始化
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    //1.定义一个可循环标识
    static NSString *ID = @"topic_articles_cell";
    //2.去缓存池中取可循环利用cell
    GWTopicArticleListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //3.如果缓存池中没有可循环利用的cell
    if (cell == nil) {
        cell = [[GWTopicArticleListCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加子控件
        [self setupSubView];
    }
    return self;
}
-(void)setupSubView{
    UIImageView *backView = [[UIImageView alloc]init];
    [backView setImage:[UIImage resizeImageWithName:@"timeline_card_bottom_background_os7"]];
    self.backView = backView;
    [self.contentView addSubview:backView];
    
    UIImageView *iconView = [[UIImageView alloc]init];
    self.iconView = iconView;
    [self.contentView addSubview:iconView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [titleLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:20]];
    self.titleLabel = titleLabel;
    [self.contentView addSubview:titleLabel];
    
    UILabel *subtitleLabel = [[UILabel alloc]init];
    [subtitleLabel setFont:[UIFont fontWithName:@"Courier" size:15]];
    self.subtitleLabel = subtitleLabel;
    [self.contentView addSubview:subtitleLabel];
    
    UILabel *authorLabel = [[UILabel alloc]init];
    [authorLabel setFont:[UIFont fontWithName:@"Courier" size:13]];
    authorLabel.textColor = [UIColor grayColor];
    self.authorLabel = authorLabel;
    [self.contentView addSubview:authorLabel];
    
    
}

-(void)setStatus:(GWStatus *)status{
    _status = status;
    self.titleLabel.text = status.title;
    self.subtitleLabel.text = status.subtitle;
    self.authorLabel.text = [NSString stringWithFormat:@"%@ %zd分钟阅读",status.account.realname,status.read_cost];
    self.iconView.layer.masksToBounds = YES;
    self.iconView.layer.cornerRadius = 38;
    [self.iconView setImageWithURL:[NSURL URLWithString:status.account.avatar] placeholderImage:[UIImage imageNamed:@"1"]];
}


-(void)layoutSubviews{
    self.contentView.frame = self.bounds;
    CGRect frame = self.frame;
    
    //设置backView
    self.backView.frame = self.contentView.bounds;
    
    //设置title
    CGFloat nameX = MARGIN;
    CGFloat nameY = nameX;
    CGFloat nameW = frame.size.width - 3 * MARGIN - 75;
    CGFloat nameH = 25;
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    //设置描述
    CGFloat introX = nameX;
    CGFloat introW = nameW;
    CGFloat introH = 40;
    CGFloat introY = MARGIN + CGRectGetMaxY(self.titleLabel.frame);
    self.subtitleLabel.numberOfLines = 2;
    self.subtitleLabel.textAlignment = NSTextAlignmentLeft;
    self.subtitleLabel.frame = CGRectMake(introX, introY, introW, introH);
    
    //设置image
    CGFloat imgW = 75;
    CGFloat imgH = imgW;
    CGFloat imgX = CGRectGetMaxX(self.subtitleLabel.frame) + MARGIN;
    CGFloat imgY = nameY;
    self.iconView.frame = CGRectMake(imgX, imgY, imgW, imgH);
    
    //设置author
    CGFloat authorW = nameW;
    CGFloat authorH = 20;
    CGFloat authorX = nameX;
    CGFloat authorY = MARGIN + CGRectGetMaxY(self.iconView.frame);
    self.authorLabel.textAlignment = NSTextAlignmentLeft;
    self.authorLabel.frame = CGRectMake(authorX, authorY, authorW, authorH);
    
    
}

#pragma mark
#pragma mark 调整frame
/**  拦截frame的设置 */
-(void)setFrame:(CGRect)frame
{
    frame.origin.y += GWStatusTableBorder;
    frame.origin.x = GWStatusTableBorder;
    frame.size.width -= GWStatusTableBorder * 2;
    frame.size.height -= GWStatusTableBorder;
    [super setFrame:frame];
    
}

@end
