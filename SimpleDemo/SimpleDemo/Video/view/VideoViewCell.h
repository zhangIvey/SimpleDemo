//
//  VideoViewCell.h
//  SimpleDemo
//
//  Created by zz on 2021/3/23.
//  Copyright © 2021 zz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoViewCell : UICollectionViewCell

-(void)layoutWithVideoConverURL:(NSString *) videoConverURL videoURL:(NSString *)videoURL;

@end

NS_ASSUME_NONNULL_END
