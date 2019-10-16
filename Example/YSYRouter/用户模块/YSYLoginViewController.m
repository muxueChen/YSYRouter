//
//  YSYLoginViewController.m
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/18.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import "YSYLoginViewController.h"

@interface YSYLoginViewController ()

@end

@implementation YSYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.center = self.view.center;
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"回首页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)goHome {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
