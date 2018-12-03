//
//  MXRouterServiceManager.m
//  FBSnapshotTestCase
//
//  Created by muxue on 2018/12/3.
//

#import "MXRouterServiceManager.h"
#import "MXURLModel.h"
@implementation MXRouterServiceManager

/** 发出请求
 * 接收请求目标组件 url 路由地址
 */
- (void)requestWithUrl:(NSString *)url {
    [self requestWithUrl:url callBack:nil];
}

/** 发出请求
 * 接收请求目标组件 url 路由地址
 * callBack 页面回调
 */
- (void)requestWithUrl:(NSString *)url
              callBack:(MXCallBack)callBack {
    [self requestWithUrl:url parameter:nil callBack:callBack];
}

/** 发出请求
 * 接收请求目标组件 url 路由地址
 * parameter 需要传递给目标页面对象的参数
 */
- (void)requestWithUrl:(NSString *)url
             parameter:(NSDictionary *)parameter {
    [self requestWithUrl:url parameter:parameter callBack:nil];
}

/** 发出请求
 * 接收请求目标组件 url 路由地址
 * parameter 需要传递给目标页面对象的参数
 * callBack 页面回调
 */
- (void)requestWithUrl:(NSString *)url
             parameter:(NSDictionary *)parameter
              callBack:(MXCallBack)callBack {
    //解析url
    MXURLModel *model = [MXURLModel resolver:url];
    [model.parameters addEntriesFromDictionary:parameter];
    //发起请求
    
}
@end
