#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MXCommonProtocols.h"
#import "MXPageManger.h"
#import "MXRoute.h"
#import "MXURLModel.h"
#import "UIViewController+MXRouter.h"

FOUNDATION_EXPORT double MXRouterVersionNumber;
FOUNDATION_EXPORT const unsigned char MXRouterVersionString[];

