//
//  ZZMedia.m
//  SimpleDemo
//
//  Created by zz on 2021/5/14.
//  Copyright © 2021 zz. All rights reserved.
//

#import "ZZMedia.h"
#import "NewsDetailViewController.h"

@implementation ZZMedia
    
+(__kindof UIViewController *) detailWebWithURL:(NSString *)webURL andTitle:(NSString *)title
{
    NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] init];
    detailViewController.title = title;
    detailViewController.URLString = webURL;
    return detailViewController;
}


@end
