//
//  NewsModel.m
//  SimpleDemo
//
//  Created by zz on 2021/1/22.
//  Copyright © 2021 zz. All rights reserved.
//

#import "NewsModel.h"

@interface NewsModel ()
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s03;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s02;
@property(nonatomic, copy, readwrite) NSString *uniquekey;

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

#pragma mark - 序列化
// 这里是类方法，不是私有方法
+ (BOOL)supportsSecureCoding
{
    return YES;
}

//    通过编码进行存储： NSObject对象转化成NSData 的调用
- (void)encodeWithCoder:(NSCoder *)coder
{
    
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.thumbnail_pic_s03 forKey:@"thumbnail_pic_s03"];
    [coder encodeObject:self.thumbnail_pic_s02 forKey:@"thumbnail_pic_s02"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.thumbnail_pic_s forKey:@"thumbnail_pic_s"];
    [coder encodeObject:self.author_name forKey:@"author_name"];
    [coder encodeObject:self.url forKey:@"url"];
    [coder encodeObject:self.date forKey:@"date"];

}
//  通过解码进行初始化：NSData 转化成 NSObject对象的调用
- (nullable instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        
        
        self.uniquekey = [coder decodeObjectForKey:@"uniquekey"];
        self.thumbnail_pic_s03 = [coder decodeObjectForKey:@"thumbnail_pic_s03"];
        self.thumbnail_pic_s02 = [coder decodeObjectForKey:@"thumbnail_pic_s02"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.category = [coder decodeObjectForKey:@"category"];
        self.thumbnail_pic_s = [coder decodeObjectForKey:@"thumbnail_pic_s"];
        self.author_name = [coder decodeObjectForKey:@"author_name"];
        self.url = [coder decodeObjectForKey:@"url"];
        self.date = [coder decodeObjectForKey:@"date"];
    
    }
    return self;
}

@end
