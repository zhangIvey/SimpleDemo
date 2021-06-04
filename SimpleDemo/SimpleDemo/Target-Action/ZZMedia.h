//
//  ZZMedia.h
//  SimpleDemo
//
//  Created by zz on 2021/5/14.
//  Copyright © 2021 zz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>



@protocol ZZDetailWebViewProtocol <NSObject>

-(__kindof UIViewController *) detailWebWithURL:(NSString *)webURL andTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_BEGIN
@interface ZZMedia : NSObject

// 1 - Target-Action 方案
+(__kindof UIViewController *) detailWebWithURL:(NSString *)webURL andTitle:(NSString *)title;

// 2 - URL Scheme 方案
typedef void(^ProcessBlock)(NSMutableDictionary *params);
    // 注册 URLScheme
+ (void)registURLScheme:(NSString *)scheme processBlock:(ProcessBlock)block;
    // 通过 URLScheme 发起调用
+ (void)openURL:(NSString *)url params:(NSMutableDictionary *)params;


// 3 - Protocol - class 方案
    // 注册 Protocol - class 关系
+ (void)registProtocol:(Protocol *)protocol andClass:(Class)className;
    // 通过 Protocol 唤起调用
+ (Class)classFromProtol:(Protocol *)protocol;

//- (__kindof UIViewController *_Nonnull) detailWebForProtocolWithURL:(NSString *_Nullable)webURL andTitle:(NSString *_Nullable)title;
@end

NS_ASSUME_NONNULL_END
