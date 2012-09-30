//
//  ConfirmationViewController.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfirmationViewController.h"
#import "MainViewController.h"

@implementation ConfirmationViewController

@synthesize payPeriodLabel;
@synthesize payPeriodStr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //hide the back button in navbar
        [self.navigationItem setHidesBackButton:YES animated:NO];
    
        [[self navigationItem] setTitle:@"Confirmation"];
        
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSRange range = [payPeriodStr rangeOfString:@":"];
    payPeriodLabel.text = [payPeriodStr substringFromIndex:range.location+1];
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


-(IBAction)viewLog:(id)sender{
    //NSLog(@"View log");
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:1] animated:YES];

}

-(IBAction)logout:(id)sender{
    //NSLog(@"Logout");
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
