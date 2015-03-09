//
//  GWArticleViewController.h
//  15yan
//
//  Created by 郭薇 on 15/3/4.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GWArticle;

@interface GWArticleViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,strong) GWArticle *article;

-(void)loadArticleDatas:(NSString *)story_id;
@property (strong, nonatomic) NSString *param;

@end
