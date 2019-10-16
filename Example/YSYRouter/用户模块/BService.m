//
//  BService.m
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/14.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import "BService.h"
#import "BViewController.h"
#import "YSYViewController.h"
#import <YSYRouterServiceManager.h>
#import "YSYLoginViewController.h"

@interface BService : NSObject <BServiceProtocol>
// 参数
@property (nonatomic, strong) id routerParameter;
// 组件回调块
@property (nonatomic, copy) YSYCallBack routerCallBack;
@end

@implementation BService

+ (void)load {
    [YSYRouterServiceManager registerModuleWithUrl:@"bsd://xxyp/B" moduleClass:self];
}

/** 模仿异步请求 */
- (void)getUserInfo:(NSDictionary *)parameter {
    
    YSYCallBack callBack = ((NSObject *)(self.routerCallBack)).copy;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (callBack) {
            callBack(@{@"name":@"xiaoming---hahahah"});
        }
    });
}

- (UIViewController *)home:(NSDictionary *)parameter {
    
    return [[BViewController alloc] init];
}

- (UINavigationController *)login:(NSDictionary *)parmeter {
    return [[UINavigationController alloc] initWithRootViewController:[[YSYLoginViewController alloc] init]];
}
@end
