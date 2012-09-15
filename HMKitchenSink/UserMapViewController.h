//
//  UserMapViewController.h
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "UserMapViewControllerDelegate.h"

@interface UserMapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, weak) id <UserMapViewControllerDelegate> delegate;

@end
