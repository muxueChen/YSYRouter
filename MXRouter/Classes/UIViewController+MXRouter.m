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

static const void * MXpagePropertyCallback = "MXpagePropertyCallback";
static const void * MXpagePropertyParameter = "MXpagePropertyParameter";
static const void * MXpagePropertyAnotherName = "MXpagePropertyAnotherName";
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
    return objc_getAssociatedObject(self, MXpagePropertyCallback);
}
- (void)setCallBack:(void (^)(id))callBack {
    objc_setAssociatedObject(self, MXpagePropertyCallback, callBack, OBJC_ASSOCIATION_COPY);
}
- (NSDictionary *)parameter {
    return objc_getAssociatedObject(self, MXpagePropertyParameter);
}
- (void)setParameter:(NSDictionary *)parameter {
    objc_setAssociatedObject(self, MXpagePropertyParameter, parameter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)anotherName {
    return objc_getAssociatedObject(self, MXpagePropertyAnotherName);
}
- (void)setAnotherName:(NSString *)anotherName {
    objc_setAssociatedObject(self, MXpagePropertyAnotherName, anotherName, OBJC_ASSOCIATION_COPY);
}
@end
