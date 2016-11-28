//
//  YZNetworkErrorView.h
//  ViewLoadDemo
//
//  Created by Broccoli on 2016/11/28.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RetryAction)();

@interface YZNetworkErrorView : UIView

+ (instancetype)networkErrorViewWithrRetryAction:(RetryAction)retryAction;

@end
