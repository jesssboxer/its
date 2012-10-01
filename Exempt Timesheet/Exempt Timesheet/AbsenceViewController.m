//
//  AbsenceViewController.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AbsenceViewController.h"
#import "EditAbsenceTableViewController.h"
#import "AbsenceTypeTableViewController.h"

@implementation AbsenceViewController

@synthesize d;
@synthesize detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        // add the save button
        UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveHours:)];
        [[self navigationItem] setRightBarButtonItem:save];
        
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
    
    
    [[self navigationItem] setTitle:@"Edit Hours"];
    
    // add the masterviewcontroller timesheet log tableview
    if (!detailViewController) {
        detailViewController = [[EditAbsenceTableViewController alloc] initWithNibName:@"EditAbsenceTableViewController" bundle:nil];
    }
    detailViewController.d = d;
    detailViewController.delegate = self;
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



-(void)saveHours:(id)sender {
    NSLog(@"save to absences and reload table");
}



-(void)didSelectToEditAbsenceType {
    NSLog(@"selected to edit absence type");
    AbsenceTypeTableViewController *absenceTypeTableViewController = [[AbsenceTypeTableViewController alloc] initWithNibName:@"AbsenceTypeTableViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    absenceTypeTableViewController.delegate = self;
    [self.navigationController pushViewController:absenceTypeTableViewController animated:YES];
}


-(void)didSelectAbsenceType:(NSString *)absenceType {
    NSLog(@"selected absence type: %@", absenceType);
    // set absence type cell to display selected absenceType
    
}

@end
