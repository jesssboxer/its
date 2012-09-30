//
//  AbsenceViewController.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AbsenceViewController.h"
#import "EditAbsenceTableViewController.h"

@implementation AbsenceViewController

@synthesize d;
@synthesize detailViewController;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // add the masterviewcontroller timesheet log tableview
    if (!detailViewController) {
        detailViewController = [[EditAbsenceTableViewController alloc] initWithNibName:@"EditAbsenceTableViewController" bundle:nil];
    }
    detailViewController.d = d;
    [self.view addSubview:detailViewController.tableView];
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

@end
