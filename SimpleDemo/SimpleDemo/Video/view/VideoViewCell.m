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

@property(nonatomic, strong) AVPlayerItem *item;
@property(nonatomic, strong) AVPlayer *player;
@property(nonatomic, strong) AVPlayerLayer *playerLayer;

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

- (void)dealloc
{
    //撤销通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [self removeObserver:self forKeyPath:@"status"];
    
}

- (void)playVideo
{
    NSLog(@"开始播放视频");
    NSURL *videourl = [NSURL URLWithString:self._videoURL];
    //封装视频资源
    AVAsset *videoSet = [AVAsset assetWithURL:videourl];
    
    //封装视频资源的播放属性
    _item = [AVPlayerItem playerItemWithAsset:videoSet];
    
    //注册通知：当接收到视频播放完成的通知，执行指定业务
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_stopPlyer) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    //注册通知：当监听到视频的状态为  准备好时再开启播放。（kvo）
    [_item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    //封装进入播放器
    _player = [AVPlayer playerWithPlayerItem:_item];
    
    
    
    //获取显示视频的层
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.frame = self._videoConver.frame;
    
    [self._videoConver.layer addSublayer:_playerLayer];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
//    if ([keyPath isEqualToString:@"status"]) {
//        if ((CFNumberType)change.NSKeyValueObservingOptionNew == AVPlayerItemStatusReadyToPlay) {
//            [_player play];
//        }
//    }
    
}


/// 关闭视频播放（私有方法）
- (void)_stopPlyer
{
    NSLog(@"播放结束");
    [_playerLayer removeFromSuperlayer];
    _player = nil;
    _item = nil;
}



@end
