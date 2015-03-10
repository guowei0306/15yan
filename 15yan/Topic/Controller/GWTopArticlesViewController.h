//
//  GWTestViewController.h
//  15yan
//
//  Created by 郭薇 on 15/3/10.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@class GWFirstTopic;
@interface GWTopArticlesViewController : UITableViewController<SlideNavigationControllerDelegate>


@property(nonatomic,strong)GWFirstTopic *topic;

@end
