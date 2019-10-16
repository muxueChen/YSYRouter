//
//  YSYGoodsService.m
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/19.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import "YSYGoodsService2.h"
#import "YSYYHHViewController.h"
@interface YSYGoodsService2 : NSObject
// 参数
@property (nonatomic, strong) id routerParameter;
// 组件回调块
@property (nonatomic, copy) YSYCallBack routerCallBack;
@end

@implementation YSYGoodsService2

+ (void)load {
    [YSYRouterServiceManager registerModuleWithUrl:@"bsd://xxyp/goods" moduleClass:self];
}

- (UIViewController *)yhh2:(NSDictionary *)parameter {
    return [[YSYYHHViewController alloc] init];
}
@end
