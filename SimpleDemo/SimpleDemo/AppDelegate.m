//
//  AppDelegate.m
//  SimpleDemo
//
//  Created by yaoln on 2019/12/10.
//  Copyright © 2019 zz. All rights reserved.
//

#import "AppDelegate.h"
#import "MineHomeViewController.h"

#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RecommandViewController.h"
#import "StartTheView.h"

@interface AppDelegate ()<UISceneDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions
{
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    
    VideoViewController *videoViewController = [[VideoViewController alloc] init];
    
    
    RecommandViewController *recommandViewController = [[RecommandViewController alloc] init];

    MineHomeViewController *mineHomeViewController = [[MineHomeViewController alloc] init];
    mineHomeViewController.tabBarItem.title = @"我的";
    mineHomeViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x"];
    mineHomeViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x"];
    mineHomeViewController.view.backgroundColor = [UIColor blueColor];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[newsViewController,videoViewController,recommandViewController,mineHomeViewController]];

    UINavigationController *navigationController = [[UINavigationController alloc] init];
    navigationController.viewControllers = @[tabBarController];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:({
        StartTheView *adView = [[StartTheView alloc] initWithFrame:self.window.bounds];
        adView;
    })];
    return YES;
}

// 当通过URL Scheme 唤起的时候，
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    NSLog(@"openURL = %@",url);
    NSLog(@"options = %@",options);
    return YES;;
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

/*
#pragma mark - UISceneDelegate delegate methods
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions
API_AVAILABLE(ios(13.0)){
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    [self.window setWindowScene:windowScene];
    
    //=== 根控制器的部署
    
    UIViewController *rootVC = [[UIViewController alloc] init];
    rootVC.view.backgroundColor = [UIColor redColor];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window setRootViewController:rootVC];
    
    //===
    [self.window makeKeyAndVisible];
     
}
 */




#pragma mark - UISceneSession lifecycle

/*
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    if (@available(iOS 13.0, *)) {
        return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
    } else {
        // Fallback on earlier versions
        return nil;
    }
}
*/
 
/*
- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    
}
 */

 
@end
