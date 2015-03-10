//
//  GWTopicHeaderCell.m
//  15yan
//
//  Created by 郭薇 on 15/3/10.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import "GWTopicHeaderCell.h"
#import "GWFirstTopic.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GW.h"

@interface GWTopicHeaderCell ()
@property (nonatomic,weak) UIImageView *backView;
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UILabel *introLabel;
@property (nonatomic,weak) UIButton *bookButton;


@end

@implementation GWTopicHeaderCell

#pragma mark
#pragma mark 初始化
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    //1.定义一个可循环标识
    static NSString *ID = @"topic_article_header_cell";
    //2.去缓存池中取可循环利用cell
    GWTopicHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //3.如果缓存池中没有可循环利用的cell
    if (cell == nil) {
        cell = [[GWTopicHeaderCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
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
    self.backView = backView;
    [self.contentView addSubview:backView];
    
    UIImageView *iconView = [[UIImageView alloc]init];
    self.iconView = iconView;
    [self.contentView addSubview:iconView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    [nameLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:25]];
    nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel = nameLabel;
    [self.contentView addSubview:nameLabel];
    
    UILabel *introLabel = [[UILabel alloc]init];
    [introLabel setFont:[UIFont fontWithName:@"Courier" size:15]];
    introLabel.textColor = [UIColor whiteColor];
    self.introLabel = introLabel;
    [self.contentView addSubview:introLabel];
    
    UIButton *bookButton = [[UIButton alloc]init];
    
    [bookButton.layer setMasksToBounds:YES];
//    [bookButton.layer setCornerRadius:8.0]; //设置矩圆角半径
    [bookButton.titleLabel setFont:[UIFont fontWithName:@"Courier" size:18]];
    [bookButton.layer setBorderWidth:1.0];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    [bookButton.layer setBorderColor:colorref];//边框颜色
    
    bookButton.backgroundColor = [UIColor clearColor];
    [bookButton setTitle:@"订阅" forState:UIControlStateNormal];
    [bookButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bookButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.bookButton = bookButton;
    [self.contentView addSubview:bookButton];
}

-(void)setTopic:(GWFirstTopic *)topic
{
    _topic = topic;
    //设置子控件的内容
    [self.backView setImageWithURL:[NSURL URLWithString:topic.image_blur]];
    [self.iconView setImageWithURL:[NSURL URLWithString:topic.image] placeholderImage:[UIImage resizeImageWithName:@"timeline_card_bottom_background_os7"]];
    self.nameLabel.text = topic.name;
    self.introLabel.text = topic.introduction;
}

-(void)layoutSubviews{
    self.contentView.frame = self.bounds;
    CGRect frame = self.frame;
    
    //设置背景
    self.backView.frame = self.contentView.bounds;
    
    //设置image
    CGFloat imgW = 100;
    CGFloat imgH = imgW;
    CGFloat imgX = (frame.size.width - imgW) * 0.5;
    CGFloat imgY = 15;
    self.iconView.frame = CGRectMake(imgX, imgY, imgW, imgH);
    
    //设置title
    CGFloat nameX = 20;
    CGFloat nameW = frame.size.width - 2 * nameX;
    CGFloat nameH = 25;
    CGFloat nameY = 10 + imgY + imgH;
    self.nameLabel.numberOfLines = 1;
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    //设置描述
    CGFloat introX = nameX;
    CGFloat introW = frame.size.width - 2 * introX;
    CGFloat introH = 75;
    CGFloat introY = nameY + 10 + nameH;
    self.introLabel.numberOfLines = 3;
    self.introLabel.textAlignment = NSTextAlignmentCenter;
    self.introLabel.frame = CGRectMake(introX, introY, introW, introH);
    
    //设置button
    CGFloat btnW = 100;
    CGFloat btnH = 36;
    CGFloat btnX = (frame.size.width - btnW) * 0.5;
    CGFloat btnY = introY + 10 + introH;
    self.bookButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    
}
@end
