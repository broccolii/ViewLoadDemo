//
//  UIViewController+DefaultLoadingView.m
//  ViewLoadDemo
//
//  Created by Broccoli on 2016/11/28.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "UIViewController+DefaultLoadingView.h"
#import <objc/runtime.h>
#import "Masonry.h"

@implementation UIViewController (DefaultLoadingView)

- (UIView *)defaultLoadingView {
    return objc_getAssociatedObject(self, @selector(defaultLoadingView));
}

- (void)setDefaultLoadingView:(UIView *)defaultLoadingView {
    objc_setAssociatedObject(self, @selector(defaultLoadingView), defaultLoadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)yz_beginDefaultLoading {
    NSAssert(self.defaultLoadingView != nil, @"defaultLoadingView is nil");
    [self.view addSubview:self.defaultLoadingView];
    
    [self.defaultLoadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
    }];
}

- (void)yz_stopDefaultLoading {
    [self.defaultLoadingView removeFromSuperview];
}

@end
