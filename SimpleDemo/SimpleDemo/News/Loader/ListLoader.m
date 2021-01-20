//
//  ListLoader.m
//  SimpleDemo
//
//  Created by zz on 2021/1/15.
//  Copyright © 2021 zz. All rights reserved.
//

#import "ListLoader.h"

@implementation ListLoader

- (void)loadData
{
    NSURL *url = [NSURL URLWithString:@"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"");
    }];

    [dataTask resume];
    
}

@end
