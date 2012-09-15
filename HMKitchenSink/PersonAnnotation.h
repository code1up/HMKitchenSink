//
//  PersonAnnotation.h
//  HMKitchenSink
//
//  Created by Alan Gorton on 11/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Person.h"

@interface PersonAnnotation : NSObject <MKAnnotation>

- (PersonAnnotation *)initWithPerson:(Person *)person coordinate:(CLLocationCoordinate2D)coordinate;

@property (nonatomic, weak) Person* person;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subtitle;

@end
