//
//  MXPayService.m
//  MXRouter_Example
//
//  Created by muxue on 2018/10/24.
//  Copyright © 2018年 暮雪. All rights reserved.
//

#import "MXPayService.h"
#import "MXPayViewController.h"
@implementation MXPayService

+ (UIViewController *)viewControllerWithParameter:(NSDictionary *)parameter
                                         callBack:(MXCallBack)callback {
    MXPayViewController *payViewController = [[MXPayViewController alloc] init];
    //其他初始化Pay的操作。。。
    
    return payViewController;
}
@end
