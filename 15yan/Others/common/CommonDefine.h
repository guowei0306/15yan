//
//  CommonDefine.h
//  15yan
//
//  Created by 郭薇 on 15/3/5.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#ifndef _5yan_CommonDefine_h
#define _5yan_CommonDefine_h

//1.判断系统
//iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] == 7.0 )
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] == 8.0 )
#define iOS6 ([[UIDevice currentDevice].systemVersion doubleValue] < 7.0 )


//2.判断是否四英寸
#define iPhone5 ([UIScreen mainScreen].bounds.size.height == 568)
#define iPhone6 ([UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6p ([UIScreen mainScreen].bounds.size.height == 736)

//3.自定义Log
#ifdef DEBUG
#define GWLog(...) NSLog(__VA_ARGS__)
#else
#define GWLog(...)
#endif

//4.获得RGB颜色
#define GWColor(r, g, b, a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]


#endif
