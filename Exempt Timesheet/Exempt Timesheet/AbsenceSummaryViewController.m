//
//  AbsenceSummaryViewController.m
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/2/12.
//
//

#import "AbsenceSummaryViewController.h"
#import "Day.h"
#import "AbsenceType.h"

@interface AbsenceSummaryViewController ()

@end

@implementation AbsenceSummaryViewController

@synthesize week1;
@synthesize week2;
@synthesize absences;
@synthesize payPeriodLabel;
@synthesize hoursWorked;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // setup absences array
    if (absences == nil) {
        absences = [[NSMutableArray alloc] init];
    }
    
    // week 1
    for (int i=0; i<week1.count; i++) {
        Day *d = [week1 objectAtIndex:i];
        if (d.absences != nil) {
            for (int j=0; j<d.absences.count; j++) {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                NSString *dayStr = [NSString stringWithFormat:@"Week 1: %@", d.dayName];
                AbsenceType *at = [d.absences objectAtIndex:j];
                [dict setObject:at forKey:@"absence"];
                [dict setObject:dayStr forKey:@"day"];
                [absences addObject:dict];
            }
        }
    }
    
    // week 2
    for (int i=0; i<week2.count; i++) {
        Day *d = [week2 objectAtIndex:i];
        if (d.absences != nil) {
            for (int j=0; j<d.absences.count; j++) {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                NSString *dayStr = [NSString stringWithFormat:@"Week 2: %@", d.dayName];
                AbsenceType *at = [d.absences objectAtIndex:j];
                [dict setObject:at forKey:@"absence"];
                [dict setObject:dayStr forKey:@"day"];
                [absences addObject:dict];
            }
        }
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    int numSections = 1; // this is for the summary at the top
    
    if (absences != nil) {
        numSections += absences.count;
    }
    
    return numSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in each section.
    if (section == 0) {
        return 2; // 2 for the summary
    } else {
        return 3; // 3 rows per absence
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            // pay period label
            cell.textLabel.text = [NSString stringWithFormat:@"Pay Period: %@", payPeriodLabel];
        } else {
            // hours worked
            cell.textLabel.text = [NSString stringWithFormat:@"Total Hours Worked: %.02f", hoursWorked];
        }
    } else {
        //NSLog(@"indexPath.row = %d" , indexPath.row);
        NSDictionary *dayDict = [absences objectAtIndex:indexPath.section-1]; // subtract 2 for the summary rows
        if (indexPath.row == 0) {
            // day
            NSString *dayStr = [dayDict objectForKey:@"day"];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", dayStr];
        } else if (indexPath.row == 1) {
            // absence type
            AbsenceType *at = [dayDict objectForKey:@"absence"];
            cell.textLabel.text = [NSString stringWithFormat:@"Type: %@", at.absenceName];
        } else if (indexPath.row == 2) {
            // hours taken
            AbsenceType *at = [dayDict objectForKey:@"absence"];
            cell.textLabel.text = [NSString stringWithFormat:@"Hours: %.02f", at.hours];
        }
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
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
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
