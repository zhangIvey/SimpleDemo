//
//  AppDelegate.m
//  SimpleDemo
//
//  Created by yaoln on 2019/12/10.
//  Copyright © 2019 zz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];



    ViewController *viewController = [[ViewController alloc] init];
    viewController.tabBarItem.title = @"资讯";
    viewController.tabBarItem.image = [UIImage imageNamed:@"page@2x"];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:@"page_selected@2x"];
    viewController.view.backgroundColor = [UIColor whiteColor];


    ViewController *viewController1 = [[ViewController alloc] init];
    viewController1.tabBarItem.title = @"视频";
    viewController1.tabBarItem.image = [UIImage imageNamed:@"video@2x"];
    viewController1.tabBarItem.selectedImage = [UIImage imageNamed:@"video_selected@2x"];
    viewController1.view.backgroundColor = [UIColor redColor];

    ViewController *viewController2 = [[ViewController alloc] init];
    viewController2.tabBarItem.title = @"关注";
    viewController2.tabBarItem.image = [UIImage imageNamed:@"like@2x"];
    viewController2.tabBarItem.selectedImage = [UIImage imageNamed:@"like_selected@2x"];
    viewController2.view.backgroundColor = [UIColor yellowColor];


    ViewController *viewController3 = [[ViewController alloc] init];
    viewController3.tabBarItem.title = @"我的";
    viewController3.tabBarItem.image = [UIImage imageNamed:@"home@2x"];
    viewController3.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected@2x"];
    viewController3.view.backgroundColor = [UIColor blueColor];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[viewController,viewController1,viewController2,viewController3]];

    UINavigationController *navigationController = [[UINavigationController alloc] init];
    navigationController.viewControllers = @[tabBarController];


    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
