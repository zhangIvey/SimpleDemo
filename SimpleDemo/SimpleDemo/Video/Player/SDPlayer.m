//
//  SDPlayer.m
//  SimpleDemo
//
//  Created by zz on 2021/4/25.
//  Copyright © 2021 zz. All rights reserved.
//

#import "SDPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface SDPlayer ()
@property(nonatomic, strong) AVPlayerItem *item;
@property(nonatomic, strong) AVPlayer *player;
@property(nonatomic, strong) AVPlayerLayer *playerLayer;


@end


@implementation SDPlayer

static SDPlayer *defaultPlayer;


+(SDPlayer *)sharePlayer
{
    static dispatch_once_t onceTokenForPlayer;
    dispatch_once(&onceTokenForPlayer, ^{
        defaultPlayer = [[SDPlayer alloc] init];
    });
    return defaultPlayer;
}


- (void)playVideoWithURL:(NSString *)URLString andInView:(UIView *)showView
{
    
    [self _stopPlay];
    
    NSLog(@"开始播放视频");
    NSURL *videourl = [NSURL URLWithString:URLString];
    
    //封装视频资源
    AVAsset *videoSet = [AVAsset assetWithURL:videourl];
    
    //封装视频资源的播放属性
    _item = [AVPlayerItem playerItemWithAsset:videoSet];
    
    
    //注册通知：当接收到视频播放完成的通知，执行指定业务
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_playToEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    //注册通知：当监听到视频的状态为  准备好时再开启播放。（kvo）
    [_item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_item addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    

    //封装进入播放器
    _player = [AVPlayer playerWithPlayerItem:_item];
    //注册通知：监听当前播放进度
    [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"当前播放进度 ： %@",@(CMTimeGetSeconds(time)));
    }];
    
    
    //获取显示视频的层
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.frame = showView.frame;
    
    [showView.layer addSublayer:_playerLayer];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        if ( ((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay ) {
            
            //视频整体时长
            CMTime duration = _item.duration;
            NSLog(@"视频的整体时长：%@",@(CMTimeGetSeconds(duration)));
            [_player play];
        }
    }else if ([keyPath isEqualToString:@"loadedTimeRanges"]){ //视频的缓存进度
        NSLog(@"缓冲：%@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

- (void)_stopPlay
{
    //撤销通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [_item removeObserver:self forKeyPath:@"status"];
    [_item removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [_playerLayer removeFromSuperlayer];
    _player = nil;
    _item = nil;
}



/// 视频播放完毕（私有方法）
- (void)_playToEnd
{
    NSLog(@"播放结束");
    
    [_player seekToTime:CMTimeMake(0, 1)];
//    [_player play];
}


-(instancetype)init
{
    self = [super init];
    return self;
}


@end
