//
//  PersonService.m
//  HMKitchenSink
//
//  Created by Alan Gorton on 09/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import "PersonService.h"
#import "Person.h"

@interface PersonService ()

@end

@implementation PersonService

+ (NSArray *)findPeopleNearLocation:(CLLocationCoordinate2D)location distance:(CLLocationDistance)distance
{
    NSString *urlFormat = @"https://fakename.azurewebsites.net/api/1/people/near/%f/%f/%f";
    NSString *urlString = [NSString
                           stringWithFormat:urlFormat,
                           location.latitude,
                           location.longitude,
                           distance];
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSError *error;
    
    NSArray *jsonObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@"%@", urlString);
    
    if (data) {
        // NSLog(@"%@", (NSString*)data.bytes);
    }
    
    if (error) {
        NSLog(@"%@", error);
    }
    
    // NSLog(@"%@", jsonObjects);
    
    NSMutableArray *people = [[NSMutableArray alloc] init];
    
    for (NSDictionary *each in jsonObjects) {
        Person *person = [[Person alloc] init];
        
        person.firstName = [each objectForKey:@"firstName"];
        person.initials = [each objectForKey:@"initials"];
        person.lastName = [each objectForKey:@"lastName"];
        
        person.gender = [each objectForKey:@"gender"];
        
        person.addressLine1 = [each objectForKey:@"addressLine1"];
        person.city = [each objectForKey:@"city"];
        person.county = [each objectForKey:@"county"];
        person.postCode = [each objectForKey:@"postCode"];
        
        person.mobilePhoneNumber = [each objectForKey:@"mobilePhoneNumber"];
        
        person.emailAddress = [each objectForKey:@"emailAddress"];
        person.userName = [each objectForKey:@"userName"];
        person.password = [each objectForKey:@"password"];

        NSDictionary *geo = [each objectForKey:@"geo"];
        
        person.latitude = [[geo objectForKey:@"lat"] doubleValue];
        person.longitude = [[geo objectForKey:@"lon"] doubleValue];
        
        
        [people addObject:person];
    }
    
    return people;
}

@end
