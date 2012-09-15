//
//  SignInViewController.h
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignInViewControllerDelegate.h"

@interface SignInViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;

@property (nonatomic, weak) id <SignInViewControllerDelegate> delegate;

@end
