//
//  GWArticleContentView.h
//  15yan
//
//  Created by 郭薇 on 15/3/11.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GWArticle,GWStatus;
@interface GWArticleContentView : UIScrollView

@property(nonatomic,strong)GWArticle *article;
@property(nonatomic,strong)GWStatus *nextStatus;
@property(nonatomic,strong)NSMutableArray *recommendAccounts;

-(CGFloat)heightForArticleContentView;

@end
