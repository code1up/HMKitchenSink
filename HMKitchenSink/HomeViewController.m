//
//  HomeViewController.m
//  HMKitchenSink
//
//  Created by Alan Gorton on 08/09/2012.
//  Copyright (c) 2012 Alan Gorton. All rights reserved.
//

#import "HomeViewController.h"
#import "SignInViewController.h"
#import "UserMapViewController.h"
#import "ZBarSDK.h"

@interface HomeViewController () <ZBarReaderDelegate>

@end

@implementation HomeViewController

@synthesize titleLabel = _titleLabel;
@synthesize image = _image;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // TODO: generally, revisit shouldAutorotateToInterfaceOrientation.
    return YES;
}

#pragma mark - Event Handlers

- (IBAction)tapSignIn {
    SignInViewController *viewController = [[SignInViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    viewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    viewController.delegate = self;
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (IBAction)tapScan {
    NSLog(@"tapScan");
    
    // ADD: present a barcode reader that scans from the camera feed
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentModalViewController: reader
                            animated: YES];
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    
    for (symbol in results) {
        // EXAMPLE: just grab the first barcode
        break;
    }
    
    // EXAMPLE: do something useful with the barcode data
    self.titleLabel.text = symbol.data;
    
    // EXAMPLE: do something useful with the barcode image resultImage.image =
    self.image.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];
}

#pragma mark - SignInViewControllerDelegate

- (void)signInCancelled
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)signInWithUserName:(NSString *)name password:(NSString *)password
{
    [self dismissViewControllerAnimated:YES completion:^{
        UserMapViewController *viewController = [[UserMapViewController alloc] init];
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        
        viewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        viewController.delegate = self;
        
        [self presentViewController:navigationController animated:YES completion:^{
            NSLog(@"completed");
        }];
    }];
}

#pragma mark - UserMapViewControllerDelegate

- (void)home
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setTitleLabel:nil];
    [self setImage:nil];
    [super viewDidUnload];
}
@end
