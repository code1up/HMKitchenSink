//
//  Person.h
//  HMKitchenSink
//
//  Created by Alan Gorton on 11/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *initials;
@property (nonatomic, strong) NSString *lastName;

@property (nonatomic, readonly) NSString *fullName;

@property (nonatomic, strong) NSString *gender;

@property (nonatomic, strong) NSString *addressLine1;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *county;
@property (nonatomic, strong) NSString *postCode;

@property (nonatomic, strong) NSString *mobilePhoneNumber;

@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;

// TODO: make CLLocationCoordinate2D.
@property CLLocationDegrees longitude;
@property CLLocationDegrees latitude;

@end
