//
//  PersonService.h
//  HMKitchenSink
//
//  Created by Alan Gorton on 09/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PersonService : NSObject

+ (NSArray *)findPeopleNearLocation:(CLLocationCoordinate2D)location distance:(CLLocationDistance)distance;

@end
