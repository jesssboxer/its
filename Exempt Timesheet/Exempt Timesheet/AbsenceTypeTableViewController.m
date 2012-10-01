//
//  AbsenceTypeTableViewController.m
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/1/12.
//
//

#import "AbsenceTypeTableViewController.h"

@interface AbsenceTypeTableViewController ()

@end

@implementation AbsenceTypeTableViewController

@synthesize absenceTypes;
@synthesize delegate = _delegate;

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
    
    // load up the absenceTypes
    absenceTypes = [[NSArray alloc] initWithObjects:@"Bereavement Leave",
                    @"Business Trip",
                    @"Court Appearance, WCMC",
                    @"Emergency Closure",
                    @"FMLA STD",
                    @"FMLA 50% + Quota Supp",
                    @"FMLA Personal Time",
                    @"FMLA Sick",
                    @"FMLA Unpaid",
                    @"FMLA Vacation",
                    @"Jury Duty",
                    @"Military Leave",
                    @"Military Reserve",
                    @"On Call",
                    @"Regular Hours Worked",
                    @"Regular On Call",
                    @"Scheduled Personal Day",
                    @"Scheduled Sick Leave",
                    @"Scheduled Vacation",
                    @"Sick Leave Family Sickness",
                    @"Shift Hours Worked",
                    @"Seminar",
                    @"Special Paid Absence",
                    @"Short Term Disability",
                    @"STD 50% + Quota Supp",
                    @"STD Personal",
                    @"STD Vacation",
                    @"Travel Day",
                    @"Training",
                    @"Unpaid Absence",
                    @"Unscheduled Personal Day",
                    @"Unscheduled Sick Day",
                    @"Unscheduled Vacation Day",
                    @"Workers Compensation",
                    @"Workers Comp 2/3rd",
                    @"Workers Comp Personal",
                    @"Workers Comp Vacation",
                    @"Workers Comp Sick",
                    nil];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return absenceTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [absenceTypes objectAtIndex:indexPath.row];
    
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
    [[self navigationController] popViewControllerAnimated:YES];
    [self.delegate didSelectAbsenceType:[absenceTypes objectAtIndex:indexPath.row]];
}

@end
