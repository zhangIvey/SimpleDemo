//
//  NiewsTableViewCell.m
//  SimpleDemo
//
//  Created by zz on 2020/11/25.
//  Copyright © 2020 zz. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsModel.h"

@interface  NewsTableViewCell()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;

@property(nonatomic, strong, readwrite) UIImageView *rightImageView;

@property(nonatomic, strong, readwrite) UIButton *button;

@end

@implementation NewsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 270, 70)];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel.font = [UIFont systemFontOfSize:18];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, self.titleLabel.frame.size.height + self.titleLabel.frame.origin.y, 20, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:13];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.sourceLabel.frame.size.width + self.sourceLabel.frame.origin.x + 15, self.sourceLabel.frame.origin.y, 20, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:13];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.commentLabel.frame.size.width + self.commentLabel.frame.origin.x + 15, self.commentLabel.frame.origin.y, 20, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:13];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.titleLabel.frame.size.width + self.titleLabel.frame.origin.x + 20, self.titleLabel.frame.origin.y, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor systemPinkColor];
            self.rightImageView;
        })];
        
//        [self.contentView addSubview:({
//            self.button = [[UIButton alloc] initWithFrame:CGRectMake(270, self.timeLabel.frame.origin.y-20, 50, 30)];
//            self.button.enabled = YES;
//            [self.button setTitle:@"X" forState:UIControlStateNormal];
//            [self.button setTitle:@"V" forState:UIControlStateHighlighted];
//            [self.button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
//
//            self.button.layer.cornerRadius = 15;
//            self.button.layer.masksToBounds = YES;
//            self.button.layer.borderColor = [UIColor grayColor].CGColor;
//            self.button.layer.borderWidth = 2;
//            self.button;
//        })];
        
    }
    return self;
}


- (void)layoutCellWithModel:(NewsModel *)model
{
    self.titleLabel.text = model.title;
    self.sourceLabel.text = model.author_name;
    [self.sourceLabel sizeToFit];
    
    
    self.commentLabel.text = model.category;
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.size.width + self.sourceLabel.frame.origin.x + 15, self.sourceLabel.frame.origin.y, 20, 20);
    [self.commentLabel sizeToFit];
    
    
    self.timeLabel.text = model.date;
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.size.width + self.commentLabel.frame.origin.x + 15, self.commentLabel.frame.origin.y, 20, 20);
    [self.timeLabel sizeToFit];
    
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnail_pic_s]]];
    NSLog(@"url = %@",model.thumbnail_pic_s);
    self.rightImageView.image = image;
    
    
    
    
}

//-(void)clickButton
//{
//
//    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedCell:WithButton:)])
//    {
//        [self.delegate clickedCell:self WithButton:self.button];
//    }
//
//}

@end
