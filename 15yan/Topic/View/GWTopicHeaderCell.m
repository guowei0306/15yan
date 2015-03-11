//
//  GWTopicHeaderCell.m
//  15yan
//
//  Created by 郭薇 on 15/3/10.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#define MARGIN 20
#define PADDING 10

#import "GWTopicHeaderCell.h"
#import "GWFirstTopic.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GW.h"
#import "GWAccount.h"

@interface GWTopicHeaderCell ()
@property (nonatomic,weak) UIImageView *backView;
@property (nonatomic,weak) UILabel *ownerLabel;
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
    
    UILabel *ownerLabel = [[UILabel alloc]init];
    [ownerLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:15]];
    ownerLabel.textAlignment = NSTextAlignmentCenter;
    ownerLabel.textColor = [UIColor whiteColor];
    self.ownerLabel = ownerLabel;
    [self.contentView addSubview:ownerLabel];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    [nameLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:30]];
    nameLabel.numberOfLines = 2;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel = nameLabel;
    [self.contentView addSubview:nameLabel];
    
    UILabel *introLabel = [[UILabel alloc]init];
    [introLabel setFont:[UIFont fontWithName:@"Courier" size:15]];
    introLabel.textColor = [UIColor whiteColor];
    introLabel.numberOfLines = 3;
    introLabel.textAlignment = NSTextAlignmentCenter;
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
    self.nameLabel.text = topic.name;
    self.introLabel.text = topic.introduction;
    self.ownerLabel.text = [NSString stringWithFormat:@"主编 %@",topic.owner_account.realname];
}

-(void)layoutSubviews{
    self.contentView.frame = self.bounds;
    CGRect frame = self.frame;
    
    //设置背景
    self.backView.frame = self.contentView.bounds;
    
    //设置owner
    CGFloat ownerX = MARGIN;
    CGFloat ownerY = ownerX;
    CGFloat ownerW = frame.size.width - (2 * ownerX);
    CGFloat ownerH = 30;
    self.ownerLabel.frame = CGRectMake(ownerX, ownerY, ownerW, ownerH);
    
    //设置title
    CGFloat nameX = MARGIN;
    CGFloat nameW = frame.size.width - 2 * nameX;
    CGFloat nameH = 60;
    CGFloat nameY = PADDING + CGRectGetMaxY(self.ownerLabel.frame);
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    //设置描述
    CGFloat introX = nameX;
    CGFloat introW = frame.size.width - 2 * introX;
    CGFloat introH = 75;
    CGFloat introY = CGRectGetMaxY(self.nameLabel.frame) + PADDING ;
    self.introLabel.frame = CGRectMake(introX, introY, introW, introH);
    
    //设置button
    CGFloat btnW = 100;
    CGFloat btnH = 36;
    CGFloat btnX = (frame.size.width - btnW) * 0.5;
    CGFloat btnY = CGRectGetMaxY(self.introLabel.frame) + PADDING;
    self.bookButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    
}


@end
