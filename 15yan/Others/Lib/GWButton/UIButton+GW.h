//
//  GWButton.h
//  15yan
//
//  Created by 郭薇 on 15/3/11.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (GW)

+(instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font borderWith:(CGFloat)borderWith red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha titleColor:(UIColor *)titleColor highTitleColor:(UIColor *)highTitleColor backgroundColor:(UIColor *)backgroundColor cornerRadius:(CGFloat) cornerRadius;
@end
