//
//  ZZMedia.m
//  SimpleDemo
//
//  Created by zz on 2021/5/14.
//  Copyright © 2021 zz. All rights reserved.
//

#import "ZZMedia.h"

@implementation ZZMedia
    
+(__kindof UIViewController *) detailWebWithURL:(NSString *)webURL andTitle:(NSString *)title
{
    /*
    NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] init];
    detailViewController.title = title;
    detailViewController.URLString = webURL;
    return detailViewController;
     */
    
    /**
            Target-Action 方案的弊端
     1 - 类名 和 方法名 都是使用字符串形式的硬编码写就（这正是该方案的精髓），容易出现书写错误
     2 - 参数的传递个数至多2个，所以可以采用通过传字典或者更丰富的格式来完成。
     */
    Class claasName = NSClassFromString(@"NewsDetailViewController");
    UIViewController *viewController = [[claasName alloc] performSelector:NSSelectorFromString(@"initWithURL:andTitle:") withObject:webURL withObject:title];
    return viewController;;

}


//============================================
// 创建一个存储来存放 URLScheme 和 block的对应关系
+ (NSMutableDictionary *)_mediaCache
{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

// 注册 URLScheme : 把URLScheme 和 block 的对应关系进行存储。
+ (void)registURLScheme:(NSString *)scheme processBlock:(ProcessBlock)block
{
    if (scheme && block) {
        [[[self class] _mediaCache] setObject:block forKey:scheme];
    }
}

// 通过 URLScheme 发起调用
+ (void)openURL:(NSString *)url params:(NSMutableDictionary *)params
{
    if (url && params) {
        ProcessBlock block = [[[self class] _mediaCache] objectForKey:url];
        block(params);
    }
}

//============================================
    // 注册 Protocol - class 关系
+ (void)registProtocol:(Protocol *)protocol andClass:(Class)className
{
    if (protocol && className) {
        [[[self class] _mediaCache] setObject:NSStringFromClass(className) forKey:NSStringFromProtocol(protocol)];
    }
    
}
    // 通过 Protocol 唤起调用
+ (Class)classFromProtol:(Protocol *)protocol
{
    return NSClassFromString([[[self class] _mediaCache] objectForKey:NSStringFromProtocol(protocol)]);
}

//+ (__kindof UIViewController *_Nonnull) detailWebForProtocolWithURL:(NSString *_Nullable)webURL andTitle:(NSString *_Nullable)title
//{
//    Class claasName = NSClassFromString(@"NewsDetailViewController");
//    UIViewController *viewController = [[claasName alloc] performSelector:NSSelectorFromString(@"initWithURL:andTitle:") withObject:webURL withObject:title];
//    return viewController;;
//}

@end
