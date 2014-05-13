//
//  SHAppDelegate.m
//  Shiroitoko
//
//  Created by EndoTsuyoshi on 2014/05/11.
//  Copyright (c) 2014年 tsuyoshi. All rights reserved.
//

#import "SHAppDelegate.h"
#import "GAI.h"

@implementation SHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
//    [[DeployGateSDK sharedInstance] launchApplicationWithAuthor:@"tuyo" key:@"cde96ad604139b1ff49b4ba8df840025eb18dfc5"];
    [[DeployGateSDK sharedInstance] launchApplicationWithAuthor:@"tuyo" key:@"cde96ad604139b1ff49b4ba8df840025eb18dfc5" userInfomationEnabled:YES];
    
    
    
    NSString *strTrackingId = @"UA-50924929-2";
    // GoogleAnalytics
    // (オプション)キャッチされない例外エラーをトラッキングするか。デフォルト:有効
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // (オプション)ディスパッチインターバル。デフォルト:20秒
    [GAI sharedInstance].dispatchInterval = 20;
    
    // (オプション)YESにするとより多くのデバッグ情報を取得する。デフォルト:有効
//    [GAI sharedInstance].debug = YES;
    
    // トラッカーインスタンスの生成。自分のトラッカーIDに変える
    id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:strTrackingId];
    
    // トラッカーIDひとつしか使わないならここでデフォルトトラッカーを置き換え
    [GAI sharedInstance].defaultTracker = tracker;
    
    
    
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.shViewController = [[SHViewController alloc] init];//最初に立ち上げるviewControllerを変更する場合はここを変更
    self.firstViewController = (UIViewController *)[[SHInitViewController alloc] init];
    
    //navigationControllerによってviewControllerを内包しておけばrootViewControllerにも戻れる
    UINavigationController *navCon =
    [[UINavigationController alloc]
     initWithRootViewController:self.firstViewController];
//    self.window.rootViewController = self.firstViewController;
    self.window.rootViewController = navCon;
    [self.window makeKeyAndVisible];
    
    
    
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    UIViewController *con = [[STViewController alloc] init];
//    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:con];
//    
//    self.viewController = navCon;
//    self.window.rootViewController = self.viewController;
//    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    return [[DeployGateSDK sharedInstance] handleOpenUrl:url sourceApplication:sourceApplication annotation:annotation];
}

@end
