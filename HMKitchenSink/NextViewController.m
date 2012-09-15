//
//  NextViewController.m
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

@synthesize person = _person;
@synthesize personFullNameLabel = _personFullNameLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Next View";
    self.navigationItem.hidesBackButton = YES;
    
    if (self.person) {
        self.personFullNameLabel.text = self.person.fullName;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Event Handlers

- (IBAction)tapBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setPersonFullNameLabel:nil];
    [super viewDidUnload];
}
@end
