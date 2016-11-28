//
//  UIViewController+NetworkErrorView.m
//  ViewLoadDemo
//
//  Created by Broccoli on 2016/11/28.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "UIViewController+NetworkErrorView.h"
#import <objc/runtime.h>
#import "Masonry.h"

@implementation UIViewController (NetworkErrorView)

- (UIView *)networkErrorView {
    return objc_getAssociatedObject(self, @selector(networkErrorView));
}

- (void)setNetworkErrorView:(UIView *)networkErrorView {
    objc_setAssociatedObject(self, @selector(networkErrorView), networkErrorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)yz_showNetworkErrorView {
    NSAssert(self.networkErrorView != nil, @"defaultLoadingView is nil");
    [self.view addSubview:self.networkErrorView];
    
    [self.networkErrorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
    }];
}

@end
