//
//  AppDelegate.m
//  DribbbleTest
//
//  Created by Dmitriy Korkin on 1/20/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MagicalRecord setupAutoMigratingCoreDataStack];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //Fill shots from Plist to DB
    //[[DataBaseManager sharedInstance] fillDataBaseFromPlist:@"ShotsPList"];
    //[[DribbleDownLoadManager sharedInstance] requestForShotsFromPages:@[@1, @2]];
    
    self.tabBarController = [self tabBarControllerInitialisationWithItems:[self tabBarItems]];
    self.window.rootViewController = self.tabBarController;
    

    return YES;
}

-(UITabBarController*) tabBarControllerInitialisationWithItems:(NSArray *)items {
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.tabBar.tintColor = [UIColor blackColor];
    tabBarVC.viewControllers = items;
    return tabBarVC;
}

-(NSArray *) tabBarItems {
    ShotViewController *shotVC = [ShotViewController new];
    shotVC.tabBarItem.title = @"Shots";
    shotVC.tabBarItem.image = [UIImage imageNamed:@"MobileMailSettings_mailbox@2x"];
    
    FavoritesViewController *favoritesVC = [FavoritesViewController new];
    favoritesVC.tabBarItem.title = @"Favorites";
    favoritesVC.tabBarItem.image = [UIImage imageNamed:@"ABFavoriteBadge@2x"];
    
    SettingsViewController *settingsVC = [SettingsViewController new];
    settingsVC.tabBarItem.title = @"Settings";
    settingsVC.tabBarItem.image = [UIImage imageNamed:@"settings-icon1@2x"];
    
    return [[NSArray alloc]initWithObjects:shotVC, favoritesVC, settingsVC,nil];
    
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

@end
