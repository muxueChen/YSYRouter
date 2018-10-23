//
//  URLModel.h
//  WKWebViewTest
//
//  Created by 暮雪 on 2018/8/3.
//  Copyright © 2018年 暮雪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MXCommonProtocols.h"

/** 跳转方式类型 */
typedef NS_ENUM(NSUInteger, JumpType) {
    //压栈跳转
    JumpType_Push    = 0,
    //回退
    JumpType_Pop     = 1,
    //回退到首页
    JumpType_PopToRoot   = 2,
    //模态跳转
    JumpType_Present    = 3,
};

/** URL 的路由类型 */
typedef NS_ENUM(NSUInteger, URLRouteType) {
    //网页
    URLRouteTypeWebView,
    //原生组件
    URLRouteTypeNative
};

//URL解析器 模型
@interface MXURLModel : NSObject
@property (nonatomic, copy) NSString *url;
//页面路径
@property (nonatomic, copy) NSString *route;
//url后面拼接的所有参数
@property (nonatomic, strong) NSMutableDictionary *parameters;
//跳转类型
@property (nonatomic, assign) JumpType type;
//URL别名 用于界面回退
@property (nonatomic, copy) NSString *anotherName;
//路由类型
@property (nonatomic, assign) URLRouteType routeType;
@property (nonatomic, copy) MXCallBack callBack;
+ (MXURLModel *)resolver:(NSString *)url;
@end
