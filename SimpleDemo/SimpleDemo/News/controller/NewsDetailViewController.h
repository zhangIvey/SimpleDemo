//
//  NewsDetailViewController.h
//  SimpleDemo
//
//  Created by zz on 2020/11/25.
//  Copyright © 2020 zz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAdapter.h"
#import "ZZMedia.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailViewController : UIViewController<ZZDetailWebViewProtocol>

@property(nonatomic, copy, readwrite) NSString *URLString;

- (instancetype)initWithURL:(NSString *)URL andTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
