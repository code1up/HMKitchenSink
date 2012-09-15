//
//  PersonAnnotation.m
//  HMKitchenSink
//
//  Created by Alan Gorton on 11/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import "PersonAnnotation.h"

@implementation PersonAnnotation

@synthesize person = _person;
@synthesize coordinate = _coordinate;

- (PersonAnnotation *)initWithPerson:(Person *)person coordinate:(CLLocationCoordinate2D)coordinate
{
    self.person = person;
    self.coordinate = coordinate;
    
    return self;
}

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate
{
    _coordinate.latitude = coordinate.latitude;
    _coordinate.longitude = coordinate.longitude;
}

- (NSString *)title
{
    return self.person.fullName;
}

- (NSString *)subtitle
{
    NSString *format = @"%@, %@";
    
    return [NSString stringWithFormat:format, self.person.addressLine1, self.person.postCode];
}

@end
