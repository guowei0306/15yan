//
//  GWTopicCell.h
//  15yan
//
//  Created by 郭薇 on 15/3/9.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GWFirstTopic;

@interface GWTopicCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIImageView *topicImage;
@property (weak, nonatomic) IBOutlet UILabel *topicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *topicIntroLabel;

@property (strong,nonatomic) GWFirstTopic *topic;
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
