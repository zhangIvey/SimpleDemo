//
//  NewsModel.h
//  SimpleDemo
//
//  Created by zz on 2021/1/22.
//  Copyright © 2021 zz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 新闻列表页，单条新闻的model
@interface NewsModel : NSObject <NSSecureCoding>

@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *category;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s;
@property(nonatomic, copy, readwrite) NSString *author_name;
@property(nonatomic, copy, readwrite) NSString *url;
@property(nonatomic, copy, readwrite) NSString *date;


- (void)configueObjectTransfor:(NSDictionary *)dictionnary;

@end

NS_ASSUME_NONNULL_END
