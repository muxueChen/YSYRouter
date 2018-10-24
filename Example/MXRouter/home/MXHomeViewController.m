//
//  MXHomeViewController.m
//  MXRouter_Example
//
//  Created by muxue on 2018/10/24.
//  Copyright © 2018年 暮雪. All rights reserved.
//

#import "MXHomeViewController.h"

@interface MXHomeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tableView];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"HomeCellID"];
    }
    return _tableView;
}
- (NSArray *)dataSource {
    if (!_dataSource) {
        //JumpType 跳转方式 默认为 push， 值有四种，分别为 push、present、pop、home
        _dataSource = @[@{@"title":@"订单列表", @"router":@"router://www.muxue.com/order/orderlist?JumpType=push"},
                        @{@"title":@"订单详情", @"router":@"router://www.muxue.com/order/detail?JumpType=present"},
                        @{@"title":@"支付中心", @"router":@"router://www.muxue.com/SDK/pay"},
                        @{@"title":@"打开网页", @"router":@"router://www.webview.com/webview"}
                        ];
    }
    return _dataSource;
}
#pragma mark ----tableviewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCellID"];
    NSDictionary *dic = self.dataSource[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.dataSource[indexPath.row];
    [[MXPageManger shareInstance] routerWithUrl:dic[@"router"]
                                      parameter:@{@"content":@"我是传递过来的内容"}
                                       callBack:^(id response) {
        NSLog(@"这个是回调：%@",response);
    }];
}
@end
