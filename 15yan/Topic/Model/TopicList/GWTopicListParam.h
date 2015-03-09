//
//  GWTopicParam.h
//  15yan
//
//  Created by 郭薇 on 15/3/9.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWTopicListParam : NSObject

@property(nonatomic,strong)NSNumber *offset;

@property(nonatomic,strong)NSNumber *limit;

@property(nonatomic,strong)NSString *retrieve_type;

@end
