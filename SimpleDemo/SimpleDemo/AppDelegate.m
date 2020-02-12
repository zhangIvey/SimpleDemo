//
//  AppDelegate.m
//  SimpleDemo
//
//  Created by yaoln on 2019/12/10.
//  Copyright © 2019 zz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "NewsViewController.h"
#import "VideoViewController.h"

@interface AppDelegate ()<UISceneDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
/*
    NewsViewController *viewController = [[NewsViewController alloc] init];
    VideoViewController *viewController1 = [[VideoViewController alloc] init];
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
 */
    

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[ViewController alloc] init];
    window.rootViewController.view.backgroundColor = [UIColor redColor];
    self.window = window;
    [self.window makeKeyAndVisible];
    return true;
    

}
/*
#pragma mark - UISceneDelegate delegate methods
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions
API_AVAILABLE(ios(13.0)){
    
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
