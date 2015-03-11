//
//  GWArticleViewController.h
//  15yan
//
//  Created by 郭薇 on 15/3/4.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
@class GWArticle,GWStatus;

@interface GWArticleViewController : UIViewController<UIScrollViewDelegate,SlideNavigationControllerDelegate>

@property (strong, nonatomic) NSString *story_id;
@property (nonatomic,strong)GWStatus *nextStatus;

@end
