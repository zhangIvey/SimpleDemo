//
//  RecommandViewController.m
//  SimpleDemo
//
//  Created by zz on 2020/11/25.
//  Copyright © 2020 zz. All rights reserved.
//

#import "RecommandViewController.h"

@interface RecommandViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation RecommandViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        scrollView.delegate = self;
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width * 5, scrollView.bounds.size.height);
        scrollView.showsHorizontalScrollIndicator = YES;
//        scrollView.showsVerticalScrollIndicator = YES;
        scrollView.pagingEnabled = YES;
        scrollView.backgroundColor = [UIColor whiteColor];
        
        NSArray *colors = @[[UIColor redColor],[UIColor yellowColor],[UIColor blueColor],[UIColor orangeColor],[UIColor purpleColor]];
        for (int i = 0; i < 5; i++) {
            [scrollView addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
                view.backgroundColor = colors[i];
                
                [view addSubview:({
                    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
                    subView.backgroundColor = [UIColor blackColor];
                    // 添加手势
                    
                    [subView addGestureRecognizer:({
                        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBlackView)];
                        tapGesture.delegate = self;
                        tapGesture;
                    })];
                    
                    subView;
                })];
                
                view;
            })];
        }
        
        scrollView;
    })];
}

#pragma mark - UIGestureRecognizerDelegate's methods
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}


#pragma mark - custom's methods
- (void)clickBlackView
{
    NSLog(@"clickBlackView");
//    打开第三方APP：通过使用URL Scheme (TestURLScheme)
    NSURL *url = [NSURL URLWithString:@"TestURLScheme://"];
    // 1 - 先判断要打开的应用是否在手机上安装
    bool canOpen = [[UIApplication sharedApplication] canOpenURL:url];
    if (canOpen) {
        
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            if (success) {
                NSLog(@"成功唤起");
            }else{
                NSLog(@"出故障了");
            }
        }];
        
    }
    
}


#pragma mark - UIScrollViewDelegate's methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"scrollViewWillEndDragging");
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");

}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");

}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndScrollingAnimation");

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
