//
//  ZZMedia.m
//  SimpleDemo
//
//  Created by zz on 2021/5/14.
//  Copyright © 2021 zz. All rights reserved.
//

#import "ZZMedia.h"
//#import "NewsDetailViewController.h"

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

+ (NSMutableDictionary *)mediaCache
{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

// 注册 URLScheme
+(void)registWithScheme:(NSString *)urlSchem processBlock:(ZZMediaProcessBlock)block
{
    if (urlSchem && block) {
        [[self mediaCache] setObject:block forKey:urlSchem];
    }
    
}


// 通过 URLScheme 发起调用
+(void)openURL:(NSString *)urlScheme parames:(NSDictionary *)params
{
    NSLog(@"URL Scheme方式");
    if (urlScheme && params) {
        ZZMediaProcessBlock block = [[self mediaCache] objectForKey:urlScheme];
        
        if (block) {
            block(params);
        }
        
    }
    
}


@end
