//
//  NewsModel.m
//  SimpleDemo
//
//  Created by zz on 2021/1/22.
//  Copyright © 2021 zz. All rights reserved.
//

#import "NewsModel.h"

@interface NewsModel ()

@property(nonatomic, copy, readwrite) NSString *uniquekey;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s03;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s02;


@end

@implementation NewsModel


- (void)configueObjectTransfor:(NSDictionary *)dictionnary
{
    self.category = [dictionnary objectForKey:@"category"];
//    self.thumbnail_pic_s = [dictionnary objectForKey:@"thumbnail_pic_s"];;
    self.thumbnail_pic_s = @"http://www.wanbu.com.cn/ueditor/php/upload/image/20200908/1599554325390146.png";
    self.uniquekey= [dictionnary objectForKey:@"uniquekey"];;
    self.title = [dictionnary objectForKey:@"title"];;
    self.date = [dictionnary objectForKey:@"date"];;
    self.author_name = [dictionnary objectForKey:@"author_name"];;
    self.thumbnail_pic_s03 = [dictionnary objectForKey:@"thumbnail_pic_s03"];;
    self.thumbnail_pic_s02 = [dictionnary objectForKey:@"thumbnail_pic_s02"];;
    self.url = [dictionnary objectForKey:@"url"];;
}

@end
