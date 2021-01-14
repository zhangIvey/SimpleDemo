//
//  NiewsTableViewCell.h
//  SimpleDemo
//
//  Created by zz on 2020/11/25.
//  Copyright © 2020 zz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol NiewsTableViewCellDelegate <NSObject>

- (void)clickedCell:(UITableViewCell *) cell WithButton:(UIButton *)deletaButton;

@end


@interface NewsTableViewCell : UITableViewCell
@property(nonatomic, weak, readwrite) id<NiewsTableViewCellDelegate> delegate;

- (void)layoutCell;

@end



NS_ASSUME_NONNULL_END
