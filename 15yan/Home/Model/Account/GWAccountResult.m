//
//  GWAccountResult.m
//  15yan
//
//  Created by 郭薇 on 15/3/11.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import "GWAccountResult.h"
#import "GWAccount.h"

@implementation GWAccountResult

-(NSDictionary *)objectClassInArray
{
    return @{@"result" : [GWAccount class]};
}

@end
