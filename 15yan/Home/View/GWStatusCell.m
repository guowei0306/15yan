//
//  GWStatusCellTableViewCell.m
//  15yan
//
//  Created by 郭薇 on 15/3/3.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//
#define GWStatusTableBorder 2
#import "GWStatusCell.h"
#import "GWStatus.h"
#import "GWAccount.h"
#import "GWFirstTopic.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GW.h"
#import "CommonDefine.h"

@implementation GWStatusCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *CellIdentifier = @"StatusCell";
    GWStatusCell *cell = (GWStatusCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        if (iPhone6) {
            cell = (GWStatusCell *)[[[NSBundle  mainBundle] loadNibNamed:@"GWStatusCell_750" owner:self options:nil]  lastObject];
        }else{
            cell = (GWStatusCell *)[[[NSBundle  mainBundle] loadNibNamed:@"GWStatusCell" owner:self options:nil]  lastObject];
        }

    }
    return cell;
}

-(void)setStatus:(GWStatus *)status
{
    _status = status;
    self.background.image  = [UIImage resizeImageWithName:@"timeline_card_bottom_background_os7"];
    self.background.highlightedImage = [UIImage resizeImageWithName:@"timeline_card_bottom_background_highlighted_os7"] ;
    self.title.text = self.status.title;
    self.subtitle.text = self.status.subtitle;
    [self.image setImageWithURL:[NSURL URLWithString:self.status.image_minipreface] placeholderImage:[UIImage imageNamed:@"rightMenu"]];
    self.author.text = [NSString stringWithFormat:@"%@ 发表于%@ %zd分钟阅读",self.status.account.realname,self.status.first_topic.name,self.status.read_cost];
    
}

#pragma mark
#pragma mark 调整frame
/**  拦截frame的设置 */
-(void)setFrame:(CGRect)frame
{
    frame.origin.y += GWStatusTableBorder;
//    frame.origin.x = GWStatusTableBorder;
    frame.size.width -= GWStatusTableBorder * 2;
    frame.size.height -= GWStatusTableBorder;
    [super setFrame:frame];
    
}

@end
