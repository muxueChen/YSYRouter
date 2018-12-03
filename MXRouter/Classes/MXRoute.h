//
//  MXRoute.h
//  TangShanXing
//
//  Created by muxue on 2018/9/27.
//  Copyright © 2018年 muxue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MXCommonProtocols.h"

/** app路由管理 */
@interface MXRoute : NSObject

/** 路由表 */
@property (nonatomic, readonly) NSDictionary *routeTable;

/** 路由单例 */
+ (instancetype)share;

/** 通过路由获取一个class
 * route 路由地址
 */
- (Class)getClassWhitRoute:(NSString *)route;

/** 通过路由获得路由页面的实例对象
 * route 路由地址
 * parameter 参数
 * callback 回调
 */
- (id)viewControllerWithRoute:(NSString *)route
                    parameter:(NSDictionary *)parameter
                     callback:(MXCallBack)callback;

/** 通过路找到组件，并执行服务
 * route 路由地址
 * parameter 参数
 * callback 回调
 */
- (void)requestWithRoute:(NSString *)route
               parameter:(NSDictionary *)parameter
                callback:(MXCallBack)callback;
@end

