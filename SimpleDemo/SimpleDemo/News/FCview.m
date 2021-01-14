//
//  FCview.m
//  SimpleDemo
//
//  Created by zz on 2020/12/1.
//  Copyright © 2020 zz. All rights reserved.
//

#import "FCview.h"

@interface FCview ()

@property(nonatomic, strong, readwrite) UIView *backView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t clickedBlock;

@end

@implementation FCview

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backView = [[UIView alloc] initWithFrame:self.bounds];
            _backView.backgroundColor = [UIColor blackColor];
            _backView.alpha = 0.5f;
            
            [_backView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissFCView)];
                tapGesture;
            })];
            _backView;
        })];
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

- (void)showFCviewFromInitPoint:(CGPoint) point WithClickedBlock:(dispatch_block_t) clickedBlock
{
 
    self.deleteButton.frame = CGRectMake(point.x, point.y,  0, 0); //设置按钮布局的初始位置
    _clickedBlock = clickedBlock;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^(){
        self.deleteButton.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200);
    } completion:nil];
    
}

- (void)showFCview
{
   
}

- (void)dismissFCView
{
    [self removeFromSuperview];
}

- (void)clickButton
{
    self.clickedBlock();
    [self removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
