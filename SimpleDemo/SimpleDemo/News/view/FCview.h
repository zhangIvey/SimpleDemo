//
//  FCview.h
//  SimpleDemo
//
//  Created by zz on 2020/12/1.
//  Copyright © 2020 zz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FCview : UIView

- (void)showFCviewFromInitPoint:(CGPoint) point WithClickedBlock:(dispatch_block_t) clickedBlock;

- (void)showFCview;

- (void)dismissFCView;

@end

NS_ASSUME_NONNULL_END
