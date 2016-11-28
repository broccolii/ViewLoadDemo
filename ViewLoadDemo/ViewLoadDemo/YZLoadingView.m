//
//  YZLoadingView.m
//  ViewLoadDemo
//
//  Created by Broccoli on 2016/11/28.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "YZLoadingView.h"
#import "Masonry.h"

@implementation YZLoadingView

+ (instancetype)loadingView {
    YZLoadingView *loadingView = [[YZLoadingView alloc] init];
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicatorView.center = loadingView.center;
    [activityIndicatorView startAnimating];
    [loadingView addSubview:activityIndicatorView];
    loadingView.backgroundColor = [UIColor whiteColor];
    [activityIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(loadingView);
//        make.size.mas_equalTo(loadingView.bounds);
    }];
    return loadingView;
}

@end
