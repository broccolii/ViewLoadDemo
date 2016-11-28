//
//  ViewController.m
//  ViewLoadDemo
//
//  Created by Broccoli on 2016/11/28.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+DefaultLoadingView.h"
#import "UIViewController+NetworkErrorView.h"

#import "YZLoadingView.h"
#import "YZNetworkErrorView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (strong, nonatomic) IBOutlet UISwitch *isSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.defaultLoadingView = [YZLoadingView loadingView];
    self.networkErrorView = [YZNetworkErrorView networkErrorViewWithrRetryAction:^{
        // retry nerwork
        [self yz_beginDefaultLoading];
        [self getData];
    }];
    [self yz_beginDefaultLoading];
    
    [self getData];
}

- (void)getData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self yz_stopDefaultLoading];
        
        if (self.isSwitch.isOn) {
            [self yz_showNetworkErrorView];
        } else {
            self.dataSource = [@[@"",@"",@"",@"",@"",@"",@""] mutableCopy];
            [self.tableView reloadData];
        }
    });
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ViewLoadDemoCell" forIndexPath:indexPath];
    
    UILabel *label = [cell viewWithTag:1001];
    label.text = [NSString stringWithFormat:@"第%ld行", (long)indexPath.row];
    
    return cell;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [@[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""] mutableCopy];
    }
    return _dataSource;
}
@end
