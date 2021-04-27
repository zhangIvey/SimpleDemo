//
//  SDPlayer.h
//  SimpleDemo
//
//  Created by zz on 2021/4/25.
//  Copyright © 2021 zz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDPlayer : NSObject

+(SDPlayer *)sharePlayer;

- (void)playVideoWithURL:(NSString *)URLString andInView:(UIView *)showView;

@end

NS_ASSUME_NONNULL_END
