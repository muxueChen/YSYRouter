//
//  MXPageManger.m
//  TangShanXing
//
//  Created by muxue on 2018/9/4.
//  Copyright © 2018年 muxue. All rights reserved.
//

#import "MXPageManger.h"
#import "MXURLModel.h"
#import "MXRoute.h"
#import <objc/message.h>

@interface MXPageManger ()
@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, weak) UIViewController *currentViewController;
@end

@implementation MXPageManger

static MXPageManger *manager = nil;
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MXPageManger alloc]init];
    });
    return manager;
}
//获取跟视图
- (UIViewController *)rootViewController {
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

- (void)routerWithUrl:(NSString *)url {
    [self routerWithUrl:url
               callBack:nil];
}

- (void)routerWithUrl:(NSString *)url
             callBack:(MXCallBack)callBack {
    [self routerWithUrl:url
              parameter:nil
               callBack:callBack];
}

- (void)routerWithUrl:(NSString *)url
            parameter:(NSDictionary *)parameter {
    [self routerWithUrl:url
              parameter:parameter
               callBack:nil];
}

- (void)routerWithUrl:(NSString *)url
            parameter:(NSDictionary *)parameter
             callBack:(MXCallBack)callBack {
    MXURLModel *model = [MXURLModel resolver:url];
    [model.parameters addEntriesFromDictionary:parameter];
    [self jumpWithModel:model callBack:callBack];
}
- (void)jumpWithModel:(MXURLModel *)model
             callBack:(MXCallBack)callBack {
    if (!model) {
        return;
    }
    switch (model.type) {
        case JumpType_Push:
            [self pushModel:model
                  animation:YES
                   response:callBack];
            break;
        case JumpType_Present:
            [self presentWithModel:model
                         animation:YES
                          response:callBack];
            break;
        case JumpType_Pop:
            [self popToAnotherName:model
                         animation:YES];
            break;
        case JumpType_PopToRoot:
            [self poptoRootWithSelectIndex:model.parameters[@"select"]];
            break;
    }
}
- (void)presentWithModel:(MXURLModel *)model
               animation:(BOOL)animation
                response: (MXCallBack)callBack{
    UIViewController *viewController = [[MXRoute share] viewControllerWithRoute:model.route
                                                                      parameter:model.parameters callback:callBack];
    UINavigationController *nav = [[UINavigationController alloc]
                                   initWithRootViewController:(UIViewController *)viewController];
    [self.rootViewController presentViewController:nav
                                          animated:YES
                                        completion:nil];
}
- (void)pushModel:(MXURLModel *)model
        animation:(BOOL)animation
         response: (MXCallBack)callBack{
    UIViewController <MXViewControlleProtocol>*viewController = [[MXRoute share]        viewControllerWithRoute:model.route
                      parameter:model.parameters
                       callback:callBack];
    viewController.anotherName = model.anotherName;
    [_currentViewController.navigationController pushViewController:viewController
                                                           animated:YES];
}
- (void)popToAnotherName:(MXURLModel *)model
               animation:(BOOL)animation {
    if ((!model.anotherName) || model.anotherName.length == 0) {
        if (_currentViewController.navigationController.childViewControllers.count == 1) {
            [self.rootViewController.presentedViewController dismissViewControllerAnimated:YES
                                                                                completion:nil];
        } else {
            [_currentViewController.navigationController popViewControllerAnimated:YES];
        }
        return;
    }

    if (_currentViewController.navigationController.childViewControllers.count == 1) {
        [self.rootViewController.presentedViewController dismissViewControllerAnimated:NO
                                                                        completion:nil];
    } else {
        NSArray *vcs = _currentViewController.navigationController.childViewControllers;
        for (NSInteger i = vcs.count - 2; i >= 0; i --) {
            UIViewController<MXViewControlleProtocol> *vc = vcs[i];
            if ([vc.anotherName isEqualToString:model.anotherName]) {
                [self popToViewController:(UIViewController *)vc];
                return;
            }
        }
    }
    UINavigationController *nav = nil;
    if ([self.rootViewController isKindOfClass:UITabBarController.class]) {
        nav = ((UITabBarController *)_rootViewController).selectedViewController;
    } else if ([self.rootViewController isKindOfClass:UINavigationController.class]) {
        nav = (UINavigationController *)self.rootViewController;
    }

    for (NSInteger i = nav.childViewControllers.count - 2; i >= 0; i --) {
        UIViewController<MXViewControlleProtocol> *vc = nav.childViewControllers[i];
        if ([vc.anotherName isEqualToString:model.anotherName]) {
            [self popToViewController:(UIViewController *)vc];
            return;
        }
    }
    [self pushModel:model animation:YES response:nil];
}

- (void)popToViewController:(UIViewController *)viewController {
    if (viewController) {
        [_currentViewController.navigationController popToViewController:viewController
                                                                animated:YES];
    }
}
- (void)poptoRootWithSelectIndex:(id)index {
    [self.rootViewController.presentedViewController dismissViewControllerAnimated:NO
                                                                        completion:nil];
    [self.currentViewController.navigationController popToRootViewControllerAnimated:NO];
    if (index && [self.rootViewController isKindOfClass:UITabBarController.class]) {
        ((UITabBarController *)_rootViewController).selectedIndex = [index integerValue];
    }
}
@end
