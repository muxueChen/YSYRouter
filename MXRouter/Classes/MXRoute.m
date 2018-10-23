//
//  MXRoute.m
//  TangShanXing
//
//  Created by muxue on 2018/9/27.
//  Copyright © 2018年 muxue. All rights reserved.
//

#import "MXRoute.h"
#import <objc/message.h>
#import <UIViewController+MXRouter.h>
@implementation MXRoute

static const NSString *MXRouteTableSource = @"RouteTable.json";
static MXRoute *router = nil;
+ (instancetype)share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!router) {
            router = [[MXRoute alloc] init];
        }
    });
    return router;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        //初始化路由表
        NSString *path = [[NSBundle mainBundle] pathForResource:MXRouteTableSource.copy
                                                         ofType:nil];
        NSAssert(path, @"老哥你的路由表 RouteTable.plist 去哪里了");
        NSData * jsonData = [[NSData alloc]initWithContentsOfFile:path];
        NSMutableDictionary *jsonDic;
        if(jsonData){
            jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                      options:NSJSONReadingMutableContainers
                                                        error:nil];
        }
        NSAssert(jsonDic, @"RouteTable.json 内容格式不对，请检查一下");
        _routeTable = jsonDic;
    }
    return self;
}
- (id)viewControllerWithRoute:(NSString *)route
                    parameter:(NSDictionary *)parameter
                     callback:(MXCallBack)callback {
    id iclass = [self getClassWhitRoute:route];
    //找不到页面就抛出404
    NSAssert(iclass, @"路由404");
    if (iclass == nil) {
        //去到404页面...
        return nil;
    }
    UIViewController *vc = nil;
    //
    SEL initSel = NSSelectorFromString(@"viewControllerWithParameter:callBack:");
    //便利构造器
    if ([iclass respondsToSelector:initSel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        //执行target对应的selector回调
        vc = [iclass performSelector:initSel
                          withObject:parameter
                          withObject:callback];
#pragma clang diagnostic pop
    } else {
        //配置参数。。。
        vc = [[(Class)iclass alloc]init];
        vc.parameter = parameter;
        vc.callBack = callback;
    }
    //返回组件。。。
    return vc;
}
- (Class)getClassWhitRoute:(NSString *)route {
    //获取模块名。。。
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:route];
    NSString *moduleName = [self moduleWithUrl:urlComponents.path];
    NSAssert(moduleName, @"路由不合法");
    if (!moduleName) {
        return nil;
    }
    Class iclass = [self classWithModuleName:moduleName
                                         url:route];
    //没有找到页面。。。
    return iclass;
}
- (Class)classWithModuleName:(NSString *)moduleName
                         url:(NSString *)route {
    //取出模块。。。
    NSDictionary *pages = self.routeTable[moduleName];
    return NSClassFromString(pages[route][@"iclass"]);
}
- (NSString *)moduleWithUrl:(NSString *)path {
    if (!path || path.length <= 0) {
        NSAssert(!path || path.length <= 0, @"这个URL有问题，没有路径");
        return nil;
    }
    NSArray *array = [path componentsSeparatedByString:@"/"];
    return array.count > 1?array[1]:nil;
}
@end
