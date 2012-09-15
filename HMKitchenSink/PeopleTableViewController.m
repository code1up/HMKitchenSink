//
//  PeopleTableViewController.m
//  HMKitchenSink
//
//  Created by Alan Gorton on 12/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import "PeopleTableViewController.h"
#import "NextViewController.h"
#import "Person.h"

@interface PeopleTableViewController ()

@end

@implementation PeopleTableViewController

@synthesize people = _people;

- (PeopleTableViewController *)initWithPeople:(NSArray *)people
{
    self = [super init];
    
    if (self) {
        self.people = people;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"People";
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"PersonCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    Person *person = (Person *)[self.people objectAtIndex:indexPath.row];
    NSString *format = @"%@, %@";
    
    cell.textLabel.text = person.fullName;
    cell.detailTextLabel.text = [NSString stringWithFormat:format, person.addressLine1, person.postCode];

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NextViewController *viewController = [[NextViewController alloc] init];
    Person *person = (Person *)[self.people objectAtIndex:indexPath.row];
    
    viewController.person = person;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
