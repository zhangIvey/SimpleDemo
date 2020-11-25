//
//  NewsDetailViewController.m
//  SimpleDemo
//
//  Created by zz on 2020/11/25.
//  Copyright © 2020 zz. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        //添加一个分享按钮
        UIBarButtonItem *shareuttonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享新闻" style:UIBarButtonItemStylePlain target:self action:@selector(toShare)];
        self.navigationItem.rightBarButtonItem = shareuttonItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

#pragma mark - custom's methods
- (void)toShare
{
    NSLog(@"分享此条咨询");
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
