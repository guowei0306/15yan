//
//  GWHomeStatuses.h
//  GWWeibo
//
//  Created by 郭薇 on 14-12-8.
//  Copyright (c) 2014年 郭薇. All rights reserved.
//  封装首页微博数据的参数

#import <Foundation/Foundation.h>
#import "GWBaseParam.h"

@interface GWHomeStatusesParam :GWBaseParam

@property(nonatomic,strong)NSNumber *offset;

@property(nonatomic,strong)NSNumber *limit;

@property(nonatomic,strong)NSString *retrieve_type;

@property(nonatomic,strong)NSString *topic_id;

@end
