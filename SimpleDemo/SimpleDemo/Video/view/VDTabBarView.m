//
//  VDTabBarView.m
//  SimpleDemo
//
//  Created by zz on 2021/4/28.
//  Copyright © 2021 zz. All rights reserved.
//

#import "VDTabBarView.h"

@interface VDTabBarView ()

@property(nonatomic, strong, readwrite) UIImageView *headPhotoImgView;
@property(nonatomic, strong, readwrite) UILabel *headPhotoLabel;
@property(nonatomic, strong, readwrite) UIImageView *commentImgView;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UIImageView *praiseImgView;
@property(nonatomic, strong, readwrite) UILabel *praiseLabel;
@property(nonatomic, strong, readwrite) UIImageView *shareImgView;
@property(nonatomic, strong, readwrite) UILabel *shareLabel;

@end

@implementation VDTabBarView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:({
            self.headPhotoImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.headPhotoImgView.layer.masksToBounds = YES;
            self.headPhotoImgView.layer.cornerRadius = 15.0f;
            self.headPhotoImgView.translatesAutoresizingMaskIntoConstraints = NO;//使用AutoLayout实现布局，这个属性是一定要设置的
            self.headPhotoImgView;
        })];
        
        
        [self addSubview:({
            self.headPhotoLabel = [[UILabel alloc]  init];
            self.headPhotoLabel.font = [UIFont systemFontOfSize:15];
            self.headPhotoLabel.textColor = [UIColor grayColor];
            self.headPhotoLabel.textAlignment = NSTextAlignmentLeft;
            self.headPhotoLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.headPhotoLabel;
        })];
        
        [self addSubview:({
//            self.commentImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"comment@3x.png"]];
            self.commentImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.commentImgView.layer.masksToBounds = YES;
            self.commentImgView.layer.cornerRadius = 15;
            self.commentImgView.translatesAutoresizingMaskIntoConstraints = NO;
            self.commentImgView;

        })];

        [self addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.commentLabel.text = @"";
            self.commentLabel.textAlignment = NSTextAlignmentLeft;
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel.font = [UIFont systemFontOfSize:15];
            self.commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.commentLabel;

        })];

        [self addSubview:({
//            self.praiseImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"praise@3x.png"]];
            self.praiseImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.praiseImgView.layer.masksToBounds = YES;
            self.praiseImgView.layer.cornerRadius = 15;
            self.praiseImgView.translatesAutoresizingMaskIntoConstraints = NO;
            self.praiseImgView;
        })];
        
        [self addSubview:({
            self.praiseLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.praiseLabel.text = @"";
            self.praiseLabel.textAlignment = NSTextAlignmentLeft;
            self.praiseLabel.textColor = [UIColor grayColor];
            self.praiseLabel.font = [UIFont systemFontOfSize:15];
            self.praiseLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.praiseLabel;
        })];

        [self addSubview:({
//            self.shareImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"share@2x.png"]];
            self.shareImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.shareImgView.layer.masksToBounds = YES;
            self.shareImgView.layer.cornerRadius = 15;
            self.shareImgView.translatesAutoresizingMaskIntoConstraints = NO;
            self.shareImgView;
        })];

        [self addSubview:({
            self.shareLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.shareLabel.text = @"";
            self.shareLabel.textAlignment = NSTextAlignmentLeft;
            self.shareLabel.textColor = [UIColor grayColor];
            self.shareLabel.font = [UIFont systemFontOfSize:15];
            self.shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.shareLabel;
        })];
    }
    return self;
}

- (void)layoutWithModel:(id)model
{
    NSLog(@"展示model对象");
    self.headPhotoImgView.image = [UIImage imageNamed:@"icon.png"];
    self.headPhotoLabel.text = @"极客时间";
    
    self.commentImgView.image = [UIImage imageNamed:@"comment@3x.png"];
    self.commentLabel.text = @"100";

    self.praiseImgView.image = [UIImage imageNamed:@"praise@3x.png"];
    self.praiseLabel.text = @"200";

    self.shareImgView.image = [UIImage imageNamed:@"share@2x.png"];
    self.shareLabel.text = @"55";
    
    
    
    
    
    [NSLayoutConstraint activateConstraints:@[
                                        [NSLayoutConstraint constraintWithItem:_headPhotoImgView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
                                            toItem:self
                                            attribute:NSLayoutAttributeCenterY
                                            multiplier:1
                                            constant:0],
                                        
                                        [NSLayoutConstraint constraintWithItem:_headPhotoImgView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
                                            toItem:self
                                            attribute:NSLayoutAttributeLeft
                                            multiplier:1
                                            constant:15],
                                        
                                        [NSLayoutConstraint constraintWithItem:_headPhotoImgView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                            attribute:NSLayoutAttributeNotAnAttribute
                                            multiplier:1
                                            constant:30],
                                        
                                        [NSLayoutConstraint constraintWithItem:_headPhotoImgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                            attribute:NSLayoutAttributeNotAnAttribute
                                            multiplier:1
                                            constant:30],
                                        
                                        [NSLayoutConstraint constraintWithItem:_headPhotoLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
                                            toItem:_headPhotoImgView
                                            attribute:NSLayoutAttributeCenterY
                                            multiplier:1
                                            constant:0],
                                        
                                        [NSLayoutConstraint constraintWithItem:_headPhotoLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual
                                            toItem:_headPhotoImgView
                                            attribute:NSLayoutAttributeRight
                                            multiplier:1
                                            constant:0],
                                        
                                        
                                        
                                        

    ]];
    
    NSString *vflString = @"H:|-15-[_headPhotoImgView]-0-[_headPhotoLabel]-(>=0)-[_commentImgView]-0-[_commentLabel]-15-[_praiseImgView]-0-[_praiseLabel]-15-[_shareImgView]-0-[_shareLabel]-15-|";
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_headPhotoImgView,_headPhotoLabel,_commentImgView,_commentLabel,_praiseImgView,_praiseLabel,_shareImgView,_shareLabel)]];
    
}

@end
