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
    
    NSArray<NewsModel *> *localItemArray = [self _getItemFromLocal];
    
    
    if (localItemArray) {
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
        //回到主线程，执行UI刷新操作
            finishBlock(YES, [localItemArray copy]);
        });
        
        return;
        
    }
    
    
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
        
        //进行本地缓存
        [self _cacheDataFile:(NSArray *)initInfoArray];
        
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{

        //回到主线程，执行UI刷新操作
            finishBlock(error == nil, initInfoArray);
        });
    
    }];

    [dataTask resume];
    
    
}

- (NSArray<NewsModel*> *)_getItemFromLocal
{
    NSArray  *filePathArray = NSSearchPathForDirectoriesInDomains( NSCachesDirectory,  NSUserDomainMask, YES);
    NSString *filePath = [filePathArray firstObject];
    NSString *listDataFilePath = [[[filePath stringByAppendingPathComponent:@"data"] stringByAppendingPathComponent:@"listData"] stringByAppendingPathComponent:@"list"];
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:listDataFilePath];
    NSData *readData = [fileHandle readDataToEndOfFile];
    NSArray<NewsModel *> *itemArray = (NSArray <NewsModel *> *)[NSKeyedUnarchiver unarchiveObjectWithData:readData];
    if (itemArray != nil && itemArray.count > 0) {
        return itemArray;
    }else{
        return nil;
    }
}


-(void)_cacheDataFile:(NSArray<NewsModel*> *)itemArray
{
//    目标文件路径
    NSArray *filePathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
//    创建自定义目录
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachePath = [filePathArray firstObject];
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"data"];
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:nil];
    
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"listData"];
    [fileManager createDirectoryAtPath:listDataPath withIntermediateDirectories:NO attributes:nil error:nil];
    
//    创建自定义文件
    NSString *listFilePath = [listDataPath stringByAppendingPathComponent:@"list"];
    
    [fileManager createFileAtPath:listFilePath contents:nil attributes:nil];
    
    BOOL fileExist = [fileManager fileExistsAtPath:listFilePath];
    
    if (fileExist) {
//        追加一些内容
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listFilePath];
        //定位光标
        [fileHandle seekToEndOfFile];
        
        //写入网上获取的30条列表数据
        NSData *appendData = [NSKeyedArchiver archivedDataWithRootObject:itemArray requiringSecureCoding:YES error:nil];
        
        [fileHandle writeData:appendData];
        
        //关闭文件
        [fileHandle synchronizeFile];
        [fileHandle closeFile];
    }
}

@end
