//
//  MXRouterServiceManager.m
//  FBSnapshotTestCase
//
//  Created by muxue on 2018/12/3.
//

#import "MXRouterServiceManager.h"
#import "MXURLModel.h"
#import "MXRoute.h"
@implementation MXRouterServiceManager

- (void)requestWithUrl:(NSString *)url {
    [self requestWithUrl:url callBack:nil];
}

- (void)requestWithUrl:(NSString *)url
              callBack:(MXCallBack)callBack {
    [self requestWithUrl:url parameter:nil callBack:callBack];
}

- (void)requestWithUrl:(NSString *)url
             parameter:(NSDictionary *)parameter {
    [self requestWithUrl:url parameter:parameter callBack:nil];
}

- (void)requestWithUrl:(NSString *)url
             parameter:(NSDictionary *)parameter
              callBack:(MXCallBack)callBack {
    //解析url
    MXURLModel *model = [MXURLModel resolver:url];
    [model.parameters addEntriesFromDictionary:parameter];
    //发起请求
    [[MXRoute share] requestWithRoute:url parameter:parameter callback:callBack];
}
@end
