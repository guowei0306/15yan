//
//  GWArticle.h
//  15yan
//
//  Created by 郭薇 on 15/3/5.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWFirstTopic.h"
#import "GWAccount.h"

@interface GWArticle : NSObject

/**
 *  标题
 */
@property(nonatomic,copy)NSString *title;

/**
 *  副标题
 */
@property(nonatomic,copy)NSString *subtitle;

/**
 *  阅读时间
 */
@property(nonatomic,copy)NSString *read_cost;

/**
 *  读者数量
 */
@property(nonatomic,copy)NSString *readers_count;

/**
 *  文章字数
 */
@property(nonatomic,copy)NSString *words_count;

/**
 *  文章内容
 */
@property(nonatomic,copy)NSString *content;

/**
 *  原图
 */
@property(nonatomic,copy)NSString *image;

/**
 *  缩略图
 */
@property(nonatomic,copy)NSString *image_thumbnail;

/**
 *  小图
 */
@property(nonatomic,copy)NSString *image_minipreface;

/**
 *  用户
 */
@property(nonatomic,strong)GWAccount *account;

/**
 *  话题
 */
@property(nonatomic,strong)GWFirstTopic *first_topic;

@end
