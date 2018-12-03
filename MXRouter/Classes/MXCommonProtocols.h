//
//  MXBaseWebProtocol.h
//  TangShanXing
//
//  Created by muxue on 2018/9/5.
//  Copyright © 2018年 muxue. All rights reserved.
//
#import <UIKit/UIKit.h>

/** 组件返回类容类型 */
typedef void(^MXCallBack)(id response);

/** 字符Block */
typedef void(^MXStringBlock)(NSString *response);

/** 整型Block */
typedef void(^MXIntergerBlock)(NSInteger response);

/** 字典类型Block */
typedef void(^MXDictionarBlock)(NSDictionary *response);

/** 数组类型Block */
typedef void(^MXArrayBlock)(NSArray *response);

//
typedef NSString * MXJSFunction;

/** 普通控制器组件路由协议 */
@protocol MXViewControlleProtocol <NSObject>

/** 页面别名，用于H5页面回退查找 */
@optional
@property (nonatomic, copy) NSString *anotherName;

/** 外部参数 */
@optional
@property (nonatomic, strong) NSDictionary *parameter;

/** 组件回调 */
@optional
@property (nonatomic, copy) void (^callBack)(id parameter);

/** 初始化并返回一个页面,遵守本协议，并实现这个方法，任何一个类都可以作为路由的目标类 */
@optional
+ (UIViewController *)viewControllerWithParameter:(NSDictionary *)parameter
                                         callBack:(MXCallBack)callback;
@end

/** webview控制器 */
@protocol MXWebViewControllerProtocol <MXViewControlleProtocol>

/** 页面的webView */
- (UIView *)webView;

/** 提供外部调用js方法 */
- (void)evaluateJavaScript:(MXJSFunction)function
         completionHandler:(MXCallBack)callback;
@end

/** 组件服务协议 */
@protocol MXComponentProtocol <NSObject>
@required
/** 发出请求
 * 接收请求目标组件 url 路由地址
 * parameter 需要传递给目标页面对象的参数
 * callBack 页面回调
 */
- (void)requestWithUrl:(NSString *)url
             parameter:(NSDictionary *)parameter
              callBack:(MXCallBack)callBack;
@end

