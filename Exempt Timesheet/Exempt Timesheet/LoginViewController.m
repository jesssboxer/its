//
//  LoginViewController.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "LDAPService.h"
#import "MainViewController.h"
#import "AppDelegate.h"

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // show the nav bar
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    errorLabel.hidden = YES;
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

-(IBAction)login:(id)sender {
    NSLog(@"login!");
    LDAPService *ls = [LDAPService alloc];
    //BOOL wasSuccessful = [ls simple_ldap:cwid.text bindPW:passwd.text];
    BOOL wasSuccessful = YES; // TESTING, uncomment above when done testing!!!!!
    
    if (wasSuccessful) {
        //NSLog(@"YAY login successful!");
        errorLabel.hidden = YES;
        
        MainViewController *m = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:nil action:nil];
        [[self navigationItem] setBackBarButtonItem:backButton];
        [self.navigationController pushViewController:m animated:YES];
    
    } else {
        //NSLog(@"BOOOO login unsuccessful!");
        errorLabel.hidden = NO;
    }
}

@end
