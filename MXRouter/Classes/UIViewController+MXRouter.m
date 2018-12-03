//
//  UIViewController+MXRouter.m
//  Pods
//
//  Created by muxue on 2018/10/23.
//

#import "UIViewController+MXRouter.h"
#import <objc/message.h>
#import <MXPageManger.h>

@implementation UIViewController (MXRouter)

#pragma mark #############--------------替换视图已经出现的方法
+ (void)load {
    Method viewDidAppear = class_getInstanceMethod(self, @selector(viewDidAppear:));
    Method page_ViewDidAppear = class_getInstanceMethod(self, @selector(page_ViewDidAppear:));
    method_exchangeImplementations(viewDidAppear, page_ViewDidAppear);
}
- (void)page_ViewDidAppear:(BOOL)animated {
    [self page_ViewDidAppear:animated];
    if (self.navigationController) {
        [[MXPageManger shareInstance] setValue:self forKey:@"currentViewController"];
    }
}
#pragma mark:#############--------------别名关联属性
- (void (^)(id))callBack {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setCallBack:(void (^)(id))callBack {
    objc_setAssociatedObject(self, @selector(callBack), callBack, OBJC_ASSOCIATION_COPY);
}
- (NSDictionary *)parameter {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setParameter:(NSDictionary *)parameter {
    objc_setAssociatedObject(self, @selector(parameter), parameter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)anotherName {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setAnotherName:(NSString *)anotherName {
    objc_setAssociatedObject(self, @selector(anotherName), anotherName, OBJC_ASSOCIATION_COPY);
}
@end
