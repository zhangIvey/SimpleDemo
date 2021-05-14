//
//  ZZMedia.h
//  SimpleDemo
//
//  Created by zz on 2021/5/14.
//  Copyright © 2021 zz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZMedia : NSObject

+(__kindof UIViewController *) detailWebWithURL:(NSString *)webURL andTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
