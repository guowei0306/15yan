//
//  GWTopicResult.h
//  15yan
//
//  Created by 郭薇 on 15/3/9.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWTopicListResult : NSObject

/**
 *   里面放的都是GWStatus模型数据
 */
@property(nonatomic,strong)NSArray *result;

@property(nonatomic,assign)BOOL ok;

@property(nonatomic,copy)NSString *now;

@property(nonatomic,assign)long long total;

@property(nonatomic,assign)long long limit;

@property(nonatomic,assign)long long offset;

@end
