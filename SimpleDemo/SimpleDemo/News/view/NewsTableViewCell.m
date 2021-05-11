//
//  NiewsTableViewCell.m
//  SimpleDemo
//
//  Created by zz on 2020/11/25.
//  Copyright © 2020 zz. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsModel.h"
#import <SDWebImage/SDWebImage.h>

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
            self.titleLabel = [[UILabel alloc] initWithFrame:RECTADAPTER(20, 10, 270, 70)];
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


//    ============================================
//    NSThread 线程管理
//    NSThread *imageDownloadThread = [[NSThread alloc] initWithBlock:^{
//            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnail_pic_s]]];
//            self.rightImageView.image = image;
//        }];
//    [imageDownloadThread start];
    
    
    
//    ============================================
//    GCD 线程管理
//    // 获取非主线程队列
//    dispatch_queue_global_t imageDownloadQuese = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //异步开启线程执行
//    dispatch_async(imageDownloadQuese, ^{
//        // 将业务逻辑添加到队列中
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnail_pic_s]]];
//
//        //获取主线程
//        dispatch_queue_t mainQueue = dispatch_get_main_queue();
//        dispatch_async(mainQueue, ^{
//            self.rightImageView.image = image;//主线程队列中进行UI的操作。
//        });
//    });
    
    
    
//    =======================================
//    NSOperation 线程管理
    // 获取线程队列
//    NSOperationQueue *imageLoadQueue = [[NSOperationQueue alloc] init];
//    imageLoadQueue.name = @"imageLoadQueue";
//    // 创建一个线程 ，创建的业务逻辑添加到一个线程里
//    NSBlockOperation *blockOperation = [[NSBlockOperation alloc] init];
//    [blockOperation addExecutionBlock:^{
//        NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
//        sleep(3);
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.thumbnail_pic_s]]];
//
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            NSLog(@"2---%@", [NSThread currentThread]);
//            self.rightImageView.image = image;//主线程队列中进行UI的操作。
//        }];
//    }];
//    // 把线程放到线程队列里
//    [imageLoadQueue addOperation:blockOperation];
//警告：不要即把操作添加到操作队列中，又调用操作的start方法，这样是不允许的！否则运行时直接报错。

    
    
//    ============================================
//    常使用的第三方框架 SDWebImage
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnail_pic_s] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    }];
    
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
