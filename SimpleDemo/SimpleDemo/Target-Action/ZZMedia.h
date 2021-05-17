//
//  ZZMedia.h
//  SimpleDemo
//
//  Created by zz on 2021/5/14.
//  Copyright © 2021 zz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZMedia : NSObject

// 1 - Target-Action 方案
+(__kindof UIViewController *) detailWebWithURL:(NSString *)webURL andTitle:(NSString *)title;

// 2 - URL Scheme 方案
typedef void(^ZZMediaProcessBlock)(NSDictionary *params);
// 注册 URLScheme
+(void)registWithScheme:(NSString *)urlSchem processBlock:(ZZMediaProcessBlock)block;
// 通过 URLScheme 发起调用
+(void)openURL:(NSString *)urlScheme parames:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
