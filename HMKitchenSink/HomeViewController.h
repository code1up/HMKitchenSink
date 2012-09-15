//
//  HomeViewController.h
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignInViewControllerDelegate.h"
#import "UserMapViewControllerDelegate.h"

@interface HomeViewController : UIViewController <SignInViewControllerDelegate, UserMapViewControllerDelegate>

- (IBAction)tapSignIn;
- (IBAction)tapScan;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
