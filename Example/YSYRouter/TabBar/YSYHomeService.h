//
//  YSYHomeService.h
//  YSYRouter_Example
//
//  Created by muxue on 2019/3/19.
//  Copyright © 2019 muxueChen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YSYHomeServiceProtocol <NSObject>

//
- (void)home:(NSDictionary *)parameter;
//
- (void)tab1:(NSDictionary *)parameter;
//
- (void)tab2:(NSDictionary *)parameter;
//{number:1013}
- (UIViewController *)viewcontroller:(NSDictionary *)parameter;
@end

NS_ASSUME_NONNULL_END
