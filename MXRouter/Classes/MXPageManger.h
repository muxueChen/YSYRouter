//
//  MXPageManger.h
//  TangShanXing
//
//  Created by muxue on 2018/9/4.
//  Copyright © 2018年 muxue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MXCommonProtocols.h"

/** 全局页面跳转调度器 */
@interface MXPageManger : NSObject

/** 单例对象 */
+ (instancetype)shareInstance;

/** 获取根控制器 */
- (UIViewController *)rootViewController;

/** 当前控制器 */
- (UIViewController *)currentViewController;

/** 发起路由跳转
 * url 路由地址
 */
- (void)routerWithUrl:(NSString *)url;

/** 发起路由跳转
 * url 路由地址
 * callBack 页面回调
 */
- (void)routerWithUrl:(NSString *)url
             callBack:(MXCallBack)callBack;

/** 发起路由跳转
 * url 路由地址
 * parameter 需要传递给目标页面对象的参数
 */
- (void)routerWithUrl:(NSString *)url
            parameter:(NSDictionary *)parameter;

/** 发起路由跳转
 * url 路由地址
 * parameter 需要传递给目标页面对象的参数
 * callBack 页面回调
 */
- (void)routerWithUrl:(NSString *)url
            parameter:(NSDictionary *)parameter
             callBack:(MXCallBack)callBack;
@end
