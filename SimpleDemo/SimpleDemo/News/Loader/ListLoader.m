//
//  ListLoader.m
//  SimpleDemo
//
//  Created by zz on 2021/1/15.
//  Copyright © 2021 zz. All rights reserved.
//

#import "ListLoader.h"
#import <AFNetworking/AFNetworking.h>

@implementation ListLoader

- (void)loadData
{
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
//    NSURL *url = [NSURL URLWithString:urlString];
    
    
    [[AFHTTPSessionManager manager] GET:urlString
    parameters:nil
    headers:nil
    progress:nil
    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
    
    
    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"");
//    }];
//
//    [dataTask resume];
    
}

@end
