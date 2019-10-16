//
//  BViewController.m
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/14.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"组件B";
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.center = self.view.center;
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"去标签1" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button1.center = CGPointMake(self.view.center.x, self.view.center.y + 150);
    button1.backgroundColor = UIColor.redColor;
    [button1 setTitle:@"去标签2" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(gotab2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)goHome {
    [YSYRouterServiceManager openUrlString:@"bsd://xxyp/home/home"];
}

- (void)gotab2 {
     [YSYRouterServiceManager openUrlString:@"bsd://xxyp/home/tab2"];
}
@end
