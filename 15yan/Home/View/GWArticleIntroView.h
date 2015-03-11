//
//  GWArticleCell.h
//  15yan
//
//  Created by 郭薇 on 15/3/11.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GWStatus;

@interface GWArticleIntroView :UIView

-(CGFloat)heightForArticleCellView;

@property(nonatomic,strong)GWStatus *status;

@end
