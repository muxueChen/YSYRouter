//
//  YSYHomeService.m
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/19.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import "YSYHomeService.h"

#define YSYRootViewController [UIApplication sharedApplication].keyWindow.rootViewController

@interface YSYHomeService : NSObject
// 参数
@property (nonatomic, strong) id routerParameter;
// 组件回调块
@property (nonatomic, copy) YSYCallBack routerCallBack;

@end

@implementation YSYHomeService

+ (void)load {
    [YSYRouterServiceManager registerModuleWithUrl:@"bsd://xxyp/home" moduleClass:self];
}

//
- (void)home:(NSDictionary *)parameter {
    [self tab1:parameter];
}

//
- (void)tab1:(NSDictionary *)parameter {
    [YSYRootViewController.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    
    if ([YSYRootViewController isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBar = (UITabBarController *)YSYRootViewController;
        if (tabBar.viewControllers.count > 0) {
            UIViewController *viewController = tabBar.viewControllers[tabBar.selectedIndex];
            if ([viewController isKindOfClass:UINavigationController.class]) {
                [(UINavigationController *)viewController popToRootViewControllerAnimated:NO];
            }
            if (tabBar.viewControllers.count > 0) {
                tabBar.selectedIndex = 0;
            }
        }
    } else if ([YSYRootViewController isKindOfClass:UINavigationController.class]) {
        [(UINavigationController *)YSYRootViewController popToRootViewControllerAnimated:YES];
    }
}

//
- (void)tab2:(NSDictionary *)parameter {
    [YSYRootViewController.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    if ([YSYRootViewController isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBar = (UITabBarController *)YSYRootViewController;
        if (tabBar.viewControllers.count > 0) {
            UIViewController *viewController = tabBar.viewControllers[tabBar.selectedIndex];
            if ([viewController isKindOfClass:UINavigationController.class]) {
                [(UINavigationController *)viewController popToRootViewControllerAnimated:NO];
            }
            if (tabBar.viewControllers.count > 1) {
                tabBar.selectedIndex = 1;
            }
        }
    } else if ([YSYRootViewController isKindOfClass:UINavigationController.class]) {
        [(UINavigationController *)YSYRootViewController popToRootViewControllerAnimated:YES];
    }
}
@end
