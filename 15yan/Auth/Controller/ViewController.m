//
//  ViewController.m
//  15yan
//
//  Created by 郭薇 on 15/1/28.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)codeForAutolayout
{
    
    //1.添加blue view
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:blueView];
    
    //  blueView.frame = CGRectMake(0, 0, 100, 100);
    
    //2.添加约束
    //取消autoresize
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    [blueView addConstraint:width];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    [blueView addConstraint:height];
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self.view addConstraint:centerX];//约束要添加到关系中高级的控件上。
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self.view addConstraint:centerY];
}

@end
