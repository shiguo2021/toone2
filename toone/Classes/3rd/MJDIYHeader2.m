//
//  MJDIYHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/13.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "MJDIYHeader2.h"

@interface MJDIYHeader2()
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UISwitch *s;
@property (weak, nonatomic) UIImageView *logo;
@property (weak, nonatomic) UIActivityIndicatorView *loading;


@property (nonatomic,strong  )  UIWebView *     web;
@end

@implementation MJDIYHeader2
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
    label.font = [UIFont boldSystemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.label = label;
    
    // 打酱油的开关
//    UISwitch *s = [[UISwitch alloc] init];
//    [self addSubview:s];
//    self.s = s;
    
    // logo
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
//    self.logo = logo;
    
    // loading
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [loading setColor:[UIColor blackColor]];
    [self addSubview:loading];
    self.loading = loading;
    
//    UIWebView * web = [[UIWebView alloc] init];
//    web.bounds = CGRectMake(0, 0, 30, 30);
//    NSData *data = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"ji" ofType:@"gif"]];
//    
//    web.scrollView.scrollEnabled = NO;
//    [web loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
//    [self addSubview:web];
//    
//    self.web = web;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];

    self.label.frame = self.bounds;
    
    self.logo.bounds = CGRectMake(0, 0, self.bounds.size.width, 100);
    self.logo.center = CGPointMake(self.mj_w * 0.5, - self.logo.mj_h + 20);
    
    self.loading.center = CGPointMake(self.mj_w/2-50, self.mj_h * 0.5);
//    self.web.center = CGPointMake(self.mj_w*0.5, self.mj_h*0.5);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];

}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];

}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;

    switch (state) {
        case MJRefreshStateIdle:
            [self.loading stopAnimating];
            [self.s setOn:NO animated:YES];
            self.label.text = @"刷新成功";
            break;
        case MJRefreshStatePulling:
            [self.loading stopAnimating];
            [self.s setOn:YES animated:YES];
            self.label.text = @"刷新数据";
            break;
        case MJRefreshStateRefreshing:
            [self.s setOn:YES animated:YES];
            self.label.text = @"正在加载";
            [self.loading startAnimating];
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    // 1.0 0.5 0.0
    // 0.5 0.0 0.5
//    CGFloat red = 1.0 - pullingPercent * 0.5;
//    CGFloat green = 0.5 - 0.5 * pullingPercent;
//    CGFloat blue = 0.5 * pullingPercent;
//    self.label.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.label.textColor = [UIColor lightGrayColor];
}

@end
