//
//  YSYRouterServiceManager.h
//  FBSnapshotTestCase
//
//  Created by muxue on 2018/12/3.
//

#import <Foundation/Foundation.h>
#import "YSYCommonProtocols.h"

typedef NS_ENUM(NSUInteger, YSYRouterServiceJumpType) {
    YSYRouterServiceJumpTypePush,
    YSYRouterServiceJumpTypePresent
};

/** 获取视图最顶层的控制器 */
UIViewController *YSYGetTopViewController(void);

/** 组件服务管理器 */
@interface YSYRouterServiceManager : NSObject

/**
 * 注册组件
 */
+ (BOOL)registerModuleWithUrl:(NSString *)url moduleClass:(Class)objcClass;

/**
 * 注销组件
 */
+ (void)writeOffModuleWithUrl:(NSString *)url;

//-----------------------------------------------------跳转到页面------------------------
// url结构：scheme://host/module/action?a=1&b=2
/**
 * 其他应用打开本工程，此方法能直接打开目标组件的页面, 跳转方式默认为 YSYRouterServiceJumpTypePush
 * 如果目标组件返回的是 UINavigationController 类对象，则使用 present（模态）跳转方式
 * 如果目标返回结果是普通的 UIViewController 类则使用 push 方式打开目标页面
 */
+ (id<YSYComponentInterfaceProtocol>)openUrl:(NSURL *)url;

+ (id<YSYComponentInterfaceProtocol>)openUrlString:(NSString *)urlString;

+ (id<YSYComponentInterfaceProtocol>)openUrlString:(NSString *)urlString jumpType:(YSYRouterServiceJumpType)jumptype;

/**
 * 其他应用打开本工程，此方法能直接打开目标组件的页面, 跳转方式默认为 YSYRouterServiceJumpTypePush
 * 如果目标组件返回的是 UINavigationController 类对象，则使用 present（模态）跳转方式
 * 如果目标返回结果是普通的 UIViewController 类则使用 push 方式打开目标页面
 */
+ (id<YSYComponentInterfaceProtocol>)openUrl:(NSURL *)url
                                   parameter:(NSDictionary *)parameter
                                    callBack:(YSYCallBack)callBack;

+ (id<YSYComponentInterfaceProtocol>)openUrlString:(NSString *)urlString
                                         parameter:(NSDictionary *)parameter
                                          callBack:(YSYCallBack)callBack;

+ (id<YSYComponentInterfaceProtocol>)openUrlString:(NSString *)urlString
                                          jumpType:(YSYRouterServiceJumpType)jumptype
                                         parameter:(NSDictionary *)parameter
                                          callBack:(YSYCallBack)callBack;

//-----------------------------------------------------调用组件服务--------------------
/** 发出请求
 * 此方法不能直接打开页面
 * 接收请求目标组件 url 路由地址
 */
+ (id<YSYComponentInterfaceProtocol>)callUrl:(NSString *)url;

/** 发出请求
 * 接收请求目标组件 url 路由地址
 * callBack 页面回调
 */
+ (id<YSYComponentInterfaceProtocol>)callUrl:(NSString *)url callBack:(YSYCallBack)callBack;

/** 发出请求
 * 接收请求目标组件 url 路由地址
 * parameter 需要传递给目标页面对象的参数
 */
+ (id<YSYComponentInterfaceProtocol>)callUrl:(NSString *)url parameter:(NSDictionary *)parameter;

/** 发出请求
 * 接收请求目标组件 url 路由地址
 * parameter 需要传递给目标页面对象的参数
 * callBack 页面回调
 */
//+ (id<YSYComponentInterfaceProtocol>)callUrl:(NSString *)url parameter:(NSDictionary *)parameter callBack:(YSYCallBack)callBack;
@end

/** UIViewController 路由扩展类 */
@interface UIViewController (YSYRouter) <YSYComponentInterfaceProtocol>

@end

