//
//  YSYViewController.m
//  YSYRouter
//
//  Created by muxueChen on 03/11/2019.
//  Copyright (c) 2019 muxueChen. All rights reserved.
//

#import "YSYViewController.h"
#import "YSYRouterServiceManager.h"
//路由模型
@interface YSYRouterModel : NSObject
@property (nonatomic, copy) NSString *router;
@property (nonatomic, copy) NSString *descried;
@end

@implementation YSYRouterModel

@end

// 路由分组模型
@interface YSYRouterGroupModel : NSObject
@property (nonatomic, copy) NSString *groupName;
@property (nonatomic, strong) NSArray <YSYRouterModel *>*array;
@end

@implementation YSYRouterGroupModel

+ (NSArray<YSYRouterGroupModel*>*)allRouterGroupModel {
    
    // webview页面跳转schema定义
    YSYRouterGroupModel *group1 = [YSYRouterGroupModel new];
    group1.groupName = @"webview页面跳转schema定义";
    
    // 目前还没有处理这个组件
    YSYRouterModel *router1 = [YSYRouterModel new];
    router1.router = @"bsdlk://www.xiaoxiang.com?i=1&j=3";
    router1.descried = @"bsdlk协议,app捕获到后替换为http协议，跳转新页面加载webview，0不需要拼接 1需要拼接";
    
    // 目前还没有这个处理组件
    YSYRouterModel *router2 = [YSYRouterModel new];
    router2.router = @"bsdlks://www.xiaoxiang.com?i=1&j=3";
    router2.descried = @"bsdlks协议,app捕获到后替换为https协议，跳转新页面加载webview，0不需要拼接 1需要拼接";
    group1.array = @[router1, router2];
    
    // 小象优品h5调用app指令,以 “bsd://”开头
    YSYRouterGroupModel *group2 = [YSYRouterGroupModel new];
    group2.groupName = @"小象优品h5调用app指令，bsd:// 开头";
    
    // 商品详情
    YSYRouterModel *router3 = [YSYRouterModel new];
    router3.router = @"bsd://goodDetail?goodId=xxx&goodsSource=xxx";
    router3.descried = @"商品详情";
    
    YSYRouterModel *router4 = [YSYRouterModel new];
    router4.router = @"bsd://xxyp/goods/yhh?i=2";
    router4.descried = @"有好货";
    YSYRouterModel *router44 = [YSYRouterModel new];
    router44.router = @"bsd://xxyp/goods/yhh2";
    router44.descried = @"有好货2";
    group2.array = @[router3, router4,router44];
    
    // 基础实例
    YSYRouterGroupModel *group3 = [YSYRouterGroupModel new];
    group3.groupName = @"基础用法示例";
    
    // 示例1 去到 B 组件的 首页
    YSYRouterModel *router5 = [YSYRouterModel new];
    router5.router = @"bsd://xxyp/B/home";
    router5.descried = @"push 到 用户 组件的首页";
    
    // 模态到 B 组件的 登录
    YSYRouterModel *router6 = [YSYRouterModel new];
    router6.router = @"bsd://xxyp/B/login";
    router6.descried = @"模态到 用户 组件的首页";
    
    // 获取 B 组件的异步回调数据
    YSYRouterModel *router7 = [YSYRouterModel new];
    router7.router = @"bsd://xxyp/B/getUserInfo?a=1";
    router7.descried = @"异步回调";
    
    // 去标签1
    YSYRouterModel *router8 = [YSYRouterModel new];
    router8.router = @"bsd://xxyp/home/tab2";
    router8.descried = @"标签2";
    
    // 错误示范1
    YSYRouterModel *router9 = [YSYRouterModel new];
    router9.router = @"bsd://xxyp/SB/SB?SB=BBD";
    router9.descried = @"模拟路由失败";
    
    // 错误示范2
    YSYRouterModel *router10 = [YSYRouterModel new];
    router10.router = @"bsd://xxyp/home/tab3";
    router10.descried = @"模拟路由失败";
    
    group3.array = @[router5, router6, router7, router8, router9, router10];
    
    return @[group1, group2, group3];
}
@end

@interface YSYCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@end

@implementation YSYCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
        [self.contentView addSubview:self.titleLabel];
        
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, 30)];
        self.detailLabel.numberOfLines = 0;
        [self.contentView addSubview:self.detailLabel];
    }
    return self;
}

@end

static NSString *YSYCellID  = @"YSYCellID";
@interface YSYViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSArray <YSYRouterGroupModel*>*dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation YSYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"主工程";
    [self.view addSubview:self.tableView];
}
- (NSArray<YSYRouterGroupModel *> *)dataSource {
    if (!_dataSource) {
        _dataSource = [YSYRouterGroupModel allRouterGroupModel];
    }
    return _dataSource;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 60;
        [_tableView registerClass:YSYCell.class forCellReuseIdentifier:YSYCellID];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YSYCell *cell = [tableView dequeueReusableCellWithIdentifier:YSYCellID];
    YSYRouterModel *model = self.dataSource[indexPath.section].array[indexPath.row];
    cell.titleLabel.text = model.router;
    cell.textLabel.font = [UIFont systemFontOfSize:10];
    cell.detailLabel.text = model.descried;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YSYRouterModel *model = self.dataSource[indexPath.section].array[indexPath.row];
    [YSYRouterServiceManager openUrlString:model.router parameter:nil callBack:^(id response) {
        //异步回调
        NSLog(@">>>>%@",response);
    }];
}
@end
