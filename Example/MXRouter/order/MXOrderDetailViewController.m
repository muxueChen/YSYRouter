//
//  MXOrderDetailViewController.m
//  MXRouter_Example
//
//  Created by muxue on 2018/10/24.
//  Copyright © 2018年 暮雪. All rights reserved.
//

#import "MXOrderDetailViewController.h"

@interface MXOrderDetailViewController ()

@end

@implementation MXOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    self.view.backgroundColor = UIColor.whiteColor;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.callBack) {
        self.callBack([NSString stringWithFormat:@"我回来了%@",self.class]);
    }
    [[MXPageManger shareInstance] routerWithUrl:@"router://www.muxue.com?JumpType=pop"];
}

@end
