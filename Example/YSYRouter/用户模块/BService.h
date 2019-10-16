//
//  BService.h
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/14.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YSYRouterServiceManager.h>

// 组件名称：bsd://xxyp/B
@protocol BServiceProtocol <YSYComponentInterfaceProtocol>

/**
 * 获取用户信息
 * [YSYRouterServiceManager openUrlString:@"bsd://xxyp/B/getUserInfo" parameter:nil callBack:^(id response) {
        //异步回调结果
        NSLog(@">>>>%@",response);
    }];
 * parameter: nil
 * routerCallBack 异步回调：{ "name":"xxx",
                            "userId":"xxx",
                            "token":"xxx",
                            "icon":"xxx" }
 */
- (void)getUserInfo:(NSDictionary *)parameter;

/**
 * 去组件首页
 * [YSYRouterServiceManager openUrl:[NSURL URLWithString:@"bsd://xxyp/B/home"]]
 * parameter: { "name":"xxx",
                "icon":"xxx" }
 * 跳转方式为 push
 */
- (UIViewController *)home:(NSDictionary *)parameter;

/**
 * 去登录
 * [YSYRouterServiceManager openUrl:[NSURL URLWithString:@"bsd://xxyp/B/login"]]
 * parameter: nil
 * 跳转方式为 present
 */
- (UINavigationController *)login:(NSDictionary *)parmeter;

@end

 
