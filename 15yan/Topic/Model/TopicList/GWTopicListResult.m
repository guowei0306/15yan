//
//  GWTopicResult.m
//  15yan
//
//  Created by 郭薇 on 15/3/9.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import "GWTopicListResult.h"
#import "GWFirstTopic.h"

@implementation GWTopicListResult

-(NSDictionary *)objectClassInArray
{
    return @{@"result" : [GWFirstTopic class]};
}

@end
