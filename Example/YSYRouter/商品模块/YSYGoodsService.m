//
//  YSYGoodsService.m
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/19.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import "YSYGoodsService.h"
#import "YSYYHHViewController.h"
@interface YSYGoodsService : NSObject
// 参数
@property (nonatomic, strong) id routerParameter;
// 组件回调块
@property (nonatomic, copy) YSYCallBack routerCallBack;
@end

@implementation YSYGoodsService

+ (void)load {
    [YSYRouterServiceManager registerModuleWithUrl:@"bsd://xxyp/goods" moduleClass:self];
}

- (UIViewController *)yhh:(NSDictionary *)parameter {
    return [[YSYYHHViewController alloc] init];
}
@end
