//
//  SignInViewControllerDelegate.h
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SignInViewControllerDelegate <NSObject>

- (void)signInCancelled;
- (void)signInWithUserName:(NSString *)name password:(NSString *)password;

@end
