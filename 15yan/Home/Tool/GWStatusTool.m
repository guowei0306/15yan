//
//  GWStatusTool.m
//  GWWeibo
//
//  Created by 郭薇 on 14-12-8.
//  Copyright (c) 2014年 郭薇. All rights reserved.
//

#import "GWStatusTool.h"
#import "GWHttpTool.h"
#import "MJExtension.h"

@implementation GWStatusTool

+(void)homeStatusWithParam:(GWHomeStatusesParam *)param success:(void (^)(GWHomeStatusesResult *))success failure:(void (^)(NSError *))failure
{
    [GWHttpTool getWithUrl:@"http://www.15yan.com/apis/story.json" params:param.keyValues success:^(id json) {
        if (success) {
            GWHomeStatusesResult *result = [GWHomeStatusesResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure%@",error);
        }
    }];

}


+(void)articleStatusWithParam:(GWArticleParam *)param success:(void (^)(GWArticleResult *result))success failure:(void (^)(NSError *error))failure
{
    [GWHttpTool getWithUrl:@"http://www.15yan.com/apis/story.json" params:param.keyValues success:^(id json) {
        if (success) {
            GWArticleResult *result = [GWArticleResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure%@",error);
        }
    }];
    
}


+(void)topicListWithParam:(GWTopicListParam *)param success:(void (^)(GWTopicListResult *result))success failure:(void (^)(NSError *error))failure
{
    [GWHttpTool getWithUrl:@"http://www.15yan.com/apis/topic.json" params:param.keyValues success:^(id json) {
        if (success) {
            GWTopicListResult *result = [GWTopicListResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"failure%@",error);
        }
    }];
    
}
@end
