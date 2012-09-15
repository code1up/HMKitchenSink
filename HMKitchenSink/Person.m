//
//  Person.m
//  HMKitchenSink
//
//  Created by Alan Gorton on 11/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize firstName = _firstName;
@synthesize initials = _initials;
@synthesize lastName = _lastName;

@synthesize gender = _gender;

@synthesize addressLine1 = _addressLine1;
@synthesize city = _city;
@synthesize county = _county;
@synthesize postCode = _postCode;

@synthesize mobilePhoneNumber = _mobilePhoneNumber;

@synthesize emailAddress = _emailAddress;
@synthesize userName = _userName;
@synthesize password = _password;

@synthesize latitude = _latitude;
@synthesize longitude = _longitude;

- (NSString *)fullName
{
    NSString *format2 = @"%@ %@ %@";
    NSString *format3 = @"%@ %@ %@";
    
    if (self.initials) {
        return [NSString stringWithFormat:format3, self.firstName, self.initials, self.lastName];
    }
    
    return [NSString stringWithFormat:format2, self.firstName, self.lastName];
}

@end
