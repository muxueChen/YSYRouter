//
//  YSYTabAViewController.m
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/19.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import "YSYTabAViewController.h"
#import "BService.h"

@interface YSYTabAViewController ()

@end

@implementation YSYTabAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"标签2";
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.center = self.view.center;
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"b首页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)goHome {
    
    id<BServiceProtocol>bservice = (id<BServiceProtocol>)[YSYRouterServiceManager callUrl:@"bsd://xxyp/B"];
    // 传入的参数
    bservice.routerParameter = nil;
    // 回调
    bservice.routerCallBack = ^(id response) {
        
    };
    // 执行方法一
    [bservice getUserInfo:nil];
    
    // 传入的参数
    bservice.routerParameter = @{ @"name":@"xxx",
                                  @"icon":@"xxx" };
    // 回调
    bservice.routerCallBack = ^(id response) {
        
    };
    // 执行方法二
    UIViewController *vc = [bservice home:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
