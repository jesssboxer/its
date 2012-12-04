//
//  TimesheetViewController.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define kTimesheetsURL [NSURL URLWithString: @"http://thisisit.local:8888/its_distro/rest/node"]

#import "TimesheetViewController.h"
#import "Day.h"
#import "AbsenceType.h"
#import "ConfirmationViewController.h"
#import "ASIFormDataRequest.h"

@implementation TimesheetViewController

@synthesize timesheet;
@synthesize week1Controller;
@synthesize week2Controller;
@synthesize absenceSummaryController;
@synthesize weekSwitch;
@synthesize payPeriodLabel;
@synthesize timesheetPeriodNID;

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
        week1Controller.week1Or2 = 1;
        week1Controller.delegate = self;
        [self.view addSubview:week1Controller.tableView];
        
        
        // now add week two
        if (!week2Controller) {
            week2Controller = [[WeekOneTableViewController alloc] initWithNibName:@"WeekOneTableViewController" bundle:nil];
        }
        week2Controller.tableView.frame = CGRectMake(20, 50+29, week2Controller.tableView.frame.size.width, self.week2Controller.tableView.frame.size.height);        
        week2Controller.days = timesheet.week2;
        week2Controller.week1Or2 = 2;
        week2Controller.delegate = self;
        [self.view addSubview:week2Controller.tableView];
        
        
        // hide week two
        [week2Controller.view setHidden:YES];
        
        
        // add the confirm button
        UIBarButtonItem *confirm = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStyleBordered target:self action:@selector(confirmHours:)];
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

-(float)calculateHours {
    float numHours = 70;
    
    // check if any absences
    float hoursOff = 0;
    NSArray *w = week1Controller.days;
    for (int i=0; i < w.count; i++) {
        Day *d = [w objectAtIndex:i];
        if (d.absences != nil) {
            // add up the hours
            for (int j=0; j < d.absences.count; j++) {
                AbsenceType *a = [d.absences objectAtIndex:j];
                hoursOff += a.hours;
            }
        }
    }
    NSArray *ww = week2Controller.days;
    for (int i=0; i < ww.count; i++) {
        Day *dd = [ww objectAtIndex:i];
        if (dd.absences != nil) {
            // add up the hours
            for (int j=0; j < dd.absences.count; j++) {
                AbsenceType *aa = [dd.absences objectAtIndex:j];
                hoursOff += aa.hours;
            }
        }
    }
    
    numHours -= hoursOff;
    
    return numHours;
}

-(void)confirmHours:(id)sender  {
    // go to the summary view
    if (!absenceSummaryController) {
        absenceSummaryController = [[AbsenceSummaryMainController alloc] initWithNibName:@"AbsenceSummaryMainController" bundle:nil];
    }
    absenceSummaryController.week1 = week1Controller.days;
    absenceSummaryController.week2 = week2Controller.days;
    
    NSRange range = [payPeriodLabel.text rangeOfString:@":"];
    NSString *payPeriodStr = [payPeriodLabel.text substringFromIndex:range.location+1];
    absenceSummaryController.payPeriodLabel = payPeriodStr;
    absenceSummaryController.hoursWorked = [self calculateHours];
    absenceSummaryController.isReadOnly = NO;
    absenceSummaryController.delegate = self;    
    
    [self.navigationController pushViewController:absenceSummaryController animated:YES];
}


#pragma mark UIAlertDelegate


-(NSDictionary *)getPostDictionary:(NSString *)val {
    NSDictionary *valueDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               val, @"value", nil];
    NSDictionary *undDict = [NSDictionary dictionaryWithObjectsAndKeys:
                             valueDict, @"und", nil];
    return undDict;
}

-(NSDictionary *)getSafeFormatPostDictionary:(NSString *)val {
    NSDictionary *valueDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               val, @"value",
                               @"", @"format",
                               val, @"safe_value",
                                    nil];
    NSDictionary *zeroDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                  valueDict, @"0", nil];
    NSDictionary *undDict = [NSDictionary dictionaryWithObjectsAndKeys:
                             zeroDict, @"und", nil];
    return undDict;
}

-(NSDictionary *)getZeroPostDictionary:(NSString *)val {
    NSDictionary *valueDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               val, @"value",
                               nil];
    NSDictionary *zeroDict = [NSDictionary dictionaryWithObjectsAndKeys:
                              valueDict, @"0", nil];
    NSDictionary *undDict = [NSDictionary dictionaryWithObjectsAndKeys:
                             zeroDict, @"und", nil];
    return undDict;
}
-(NSDictionary *)getTargetPostDictionary:(NSString *)val {
    NSDictionary *valueDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               val, @"target_id", nil];
    //NSDictionary *zeroDict = [NSDictionary dictionaryWithObjectsAndKeys:
    //                          valueDict, @"0", nil];
    //NSDictionary *undDict = [NSDictionary dictionaryWithObjectsAndKeys:
    //                         zeroDict, @"und", nil];
    NSDictionary *undDict = [NSDictionary dictionaryWithObjectsAndKeys:
                             valueDict, @"und", nil];
    return undDict;
}


-(void)postFullTimesheetEntry {
    NSError* error;
    
    NSDictionary* info = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Timesheet Entry", @"title",
                          @"its_timesheet", @"type",
                          [self getSafeFormatPostDictionary:@"jml2003"], @"field_cwid",
                          [self getSafeFormatPostDictionary:@"NONE" ], @"field_absence_type",
                          [self getTargetPostDictionary:timesheetPeriodNID], @"field_timesheet_period_entity",
                          nil];
    
    //convert object to data
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:info
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    //print out the data contents
    NSLog(@"%@", [[NSString alloc] initWithData:jsonData
                                       encoding:NSUTF8StringEncoding]);
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:kTimesheetsURL];
    [request addRequestHeader:@"User-Agent" value:@"ASIHTTPRequest"];
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request appendPostData:jsonData];
	[request startSynchronous];
	
	NSLog(@"%@",[request responseString]);
    
}

-(void)postTimesheetEntry:(AbsenceType *)a forDay:(Day *)d forWeek:(NSString *)w {
    // post absence type (a.absenceName), cwid ("jml2003"), timesheet period (timesheetPeriodNID),
    //   dayName (d.dayName), week (1), number of hours (val)
    //build an info object and convert to json
    NSError* error;
    
    NSString *val;
    NSMutableString *val1 = [NSMutableString string];
    val = [NSString stringWithFormat:@"%.02f",a.hours]; //%d or %i both is ok.
    [val1 appendString:val];
    
    

    
    NSDictionary* info = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Timesheet Entry", @"title",
                          @"its_timesheet", @"type",
                          [self getSafeFormatPostDictionary:@"jml2003"], @"field_cwid",
                          [self getSafeFormatPostDictionary:a.absenceName ], @"field_absence_type",
                          [self getZeroPostDictionary:val], @"field_number_of_hours",
                          [self getPostDictionary:w], @"field_week",
                          [self getPostDictionary:d.dayName], @"field_day",
                          [self getTargetPostDictionary:timesheetPeriodNID], @"field_timesheet_period_entity",
                          nil];
    
    //convert object to data
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:info
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    //print out the data contents
    NSLog(@"%@", [[NSString alloc] initWithData:jsonData
                                       encoding:NSUTF8StringEncoding]);
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:kTimesheetsURL];
    [request addRequestHeader:@"User-Agent" value:@"ASIHTTPRequest"];
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request appendPostData:jsonData];
	[request startSynchronous];
	
	NSLog(@"%@",[request responseString]);
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 1) {
        NSLog(@"Submit");
        
        // save all the absence values to NSUserDefaults
        NSMutableDictionary *wk1AbsencesToSave = [[NSMutableDictionary alloc] init];
        NSArray *w = week1Controller.days;
        for (int i=0; i < w.count; i++) {
            Day *d = [w objectAtIndex:i];
            if (d.absences != nil) {
                NSMutableDictionary *dayDict = [[NSMutableDictionary alloc] init];
                // add up the hours
                for (int j=0; j < d.absences.count; j++) {
                    AbsenceType *a = [d.absences objectAtIndex:j];
                    NSString *key = a.absenceName;

                    NSString *val;
                    NSMutableString *val1 = [NSMutableString string];
                    val = [NSString stringWithFormat:@"%.02f",a.hours]; //%d or %i both is ok.
                    [val1 appendString:val];
                    
                    [dayDict setObject:val forKey:key];
                    
                    
                    //build an info object, convert to json and post it
                    [self postTimesheetEntry:a forDay:d forWeek:@"1"];
                    
                }                
                [wk1AbsencesToSave setObject:dayDict forKey:d.dayName];
                
            }
        }
        NSArray *ww = week2Controller.days;
        NSMutableDictionary *wk2AbsencesToSave = [[NSMutableDictionary alloc] init];
        for (int i=0; i < ww.count; i++) {
            Day *d = [ww objectAtIndex:i];
            if (d.absences != nil) {
                NSMutableDictionary *dayDict = [[NSMutableDictionary alloc] init];
                // add up the hours
                for (int j=0; j < d.absences.count; j++) {
                    AbsenceType *a = [d.absences objectAtIndex:j];
                    NSString *key = a.absenceName;
                    
                    NSString *val;
                    NSMutableString *val1 = [NSMutableString string];
                    val = [NSString stringWithFormat:@"%.02f",a.hours]; //%d or %i both is ok.
                    [val1 appendString:val];
                    
                    [dayDict setObject:val forKey:key];
                    
                    //build an info object, convert to json and post it
                    [self postTimesheetEntry:a forDay:d forWeek:@"2"];
                }
                [wk2AbsencesToSave setObject:dayDict forKey:d.dayName];
            }
        }
        
        NSMutableDictionary *timesheetToSave = [[NSMutableDictionary alloc] init];  
        
        NSRange range = [payPeriodLabel.text rangeOfString:@":"];
        NSString *payPeriodStr = [payPeriodLabel.text substringFromIndex:range.location+1];
        [timesheetToSave setObject:payPeriodStr forKey:@"pay period" ];
        [timesheetToSave setObject:wk1AbsencesToSave forKey:@"week 1"];
        [timesheetToSave setObject:wk2AbsencesToSave forKey:@"week 2"];
        
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
        
        
        // check if a full week was worked
        if (wk1AbsencesToSave.count == 0 && wk2AbsencesToSave.count == 0) {
            [self postFullTimesheetEntry];
        }
        
        // push the confirmation view
        ConfirmationViewController *m = [[ConfirmationViewController alloc] initWithNibName:@"ConfirmationViewController" bundle:nil];
        m.payPeriodStr = payPeriodLabel.text;
        [self.navigationController pushViewController:m animated:YES];
	} 
    
}

#pragma mark WeekTableViewDelegate


- (void)didSelectWeek:(Day *)d whichWeek:(int)week1Or2 {
    // i think i have to make the parent push the view
     if (!self.detailViewController) {
     self.detailViewController = [[AbsenceViewController alloc] initWithNibName:@"AbsenceViewController" bundle:nil];
     }
     self.detailViewController.d = d;
    self.detailViewController.week1Or2 = week1Or2;
    self.detailViewController.delegate = self;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
     
}

#pragma mark AbsenceViewControllerDelegate

-(void)didEditDay:(Day *)day forWeek:(int)forWeek {
    // update the day in the appropriate controller
    if (forWeek == 1) {
        [week1Controller updateDay:day];
    } else {
        [week2Controller updateDay:day];
    }
}

#pragma mark AbsenceSummaryDelegate

-(void)confirm  {
    float numHours = [self calculateHours];
    
    NSString *msg = [NSString stringWithFormat:@"By clicking the OK button below, you are confirming that you worked %.02f hours during this pay period.", numHours];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Confirm"
                          message: msg
                          delegate: self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:@"Accept",nil];
    [alert show];
}

@end
