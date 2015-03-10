//
//  GWTopicHeaderCell.h
//  15yan
//
//  Created by 郭薇 on 15/3/10.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GWFirstTopic;

@interface GWTopicHeaderCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic,strong) GWFirstTopic *topic;

@end
