//
//  AppDelegate.m
//  3D touch
//
//  Created by 王昆 on 15/10/9.
//  Copyright © 2015年 wangkun. All rights reserved.
//

#import "AppDelegate.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeInvitation];
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"1" localizedTitle:@"么么哒"];
    item1.icon = icon1;
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeContact];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"2" localizedTitle:@"萌萌哒" localizedSubtitle:@"看这里是不是想到了tableView" icon:icon2 userInfo:nil];
    application.shortcutItems = @[item1,item2];
    
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey]) return NO;
    
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    if ([shortcutItem.localizedTitle isEqualToString:@"New Message"])
    {
        
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"老板" message:@"过来办公室，发妹子了" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"马上就来" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertC dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertC addAction:action];
        [self.window.rootViewController presentViewController:alertC animated:YES completion:nil];
        
    }
    else if ([shortcutItem.localizedTitle isEqualToString:@"Favorites"])
    {
        
        UINavigationController *naVC = (UINavigationController *)self.window.rootViewController;
        [naVC popToRootViewControllerAnimated:NO];
        ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
        [naVC pushViewController:thirdVC animated:YES];
    }
    else if ([shortcutItem.localizedTitle isEqualToString:@"么么哒"])
    {
        NSLog(@"么么哒");
        UINavigationController *naVC = (UINavigationController *)self.window.rootViewController;
        [naVC popToRootViewControllerAnimated:NO];
        SecondViewController *secondVC = [[SecondViewController alloc]init];
        [naVC pushViewController:secondVC animated:YES];
    }
    else if ([shortcutItem.localizedTitle isEqualToString:@"萌萌哒"])
    {
        NSLog(@"萌萌哒");
    }
}








- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
