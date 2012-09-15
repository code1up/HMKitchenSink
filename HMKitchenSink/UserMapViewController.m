//
//  UserMapViewController.m
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "UserMapViewController.h"
#import "NextViewController.h"
#import "PeopleTableViewController.h"
#import "PersonService.h"
#import "Person.h"
#import "PersonAnnotation.h"

@interface UserMapViewController () <CLLocationManagerDelegate>

- (void)tapNextButton;
- (void)tapHomeButton;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSArray *people;
@property (nonatomic) BOOL hasPeople; // TODO: HACK

@end

@implementation UserMapViewController

@synthesize delegate = _delegate;
@synthesize locationManager = _locationManager;
@synthesize people = _people;
@synthesize hasPeople = _hasPeople;

- (void)viewDidLoad
{
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                   target:self
                                   action:@selector(tapHomeButton)];
                                   
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Next"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(tapNextButton)];
    
    // Create location manager.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    // Customize the view.
    self.navigationItem.title = @"Map";
    
    self.navigationItem.leftBarButtonItem = homeButton;
    self.navigationItem.rightBarButtonItem = nextButton;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D location = userLocation.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 2000, 2000);
    
    [mapView setRegion:region animated:YES];
    
    NSLog(@"mapView:didUpdateUserLocation:");
    
    if (self.hasPeople) {
        // TODO: HACK
        return;
    }

    self.hasPeople = YES;
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(globalQueue, ^{
        self.people = [PersonService findPeopleNearLocation:location
                                                   distance:0.06];

        NSLog(@"People: %d", [self.people count]);
        
        dispatch_async(mainQueue, ^{
            for (Person* person in self.people) {
                CLLocationCoordinate2D coordinate;
                
                coordinate.latitude = person.latitude;
                coordinate.longitude = person.longitude;
                
                PersonAnnotation *annotation = [[PersonAnnotation alloc]
                                                initWithPerson:person
                                                coordinate:coordinate];
                
                [mapView addAnnotation:annotation];
            }
        });
    });
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    /*
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id <MKAnnotation> mp = [annotationView annotation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 1000, 1000);
    [mapView setRegion:region animated:YES];
    */
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *identifier = @"PersonAnnotation";
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    if ([annotation isKindOfClass:[PersonAnnotation class]]) {
        PersonAnnotation *personAnnotation = (PersonAnnotation *)annotation;
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (!annotationView) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:personAnnotation reuseIdentifier:identifier];
            
            annotationView.animatesDrop = YES;
            annotationView.canShowCallout = YES;
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
            /*
            [button addTarget:self action:@selector(showPerson) forControlEvents:UIControlEventTouchUpInside];
            */
            
            annotationView.rightCalloutAccessoryView = button;
            
        } else {
            annotationView.annotation = personAnnotation;
        }
        
        MKPinAnnotationColor pinColor;
        
        if ([personAnnotation.person.gender isEqualToString:@"M"]) {
            pinColor = MKPinAnnotationColorGreen;
        } else {
            pinColor = MKPinAnnotationColorPurple;
        }
        
        annotationView.pinColor = pinColor;
        
        return annotationView;
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    if ([view isKindOfClass:[MKPinAnnotationView class]]) {
        NextViewController *viewController = [[NextViewController alloc] init];
        
        PersonAnnotation *personAnnotation = (PersonAnnotation *)view.annotation;
        
        viewController.person = personAnnotation.person;
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (void)tapNextButton
{
    PeopleTableViewController *viewController = [[PeopleTableViewController alloc] initWithPeople:self.people];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)tapHomeButton
{
    [self.delegate home];
}
                                   
@end
