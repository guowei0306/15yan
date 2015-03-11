//
//  GWAccountResult.h
//  15yan
//
//  Created by 郭薇 on 15/3/11.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWAccountResult : NSObject

@property(nonatomic,strong)NSArray *result;

@property(nonatomic,assign)BOOL ok;

@property(nonatomic,copy)NSString *now;

@property(nonatomic,assign)long long limit;

@end
