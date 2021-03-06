//
//  NewsDetailViewController.m
//  SimpleDemo
//
//  Created by zz on 2020/11/25.
//  Copyright © 2020 zz. All rights reserved.
//

#import "NewsDetailViewController.h"
#import <WebKit/WebKit.h>
#import "UIAdapter.h"



@interface NewsDetailViewController ()<WKNavigationDelegate>

@property(nonatomic, strong, readwrite) WKWebView *webView;

@property(nonatomic, strong, readwrite) UIProgressView *progressView;
@end


@implementation NewsDetailViewController


+(void)load
{
    // 用于在URLScheme方案中进行事务的注册
    /*
    [ZZMedia registURLScheme:@"detailWeb://" processBlock:^(NSMutableDictionary * _Nonnull params) {
        NSString *url = [params objectForKey:@"url"];
        NSString *title = [params objectForKey:@"title"];
        UINavigationController *navigationController = [params objectForKey:@"controller"];
        
        NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] initWithURL:url andTitle:title];
        [navigationController pushViewController:detailViewController animated:YES];
    }];
     */
    
    // 用于在Protocol方案中进行 类的 注册
    [ZZMedia registProtocol:@protocol(ZZDetailWebViewProtocol) andClass:[self class]];
}



- (void)dealloc
{
    // 移除监听
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (instancetype)initWithURL:(NSString *)URL andTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        //添加一个分享按钮
        UIBarButtonItem *shareuttonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享新闻" style:UIBarButtonItemStylePlain target:self action:@selector(toShare)];
        self.navigationItem.rightBarButtonItem = shareuttonItem;
        
        self.URLString = URL;
        self.title = title;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, STATEBARHEIGHT, self.view.bounds.size.width, self.view.bounds.size.height - STATEBARHEIGHT)];
        self.webView.navigationDelegate = self;
        [self.webView loadRequest:({
            NSURL *url = [NSURL URLWithString:self.URLString];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            request;
        })];
        
        //添加观察者监听
        [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        
        self.webView;
        
    })];
    
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, STATEBARHEIGHT+44, self.view.bounds.size.width, 20)];
        // 自定义状态颜色 默认是灰色变成蓝色
//        self.progressView.backgroundColor = [UIColor redColor];
//        self.progressView.progressTintColor = [UIColor greenColor];
//        self.progressView.trackTintColor = [UIColor blueColor];
        
        self.progressView;
    })];
    // Do any additional setup after loading the view.
}
#pragma mark - observer's mehtods
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    printf("progress : %lf",
        self.webView.estimatedProgress);
    self.progressView.progress = self.webView.estimatedProgress;
}

#pragma mark - WKWebViewNavigationDelegate's methods
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSLog(@"");
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"didFinishNavigation");
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
- (__kindof UIViewController *)detailWebWithURL:(NSString *)webURL andTitle:(NSString *)title
{
    UIViewController *viewController = [[[self class] alloc] performSelector:NSSelectorFromString(@"initWithURL:andTitle:") withObject:webURL withObject:title];
    return viewController;
}


@end
