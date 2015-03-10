//
//  GWStatus.h
//  GWWeibo
//
//  Created by 郭薇 on 14-11-26.
//  Copyright (c) 2014年 郭薇. All rights reserved.
//  一个status对象就是一条微博

#import <Foundation/Foundation.h>

@class GWAccount,GWFirstTopic;

@interface GWStatus : NSObject
/**
 *  文章ID
 */
@property(nonatomic,copy)NSString *id;
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
@property(nonatomic,assign)long long read_cost;

/**
 *  来源类型
 */
@property(nonatomic,copy)NSString *source;

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
