//
//  TimesheetViewController.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimesheetViewController.h"
#import "Day.h"
#import "AbsenceType.h"
#import "ConfirmationViewController.h"

@implementation TimesheetViewController

@synthesize timesheet;
@synthesize week1Controller;
@synthesize week2Controller;
@synthesize weekSwitch;
@synthesize payPeriodLabel;

@synthesize detailViewController = _detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        timesheet = [[Timesheet alloc] initTimesheet];
        
        // add the week one view
        if (!week1Controller) {
            week1Controller = [[WeekOneTableViewController alloc] initWithNibName:@"WeekOneTableViewController" bundle:nil];
        }
        week1Controller.tableView.frame = CGRectMake(20, 50+29, week1Controller.tableView.frame.size.width, self.week1Controller.tableView.frame.size.height);
        week1Controller.days = timesheet.week1;
        week1Controller.delegate = self;
        [self.view addSubview:week1Controller.tableView];
        
        
        // now add week two
        if (!week2Controller) {
            week2Controller = [[WeekOneTableViewController alloc] initWithNibName:@"WeekOneTableViewController" bundle:nil];
        }
        week2Controller.tableView.frame = CGRectMake(20, 150+29, week2Controller.tableView.frame.size.width, self.week2Controller.tableView.frame.size.height);        
        week2Controller.days = timesheet.week2;
        week2Controller.delegate = self;
        [self.view addSubview:week2Controller.tableView];
        
        
        // hide week two
        [week2Controller.view setHidden:YES];
        
        
        // add the confirm button
        UIBarButtonItem *confirm = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStyleBordered target:self action:@selector(confirm:)];
        [[self navigationItem] setRightBarButtonItem:confirm];
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


-(IBAction)switchWeek:(id)sender{
    if(weekSwitch.selectedSegmentIndex == 0){
        // hide week2 
        [week2Controller.view setHidden:YES];
        
        // show week 1
        [week1Controller.view setHidden:NO];
	}
	if(weekSwitch.selectedSegmentIndex == 1){
        // hide week1 
        [week1Controller.view setHidden:YES];
        
        // show week two
        [week2Controller.view setHidden:NO];
        
	}
}

-(void)confirm:(id)sender  {
    int numHours = 70;
    
    // check if any absences
    int hoursOff = 0;
    NSArray *w = week1Controller.days;
    for (int i=0; i < w.count; i++) {
        Day *d = [w objectAtIndex:i];
        if (d.absences != nil) {
            // add up the hours
            for (int j=0; j < d.absences.count; j++) {
                AbsenceType *a = [d.absences objectAtIndex:i];
                hoursOff += a.hours;
            }
        }
    }
    w = week2Controller.days;
    for (int i=0; i < w.count; i++) {
        Day *d = [w objectAtIndex:i];
        if (d.absences != nil) {
            // add up the hours
            for (int j=0; j < d.absences.count; j++) {
                AbsenceType *a = [d.absences objectAtIndex:i];
                hoursOff += a.hours;
            }
        }
    }
    
    numHours -= hoursOff;
    
    // TODO - figure out the hours worked
    
    NSString *msg = [NSString stringWithFormat:@"By clicking the OK button below, you are confirming that you worked %d hours during this pay period.", numHours];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Confirm"
                          message: msg
                          delegate: self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:@"Accept",nil];
    [alert show];
}

#pragma mark UIAlertDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 1) {        
        NSLog(@"Submit");
        
        // save all the absence values to NSUserDefaults
        NSDictionary *wk1AbsencesToSave = [[NSDictionary alloc] init];
        NSArray *w = week1Controller.days;
        for (int i=0; i < w.count; i++) {
            Day *d = [w objectAtIndex:i];
            if (d.absences != nil) {
                NSDictionary *dayDict = [[NSDictionary alloc] init];
                // add up the hours
                for (int j=0; j < d.absences.count; j++) {
                    AbsenceType *a = [d.absences objectAtIndex:i];
                    [dayDict setValue:[NSString stringWithFormat:@"%d", a.hours] forKey:a.absenceName];
                }                
                [wk1AbsencesToSave setValue:dayDict forKey:d.dayName];
            }
        }
        w = week2Controller.days;
        NSDictionary *wk2AbsencesToSave = [[NSDictionary alloc] init];
        for (int i=0; i < w.count; i++) {
            Day *d = [w objectAtIndex:i];
            if (d.absences != nil) {
                NSDictionary *dayDict = [[NSDictionary alloc] init];
                // add up the hours
                for (int j=0; j < d.absences.count; j++) {
                    AbsenceType *a = [d.absences objectAtIndex:i];
                    [dayDict setValue:[NSString stringWithFormat:@"%d", a.hours] forKey:a.absenceName];
                }
                [wk2AbsencesToSave setValue:dayDict forKey:d.dayName];
            }
        }
        
        NSMutableDictionary *timesheetToSave = [[NSMutableDictionary alloc] init];  
        
        NSRange range = [payPeriodLabel.text rangeOfString:@":"];
        NSString *payPeriodStr = [payPeriodLabel.text substringFromIndex:range.location+1];
        [timesheetToSave setObject:payPeriodStr forKey:@"pay period" ];
        [timesheetToSave setObject:wk1AbsencesToSave forKey:@"week 1"];
        [timesheetToSave setObject:wk1AbsencesToSave forKey:@"week 2"];
        
        // Get current datetime
        NSDate *currentDateTime = [NSDate date];
        
        // Instantiate a NSDateFormatter
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        // Set the dateFormatter format
        [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm"];
        
        // Get the date time in NSString
        NSString *dateInString = [dateFormatter stringFromDate:currentDateTime];
        
        [timesheetToSave setValue:dateInString forKey:@"submitted"];
        
        // write to the plist
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/timesheets.plist"];
        NSMutableArray *plist = [NSMutableArray arrayWithContentsOfFile:path];
        if (plist == nil) {
            plist = [NSMutableArray array];
        }
        [plist addObject:timesheetToSave];
        [plist writeToFile:path atomically:YES];
        
        // push the confirmation view
        ConfirmationViewController *m = [[ConfirmationViewController alloc] initWithNibName:@"ConfirmationViewController" bundle:nil];
        m.payPeriodStr = payPeriodLabel.text;
        [self.navigationController pushViewController:m animated:YES];
	} 
    
}

#pragma mark WeekTableViewDelegate


- (void)didSelectWeek:(Day *)d {
    // i think i have to make the parent push the view
     if (!self.detailViewController) {
     self.detailViewController = [[AbsenceViewController alloc] initWithNibName:@"AbsenceViewController" bundle:nil];
     }
     self.detailViewController.d = d;
     [self.navigationController pushViewController:self.detailViewController animated:YES];
     
}

@end
