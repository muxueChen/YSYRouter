//
//  YSYGoodDetailViewController.m
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/19.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import "YSYGoodDetailViewController.h"

@interface YSYGoodDetailViewController ()

@end

@implementation YSYGoodDetailViewController

+ (void)load {
    [YSYRouterServiceManager registerModuleWithUrl:@"bsd://goodDetail" moduleClass:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"商品详情";
}

@end
