//
//  GWStatusCellTableViewCell.h
//  15yan
//
//  Created by 郭薇 on 15/3/3.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GWStatus;

@interface GWStatusCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *readcost;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UIImageView *background;

@property (strong,nonatomic) GWStatus *status;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
