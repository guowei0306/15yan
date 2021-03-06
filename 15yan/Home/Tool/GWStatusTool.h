//
//  GWStatusTool.h
//  GWWeibo
//
//  Created by 郭薇 on 14-12-8.
//  Copyright (c) 2014年 郭薇. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GWHomeStatusesParam.h"
#import "GWHomeStatusesResult.h"
#import "GWArticleParam.h"
#import "GWArticleResult.h"
#import "GWTopicListParam.h"
#import "GWTopicListResult.h"
#import "GWAccountParam.h"
#import "GWAccountResult.h"

@interface GWStatusTool : NSObject

/**
 *  加载首页的文章列表数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+(void)homeStatusWithParam:(GWHomeStatusesParam *)param success:(void (^)(GWHomeStatusesResult *result))success failure:(void (^)(NSError *error))failure;


/**
 *  加载文章数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+(void)articleStatusWithParam:(GWArticleParam *)param success:(void (^)(GWArticleResult *result))success failure:(void (^)(NSError *error))failure;

/**
 *  加载话题数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+(void)topicListWithParam:(GWTopicListParam *)param success:(void (^)(GWTopicListResult *result))success failure:(void (^)(NSError *error))failure;

/**
 *  加载用户数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+(void)accountsRecommendWithParam:(GWAccountParam *)param success:(void (^)(GWAccountResult *result))success failure:(void (^)(NSError *error))failure;

@end
