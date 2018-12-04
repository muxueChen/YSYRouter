//
//  MXRouterServiceManager.h
//  FBSnapshotTestCase
//
//  Created by muxue on 2018/12/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MXCommonProtocols.h"

/** 组件服务管理器 */
@interface MXRouterServiceManager : NSObject

/** 发出请求
 * 接收请求目标组件 url 路由地址
 */
- (void)requestWithUrl:(NSString *)url;

/** 发出请求
 * 接收请求目标组件 url 路由地址
 * callBack 页面回调
 */
- (void)requestWithUrl:(NSString *)url
             callBack:(MXCallBack)callBack;

/** 发出请求
 * 接收请求目标组件 url 路由地址
 * parameter 需要传递给目标页面对象的参数
 */
- (void)requestWithUrl:(NSString *)url
            parameter:(NSDictionary *)parameter;

/** 发出请求
 * 接收请求目标组件 url 路由地址
 * parameter 需要传递给目标页面对象的参数
 * callBack 页面回调
 */
- (void)requestWithUrl:(NSString *)url
            parameter:(NSDictionary *)parameter
             callBack:(MXCallBack)callBack;
@end

