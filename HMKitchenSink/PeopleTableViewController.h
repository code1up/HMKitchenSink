//
//  PeopleTableViewController.h
//  HMKitchenSink
//
//  Created by Alan Gorton on 12/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleTableViewController : UITableViewController

@property (nonatomic, copy) NSArray* people;

- (PeopleTableViewController *)initWithPeople:(NSArray *)people;

@end
