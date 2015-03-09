//
//  GWTopicCell.m
//  15yan
//
//  Created by 郭薇 on 15/3/9.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import "GWTopicCell.h"
#import "GWFirstTopic.h"
#import "GWAccount.h"
#import "GWFirstTopic.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GW.h"
#import "CommonDefine.h"

@implementation GWTopicCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *CellIdentifier = @"TopicCell";
    GWTopicCell *cell = (GWTopicCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        if (iPhone6) {
            cell = (GWTopicCell *)[[[NSBundle  mainBundle] loadNibNamed:@"GWTopicCell_750" owner:self options:nil]  lastObject];
        }else{
            cell = (GWTopicCell *)[[[NSBundle  mainBundle] loadNibNamed:@"GWTopicCell" owner:self options:nil]  lastObject];
        }
        
    }
    return cell;
}

-(void)setTopic:(GWFirstTopic *)topic
{
    _topic = topic;
    self.background.image  = [UIImage resizeImageWithName:@"timeline_card_bottom_background_os7"];
    self.background.highlightedImage = [UIImage resizeImageWithName:@"timeline_card_bottom_background_highlighted_os7"] ;
    [self.topicImage setImageWithURL:[NSURL URLWithString:self.topic.image_thumbnail] placeholderImage:[UIImage imageNamed:@"rightMenu"]];
    self.topicNameLabel.text = topic.name;
    self.topicIntroLabel.text = [NSString stringWithFormat:@"%@ 主编 %zd人订阅",topic.owner_account.realname,topic.followers_count];
    
}
@end
