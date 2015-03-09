//
//  GWFirstTopic.h
//  15yan
//
//  Created by 郭薇 on 15/3/4.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GWAccount;

@interface GWFirstTopic : NSObject

/**
 *  话题ID
 */
@property(nonatomic,copy)NSString *id;

/**
 *  话题名称
 */
@property(nonatomic,copy)NSString *name;

/**
 *  大图
 */
@property(nonatomic,copy)NSString *image;

/**
 *  缩略图
 */
@property(nonatomic,copy)NSString *image_thumbnail;

/**
 *  模糊图
 */
@property(nonatomic,copy)NSString *image_blur;


/**
 *  话题主编
 */
@property(nonatomic,strong)GWAccount *owner_account;

/**
 *   订阅数
 */
@property(nonatomic,assign)long long followers_count;

/**
 *   投稿数
 */
@property(nonatomic,assign)long long submissions_count;

/**
 *   文章数
 */
@property(nonatomic,assign)long long stories_count;

/**
 *  创建时间
 */
@property(nonatomic,copy)NSString *date_created;

/**
 *  标签
 */
@property(nonatomic,strong)NSArray *tags;

@end
