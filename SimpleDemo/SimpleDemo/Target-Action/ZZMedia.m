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
     1 - 类名 和 方法名 都是使用字符串形式的硬编码写就，容易出现书写错误
     2 - 参数的传递个数至多2个，所以可以采用通过传字典或者更丰富的格式来完成。
     */
    Class claasName = NSClassFromString(@"NewsDetailViewController");
    UIViewController *viewController = [[claasName alloc] performSelector:NSSelectorFromString(@"initWithURL:andTitle:") withObject:webURL withObject:title];
    return viewController;;
    
    
     
    return nil;
}


@end
