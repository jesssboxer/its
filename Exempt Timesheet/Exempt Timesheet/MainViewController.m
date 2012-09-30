//
//  MainViewController.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MasterViewController.h"
#import "TimesheetViewController.h"

@implementation MainViewController

@synthesize masterViewController = _masterViewController;
@synthesize currentPayPeriodLabel;

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
    
    // show the nav bar
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [[self navigationItem] setTitle:@"Exempt Employee"];
    
    // add the masterviewcontroller timesheet log tableview
    if (!self.masterViewController) {
        self.masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
    }
    self.masterViewController.tableView.frame = CGRectMake(20, 150, self.masterViewController.tableView.frame.size.width, self.masterViewController.tableView.frame.size.height);
    
    [self.view addSubview:self.masterViewController.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.masterViewController loadSavedTimesheets];
    [self.masterViewController.tableView reloadData];
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


-(IBAction)editTimesheet:(id)sender {
    NSLog(@"edit me!");
    
    // go straight to the edit timesheet view
    TimesheetViewController *m = [[TimesheetViewController alloc] initWithNibName:@"TimesheetViewController" bundle:nil];
    m.payPeriodLabel.text = [NSString stringWithFormat:@"Pay Period: %@", currentPayPeriodLabel.text];
    [self.navigationController pushViewController:m animated:YES];
}

@end
