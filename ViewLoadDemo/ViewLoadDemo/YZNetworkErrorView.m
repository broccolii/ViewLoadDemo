//
//  YZNetworkErrorView.m
//  ViewLoadDemo
//
//  Created by Broccoli on 2016/11/28.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "YZNetworkErrorView.h"
#import "Masonry.h"

@interface YZNetworkErrorView ()

@property (nonatomic, strong) UIButton *retryButton;
@property (nonatomic, copy) RetryAction retryAction;

@end

@implementation YZNetworkErrorView

+ (instancetype)networkErrorViewWithrRetryAction:(RetryAction)retryAction {
    NSAssert(retryAction != nil, @"retryAction is nil");
    YZNetworkErrorView *networkErrorView = [[YZNetworkErrorView alloc] initWithRetryAction:retryAction];
    return networkErrorView;
}

- (instancetype)initWithRetryAction:(RetryAction)retryAction {
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.retryAction = retryAction;
        
        UIButton *retryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        retryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        retryButton.layer.borderWidth = 1.0;
        retryButton.layer.cornerRadius = 2.0;
        retryButton.layer.borderColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0].CGColor;
        retryButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [retryButton setTitle:@"点击重试" forState:UIControlStateNormal];
        [retryButton setTitleColor:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0] forState:UIControlStateNormal];
        [retryButton addTarget:self action:@selector(retryButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:retryButton];
        [retryButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(100, 24));
        }];
    }
    return self;
}

- (void)retryButtonAction {
    if (self.retryAction) {
        self.retryAction();
        [self removeFromSuperview];
    }
}


@end
