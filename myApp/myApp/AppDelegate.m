//
//  AppDelegate.m
//  myApp
//
//  Created by 张东伟 on 17/8/25.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "AppDelegate.h"
#import "OnPlayViewController.h"
#import "MineViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    OnPlayViewController *homeVC = [[OnPlayViewController alloc] init];
    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNavi.tabBarItem.title = @"主页";
    homeNavi.tabBarItem.image = [UIImage imageNamed:@"tabbarHome"] ;
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    UINavigationController *mineNavi = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineNavi.tabBarItem.title = @"我的";
    mineNavi.tabBarItem.image = [UIImage imageNamed:@"tabbarMine"];
    
    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
    tabbarVC.viewControllers = @[homeNavi,mineNavi];
    tabbarVC.tabBar.tintColor = AppTintColor;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabbarVC;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
