//
//  NextViewController.h
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface NextViewController : UIViewController

@property (nonatomic, strong) Person *person;

- (IBAction)tapBackButton;

@property (nonatomic, weak) IBOutlet UILabel *personFullNameLabel;

@end
