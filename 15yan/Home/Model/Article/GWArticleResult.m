//
//  GWArticleResult.m
//  15yan
//
//  Created by 郭薇 on 15/3/5.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import "GWArticleResult.h"
#import "GWArticle.h"

@implementation GWArticleResult


-(NSDictionary *)objectClassInArray
{
    return @{@"result" : [GWArticle class]};
}


@end
