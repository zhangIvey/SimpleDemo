//
//  VideoViewCell.m
//  SimpleDemo
//
//  Created by zz on 2021/3/23.
//  Copyright © 2021 zz. All rights reserved.
//

#import "VideoViewCell.h"
#import <AVKit/AVKit.h>

@interface VideoViewCell()

@property(nonatomic, strong) UIImageView *_videoConver;
@property(nonatomic, strong) UIImageView *_videoPlay;
@property(nonatomic, copy, readwrite) NSString *_videoURL;


@end

@implementation VideoViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:({
            self._videoConver = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        })];
        [self._videoConver addSubview:({
            self._videoPlay =[[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2,(frame.size.height-50)/2,50,50)];
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
    NSLog(@"");

}

- (void)playVideo
{
    NSLog(@"开始播放视频");
    NSURL *videourl = [NSURL URLWithString:self._videoURL];
    //封装视频资源
    AVAsset *videoSet = [AVAsset assetWithURL:videourl];
    
    //封装视频资源的播放属性
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:videoSet];
    
    //封装进入播放器
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    
    //获取显示视频的层
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = self._videoConver.frame;
    
    [self._videoConver.layer addSublayer:playerLayer];
    
    [player play];
    
}



@end
