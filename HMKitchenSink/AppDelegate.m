//
//  AppDelegate.m
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "HomeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Register for local notifications.
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    HomeViewController *homeViewController = [[HomeViewController alloc] init];

    self.window.rootViewController = homeViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

// Delegation methods
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    const void *devTokenBytes = [devToken bytes];
    
    NSLog(@"-----");
    NSLog(@"%@", devToken);
    NSLog(@"-----");
    
    // TODO: self.registered = YES;
    NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken");
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError: %@", err);
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    // NSString *itemName = [notification.userInfo objectForKey:ToDoItemKey]
    
    NSLog(@"%@", notification.alertBody);
    // application.applicationIconBadgeNumber -= 1;
}

@end
