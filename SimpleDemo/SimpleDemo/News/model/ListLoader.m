//
//  ListLoader.m
//  SimpleDemo
//
//  Created by zz on 2021/1/15.
//  Copyright © 2021 zz. All rights reserved.
//

#import "ListLoader.h"
#import <AFNetworking/AFNetworking.h>
#import "NewsModel.h"

@implementation ListLoader

- (void)loadDataWithFinishBlock:(LoadListFinishBlock) finishBlock
{
    
//    [[AFHTTPSessionManager manager] GET:@"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json"
//    parameters:nil
//    headers:nil
//    progress:nil
//    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"");
//    }];
    
    
    NSURL *url = [NSURL URLWithString:@"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *dataArray = (NSArray *)[(NSDictionary *)[(NSDictionary *)jsonObject objectForKey:@"result"] objectForKey:@"data"];
        
        NSMutableArray *initInfoArray = [[NSMutableArray alloc] initWithCapacity:10];
        for (NSDictionary *info in dataArray) {
            NewsModel *model = [[NewsModel alloc] init];
            [model configueObjectTransfor:info];
            
            [initInfoArray addObject:model];
        }
        
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{

        //回到主线程，执行UI刷新操作
            finishBlock(error == nil, initInfoArray);

        });
        
        NSLog(@"");
        
    }];

    [dataTask resume];
    
}

@end
