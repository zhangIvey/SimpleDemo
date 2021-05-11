//
//  NiewsTableViewCell.h
//  SimpleDemo
//
//  Created by zz on 2020/11/25.
//  Copyright © 2020 zz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAdapter.h"
@class NewsModel;

NS_ASSUME_NONNULL_BEGIN
@protocol NiewsTableViewCellDelegate <NSObject>

- (void)clickedCell:(UITableViewCell *) cell WithButton:(UIButton *)deletaButton;

@end


@interface NewsTableViewCell : UITableViewCell
@property(nonatomic, weak, readwrite) id<NiewsTableViewCellDelegate> delegate;

- (void)layoutCellWithModel:(NewsModel *)model;

@end



NS_ASSUME_NONNULL_END
