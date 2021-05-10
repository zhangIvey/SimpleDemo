//
//  VideoViewCell.m
//  SimpleDemo
//
//  Created by zz on 2021/3/23.
//  Copyright © 2021 zz. All rights reserved.
//

#import "VideoViewCell.h"
#import <AVKit/AVKit.h>
#import "SDPlayer.h"
#import "VDTabBarView.h"

@interface VideoViewCell()

@property(nonatomic, strong, readwrite) UIImageView *_videoConver;
@property(nonatomic, strong, readwrite) UIImageView *_videoPlay;
@property(nonatomic, copy, readwrite) NSString *_videoURL;
@property(nonatomic, strong, readwrite) VDTabBarView *tabBarView;

@end

@implementation VideoViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:({
            self._videoConver = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-tabBarViewHeight)];
        })];
        [self._videoConver addSubview:({
            self._videoPlay =[[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2,(frame.size.height-50 - 60)/2,50,50)];
        })];
        
        [self addSubview:({
            self.tabBarView = [[VDTabBarView alloc] initWithFrame:CGRectMake(0, self._videoConver.frame.origin.y + self._videoConver.frame.size.height, self.contentView.bounds.size.width, tabBarViewHeight)];
        })];
        
//        能够响应点击事件
        [self addGestureRecognizer:({
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playVideo)];
            gesture.numberOfTouchesRequired = 1;
            gesture.numberOfTapsRequired = 1;
            gesture;
        })];
    }
    return self;
}


-(void)layoutWithVideoConverURL:(NSString *) videoConverURL videoURL:(NSString *)videoURL
{
    __videoConver.image = [UIImage imageNamed:videoConverURL];
    __videoPlay.image = [UIImage imageNamed:@"videoPlayer@2x.png"];
    __videoURL = videoURL;
    
    [self.tabBarView layoutWithModel:nil];
    NSLog(@"");
}


- (void)playVideo
{
    [[SDPlayer sharePlayer] playVideoWithURL:self._videoURL andInView:self.contentView];
}

@end
