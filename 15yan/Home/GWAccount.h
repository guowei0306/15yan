//
//  GWUser.h
//  15yan
//
//  Created by 郭薇 on 15/3/4.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWAccount : NSObject


/**
 *  姓名
 */
@property(nonatomic,copy)NSString *realname;

/**
 *  唯一key
 */
@property(nonatomic,copy)NSString *unikey;

/**
 *  是否可备注
 */
@property(nonatomic,assign)BOOL is_story_noteable;

/**
 *  是否邮件通知
 */
@property(nonatomic,assign)BOOL is_email_notify;

/**
 *  是否存在
 */
@property(nonatomic,assign)BOOL is_exists;

/**
 *  个人页链接
 */
@property(nonatomic,copy)NSString *url;

/**
 *  个人说明
 */
@property(nonatomic,copy)NSString *introduction;

/**
 *  账户状态
 */
@property(nonatomic,copy)NSString *status;

/**
 *  头像
 */
@property(nonatomic,copy)NSString *avatar;

/**
 *  个人页背景图
 */
@property(nonatomic,copy)NSString *background;

/**
 *  用户id
 */
@property(nonatomic,copy)NSString *id;



@end
