//
//  URLModel.m
//  WKWebViewTest
//
//  Created by 暮雪 on 2018/8/3.
//  Copyright © 2018年 暮雪. All rights reserved.
//

#import "MXURLModel.h"

@implementation MXURLModel

+ (MXURLModel *)resolver:(NSString *)url {
    NSURL *routerUrl = [NSURL URLWithString:url];
    if (!url) {
        return nil;
    }
    MXURLModel *model = [[MXURLModel alloc]init];
    model.parameters = [self getUrlParameter:routerUrl];
    model.type = [self orderTypeWithString:model.parameters[@"JumpType"]];
    model.routeType = URLRouteTypeNative;
    model.url = url;
    model.route = [model.url componentsSeparatedByString:@"?"].firstObject;
    model.anotherName = model.route;
    if ([[routerUrl scheme] isEqualToString:@"http"] || [[routerUrl scheme] isEqualToString:@"https"]) {
        model.route = @"http://www.webview.com/webview";
        model.routeType = URLRouteTypeWebView;
    }
    return model;
}
//取url后拼接的参数
+ (NSMutableDictionary *)getUrlParameter:(NSURL *)url {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSArray *array = [url.query componentsSeparatedByString:@"&"];
    for (NSString *parameter in array) {
        NSArray *parameterItem = [parameter componentsSeparatedByString:@"="];
        if(parameterItem.count != 2) {
            continue;
        }
        dic[[parameterItem[0] stringByRemovingPercentEncoding]] = [parameterItem[1] stringByRemovingPercentEncoding];
    }
    return dic;
}
//跳转方式类型
+ (JumpType)orderTypeWithString:(NSString *)string {
    JumpType type = JumpType_Push;
    if ([string isEqualToString:@"open"]) {
        type = JumpType_Push;
    } else if ([string isEqualToString:@"goback"]) {
        type = JumpType_Pop;
    } else if ([string isEqualToString:@"home"]) {
        type = JumpType_PopToRoot;
    } else if ([string isEqualToString:@"present"]) {
        type = JumpType_Present;
    }
    return type;
}
@end
