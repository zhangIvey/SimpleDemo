//
//  StartTheView.m
//  SimpleDemo
//
//  Created by zz on 2021/5/13.
//  Copyright © 2021 zz. All rights reserved.
//

#import "StartTheView.h"
#import "UIAdapter.h"

@interface StartTheView ()

@property(nonatomic, strong, readwrite) UIButton *nextButton; //跳过按钮

@end

@implementation StartTheView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/launchImage.png"];
        [self addSubview:({
            _nextButton = [[UIButton alloc] initWithFrame:RECTADAPTER(100, 60, 100, 40)];
            _nextButton.backgroundColor = [UIColor lightGrayColor];
            [_nextButton setTitle:@"跳过" forState:UIControlStateNormal];
            [_nextButton addTarget:self action:@selector(_nextButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
            
            _nextButton;
        }
        )];
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void) _nextButtonClick
{
    [self removeFromSuperview];
}

@end
