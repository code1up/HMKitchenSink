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
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    HomeViewController *homeViewController = [[HomeViewController alloc] init];

    self.window.rootViewController = homeViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
