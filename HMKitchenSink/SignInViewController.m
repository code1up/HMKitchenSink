//
//  SignInViewController.m
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController () <UITextFieldDelegate>

- (void)addNavigationButtons;
- (void)cancelled;
- (void)signIn;

@property (nonatomic, weak) UITextField *activeTextField;

// TODO: add other private methods.
- (void)resetScrollView;

@end

@implementation SignInViewController

// Public properties.
@synthesize delegate = _delegate;
@synthesize scrollView = _scrollView;
@synthesize emailTextField = _emailTextField;
@synthesize passwordTextField = _passwordTextField;

// Private properties.
@synthesize activeTextField = _activeTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.navigationController) {
        [self addNavigationButtons];
    }
    
    [self registerForKeyboardNotifications];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

#pragma mark Keyboard Handling

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)keyboardWasShown:(NSNotification*)notification
{
    NSDictionary* info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGFloat keyboardHeight = keyboardSize.height;
    UITextField *textField = self.passwordTextField;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardHeight, 0.0);
    
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect rect = self.view.frame;
    
    rect.size.height -= keyboardHeight;
    
    if (!CGRectContainsPoint(rect, textField.frame.origin) ) {
        CGFloat textFieldTop = textField.frame.origin.y;
        CGFloat textFieldHeight = textField.frame.size.height;
        
        CGPoint scrollPoint = CGPointMake(0.0, textFieldTop - keyboardHeight + (textFieldHeight * 2));
        
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    [self resetScrollView];
}

- (void)resetScrollView
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeTextField = nil;
}

#pragma mark Private Implementation

- (void)addNavigationButtons
{
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelled)];

    UIBarButtonItem *signInButton = [[UIBarButtonItem alloc] initWithTitle:@"Sign In" style:UIBarButtonItemStyleDone target:self action:@selector(signIn)];

    signInButton.title = @"Sign In";
    
    self.navigationItem.leftBarButtonItem = cancelButton;
    self.navigationItem.rightBarButtonItem = signInButton;
}

- (void)cancelled
{
    [self.delegate signInCancelled];
}

- (void)signIn
{
    [self.delegate signInWithUserName:@"john.doe@example.com" password:@"password"];
}

@end
