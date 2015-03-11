//
//  GWButton.m
//  15yan
//
//  Created by 郭薇 on 15/3/11.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import "UIButton+GW.h"

@implementation UIButton (GW)


+(instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font borderWith:(CGFloat)borderWith red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha titleColor:(UIColor *)titleColor highTitleColor:(UIColor *)highTitleColor backgroundColor:(UIColor *)backgroundColor cornerRadius:(CGFloat) cornerRadius{
    
    UIButton *button = [[UIButton alloc]init];
    
    [button.layer setMasksToBounds:YES];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button.titleLabel setFont:font];
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    [button setTitleColor:highTitleColor forState:UIControlStateHighlighted];
    
    [button.layer setBorderWidth:borderWith];   //边框宽度
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ red/255.0, green/255.0, blue/255.0, alpha });
    [button.layer setBorderColor:colorref];//边框颜色
    
    button.backgroundColor = backgroundColor;
    
    [button.layer setCornerRadius:cornerRadius]; //设置矩圆角半径
    
    return button;
}

@end
