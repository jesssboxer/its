//
//  MasterViewController.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"

#import "AbsenceSummaryMainController.h"
#import "Timesheet.h"
#import "Day.h"
#import "AbsenceType.h"

@implementation MasterViewController

@synthesize savedTimesheets;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Helper functions

-(void)loadSavedTimesheets {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/timesheets.plist"];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    
    NSMutableArray *parsedTimesheets = [[NSMutableArray alloc] init];
    if (fileExists) {
        NSArray *toParse = [NSArray arrayWithContentsOfFile:path];
        for (int i=0; i< toParse.count; i++) {
            NSDictionary *td = [toParse objectAtIndex:i];
                
            Timesheet *t = [[Timesheet alloc] initTimesheet];
            t.payPeriodStr = [td objectForKey:@"pay period"];
            t.submittedStr = [td objectForKey:@"submitted"];
            // absences for week1 and 2
            NSDictionary *week1Dict = [td objectForKey:@"week 1"];
            NSArray *keys = [week1Dict allKeys];
            NSMutableArray *week1 = [[NSMutableArray alloc] init];
            for (int i=0; i<keys.count; i++) {
                NSString *dayName = [keys objectAtIndex:i];
                Day *d = [[Day alloc] initWithDayName:dayName];
                NSMutableArray *absences = [[NSMutableArray alloc] init];
                NSDictionary *absenceDict = [week1Dict objectForKey:dayName];
                NSArray *absenceKeys = [absenceDict allKeys];
                for (int k=0; k<absenceKeys.count; k++) {
                    NSString *aKey = [absenceKeys objectAtIndex:k];
                    NSString *absenceVals = [absenceDict objectForKey: aKey];
                    AbsenceType *at = [[AbsenceType alloc] init];
                    at.absenceName = aKey;
                    NSString *hoursStr = absenceVals;
                    at.hours = [hoursStr floatValue];
                    [absences addObject:at];
                }
                d.absences = absences;
                [week1 addObject:d];
            }
            NSDictionary *week2Dict = [td objectForKey:@"week 2"];
            NSArray *keys2 = [week2Dict allKeys];
            NSMutableArray *week2 = [[NSMutableArray alloc] init];
            for (int i=0; i<keys2.count; i++) {
                NSString *dayName = [keys2 objectAtIndex:i];
                Day *d = [[Day alloc] initWithDayName:dayName];
                NSMutableArray *absences = [[NSMutableArray alloc] init];
                NSDictionary *absenceDict = [week2Dict objectForKey:dayName];
                NSArray *absenceKeys = [absenceDict allKeys];
                for (int k=0; k<absenceKeys.count; k++) {
                    NSString *aKey = [absenceKeys objectAtIndex:k];
                    NSString *absenceVals = [absenceDict objectForKey: aKey];
                    AbsenceType *at = [[AbsenceType alloc] init];
                    at.absenceName = aKey;
                    NSString *hoursStr = absenceVals;
                    at.hours = [hoursStr floatValue];
                    [absences addObject:at];
                }
                d.absences = absences;
                [week2 addObject:d];
            }
            t.week1 = week1;
            t.week2 = week2;
            [parsedTimesheets addObject:t];
        }
    }
    
    savedTimesheets = [[parsedTimesheets reverseObjectEnumerator] allObjects];;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [savedTimesheets count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton; 
    }
    
    Timesheet *t = [savedTimesheets objectAtIndex:indexPath.row];
    // Configure the cell.
    //cell.textLabel.text = NSLocalizedString(@"9/3/2012 - 9/16/2012", @"9/3/2012 - 9/16/2012");
    //cell.detailTextLabel.text = NSLocalizedString(@"Submitted on 9/18/2012 at 3:34pm", @"Submitted on 9/18/2012 at 3:34pm");
    cell.textLabel.text = t.payPeriodStr;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Submitted on %@", t.submittedStr];
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete)
 {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert)
 {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Timesheet *t = savedTimesheets[indexPath.row];
    [self.delegate didSelectTimesheetToView:t];
}

@end
