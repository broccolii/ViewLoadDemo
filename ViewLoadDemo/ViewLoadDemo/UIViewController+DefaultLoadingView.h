//
//  UIViewController+DefaultLoadingView.h
//  ViewLoadDemo
//
//  Created by Broccoli on 2016/11/28.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DefaultLoadingView)

@property (nonatomic, strong) UIView *defaultLoadingView;

- (void)yz_beginDefaultLoading;
- (void)yz_stopDefaultLoading;

@end
