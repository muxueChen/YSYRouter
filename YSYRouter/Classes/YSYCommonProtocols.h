//
//  YSYCommonProtocols.h
//  TangShanXing
//
//  Created by muxue on 2018/9/5.
//  Copyright © 2018年 muxue. All rights reserved.
//
#import <UIKit/UIKit.h>

/** 组件返回类容类型 */
typedef void(^YSYCallBack)(id response);
typedef NSString * YSYJSFunction;

/**
 * 组件服务协议
 * 单个组件若对其他组件开放接口，必须遵循此协议
 */
@protocol YSYComponentInterfaceProtocol <NSObject>
// 参数
@property (nonatomic, strong) id routerParameter;
// 组件回调块
@property (nonatomic, copy) YSYCallBack routerCallBack;

@end

/** webview 组件 */
@protocol YSYWebViewControllerProtocol <YSYComponentInterfaceProtocol>
/** 页面的webView */
- (UIView *)webView;

/** 提供外部调用js方法 */
- (void)evaluateJavaScript:(YSYJSFunction)function
         completionHandler:(YSYCallBack)callback;
@end


