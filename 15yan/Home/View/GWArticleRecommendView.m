//
//  GWArticleRecommendView.m
//


//
//  Created by 郭薇 on 15/3/11.
//  Copyright (c) 2015年 郭薇. All rights reserved.
//

#define MARGIN 10
#define PADDING 5
#define BTWIDTH 30


#import "GWArticleRecommendView.h"
#import "DKCircleButton.h"
#import "UIButton+GW.h"
#import "UIImageView+WebCache.h"
#import "CommonDefine.h"
#import "GWAccount.h"
#import "UIButton+WebCache.h"

@interface GWArticleRecommendView ()

@property (nonatomic,weak)UIButton *recommendButton;
@property (nonatomic,weak)DKCircleButton *oneRecommenderButon;
@property (nonatomic,weak)DKCircleButton *twoRecommenderButon;
@property (nonatomic,weak)DKCircleButton *threeRecommenderButon;
@property (nonatomic,weak)DKCircleButton *othersRecommenderButon;
@property (nonatomic,weak)UIButton *weiboShareButon;
@property (nonatomic,weak)UIButton *weixinShareButon;

@end


@implementation GWArticleRecommendView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //开始布局
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubviews];
    }
    return self;
}

#pragma mark
#pragma mark 添加控件
-(void)setupSubviews{
    UIColor *btColor = GWColor(30, 164, 75, 1);
    UIButton *recommendButton = [UIButton buttonWithTitle:@"推荐" font:[UIFont fontWithName:@"Courier" size:14] borderWith:1.0 red:30 green:164 blue:75 alpha:1 titleColor:btColor highTitleColor:[UIColor grayColor] backgroundColor:[UIColor clearColor] cornerRadius:0];
    [self addSubview:recommendButton];
    self.recommendButton = recommendButton;
    
    DKCircleButton *oneRecommenderButon = [[DKCircleButton alloc]init];
    oneRecommenderButon.borderSize = 0;
    [self addSubview:oneRecommenderButon];
    self.oneRecommenderButon = oneRecommenderButon;
    
    DKCircleButton *twoRecommenderButon = [[DKCircleButton alloc]init];
    twoRecommenderButon.borderSize = 0;
    [self addSubview:twoRecommenderButon];
    self.twoRecommenderButon = twoRecommenderButon;
    
    DKCircleButton *threeRecommenderButon = [[DKCircleButton alloc]init];
    threeRecommenderButon.borderSize = 0;
    [self addSubview:threeRecommenderButon];
    self.threeRecommenderButon = threeRecommenderButon;
    
    DKCircleButton *othersRecommenderButon = [[DKCircleButton alloc]init];
    othersRecommenderButon.borderSize = 1;
    othersRecommenderButon.borderColor = btColor;
    othersRecommenderButon.titleLabel.textAlignment = NSTextAlignmentCenter;
    [othersRecommenderButon setTitle:@"..." forState:UIControlStateNormal];
    [othersRecommenderButon setTitleColor:btColor forState:UIControlStateNormal];
    [self addSubview:othersRecommenderButon];
    self.othersRecommenderButon = othersRecommenderButon;
    
    UIButton *weiboShareButon = [[UIButton alloc]init];
    [weiboShareButon setImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
    [weiboShareButon setImage:[UIImage imageNamed:@"weibo_highlighted"] forState:UIControlStateHighlighted];
    [self addSubview:weiboShareButon];
    self.weiboShareButon = weiboShareButon;
    
    UIButton *weixinShareButon = [[UIButton alloc]init];
    [weixinShareButon setImage:[UIImage imageNamed:@"wechat"] forState:UIControlStateNormal];
    [weixinShareButon setImage:[UIImage imageNamed:@"wechat_highlighted"] forState:UIControlStateHighlighted];
    [self addSubview:weixinShareButon];
    self.weixinShareButon = weixinShareButon;
    
}

#pragma mark
#pragma mark 设置控件frame
-(void)layoutSubviews{
    [super layoutSubviews];
    
    //推荐按钮
    CGFloat rcBtnX = MARGIN;
    CGFloat rcBtnY = MARGIN;
    CGFloat rcBtnW = 50;
    CGFloat rcBtnH = 30;
    self.recommendButton.frame = CGRectMake(rcBtnX, rcBtnY, rcBtnW, rcBtnH);
    
    //推荐人1
    CGFloat onePerBtnX = CGRectGetMaxX(self.recommendButton.frame) + PADDING;
    CGFloat onePerBtnY = rcBtnY;
    CGFloat onePerBtnW = BTWIDTH;
    CGFloat onePerBtnH = onePerBtnW;
    self.oneRecommenderButon.frame = CGRectMake(onePerBtnX, onePerBtnY, onePerBtnW, onePerBtnH);
    
    //推荐人2
    CGFloat twoPerBtnX = CGRectGetMaxX(self.oneRecommenderButon.frame) + PADDING;
    CGFloat twoPerBtnY = rcBtnY;
    CGFloat twoPerBtnW = BTWIDTH;
    CGFloat twoPerBtnH = twoPerBtnW;
    self.twoRecommenderButon.frame = CGRectMake(twoPerBtnX, twoPerBtnY, twoPerBtnW, twoPerBtnH);
    
    //推荐人3
    CGFloat threePerBtnX = CGRectGetMaxX(self.twoRecommenderButon.frame) + PADDING;
    CGFloat threePerBtnY = rcBtnY;
    CGFloat threePerBtnW = BTWIDTH;
    CGFloat threePerBtnH = threePerBtnW;
    self.threeRecommenderButon.frame = CGRectMake(threePerBtnX, threePerBtnY, threePerBtnW, threePerBtnH);
    
    //推荐人...
    CGFloat othersPerBtnX = CGRectGetMaxX(self.threeRecommenderButon.frame) + PADDING;
    CGFloat othersPerBtnY = rcBtnY;
    CGFloat othersPerBtnW = BTWIDTH;
    CGFloat othersPerBtnH = othersPerBtnW;
    self.othersRecommenderButon.frame = CGRectMake(othersPerBtnX, othersPerBtnY, othersPerBtnW, othersPerBtnH);
    
    //微信
    CGFloat weixinBtnW = BTWIDTH;
    CGFloat weixinBtnH = weixinBtnW;
    CGFloat weixinBtnX = self.frame.size.width - MARGIN - weixinBtnW;
    CGFloat weixinBtnY = rcBtnY;
    self.weixinShareButon.frame = CGRectMake(weixinBtnX, weixinBtnY, weixinBtnW, weixinBtnH);
    
    
    //微博
    CGFloat weiboBtnW = BTWIDTH;
    CGFloat weiboBtnH = weiboBtnW;
    CGFloat weiboBtnX = CGRectGetMinX(self.weixinShareButon.frame) - MARGIN - weiboBtnW;
    CGFloat weiboBtnY = rcBtnY;
    self.weiboShareButon.frame = CGRectMake(weiboBtnX, weiboBtnY, weixinBtnW, weiboBtnH);
}

-(CGFloat)heightForRecommendView{
    return CGRectGetMaxY(self.recommendButton.frame) + MARGIN;
}

-(void)setRecommendAccounts:(NSMutableArray *)recommendAccounts{
    _recommendAccounts = recommendAccounts;
    long count = recommendAccounts.count;
    if (count > 0) {
        for (long i = 0; i < count; i++) {
            GWAccount *account = recommendAccounts[i];
            if (i == 0) {
                [self.oneRecommenderButon setImageWithURL:[NSURL URLWithString:account.avatar] forState:UIControlStateNormal];
            }else if (i == 1){
                [self.twoRecommenderButon setImageWithURL:[NSURL URLWithString:account.avatar] forState:UIControlStateNormal];
            }else if (i == 2){
                [self.threeRecommenderButon setImageWithURL:[NSURL URLWithString:account.avatar] forState:UIControlStateNormal];
            }else{
                break;
            }
        }
    }
    //显示其他评论者
    if (count < 3) {
        [self.othersRecommenderButon removeFromSuperview];
    }
}

@end
