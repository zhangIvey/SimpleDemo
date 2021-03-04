//
//  ListLoader.h
//  SimpleDemo
//
//  Created by zz on 2021/1/15.
//  Copyright © 2021 zz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsModel;
NS_ASSUME_NONNULL_BEGIN
typedef void(^LoadListFinishBlock)(BOOL success, NSArray *infoArray);
/// 列表页加载器
@interface ListLoader : NSObject

- (void)loadDataWithFinishBlock:(LoadListFinishBlock) finishBlock;
@end

NS_ASSUME_NONNULL_END
