//
//  EditAbsenceTableViewController.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EditAbsenceTableViewController.h"

@implementation EditAbsenceTableViewController

@synthesize d;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    int numSections = 1;
    if (d.absences != nil) {
        numSections = d.absences.count+1; // add one for editing
    }
    return numSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // always make the first section the blank one
    int whichSection = indexPath.section;
    if (whichSection == 1) {
        if (indexPath.row == 0) { // first section
            // day
            cell.textLabel.text = [NSString stringWithFormat:@"Day: ", d.dayName];
        } else if (indexPath.row == 1) {
            // type
            cell.textLabel.text = @"Type";
        } else {
            // hours
            cell.textLabel.text = @"Hours";
            
            UITextField *hoursTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 185, 30)];
            hoursTextField.adjustsFontSizeToFitWidth = YES;
            hoursTextField.textColor = [UIColor blackColor];
            hoursTextField.keyboardType = UIKeyboardTypeNumberPad;
            hoursTextField.returnKeyType = UIReturnKeyNext;
            hoursTextField.backgroundColor = [UIColor whiteColor];
            hoursTextField.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
            hoursTextField.textAlignment = UITextAlignmentLeft;
            hoursTextField.clearButtonMode = UITextFieldViewModeUnlessEditing; // no clear 'x' button to the right
            [hoursTextField setEnabled: YES];
            [cell addSubview:hoursTextField];
        }
    } else if (whichSection % 2 == 0) { // even section
        
        if (indexPath.row % 3 == 0) {
            // day
        } else if (indexPath.row %3 == 1) {
            // type
        } else {
            // hours
        }
    } else { // odd section
        
        if (indexPath.row % 3 == 0) {
            // day
        } else if (indexPath.row %3 == 1) {
            // type
        } else {
            // hours
        }
    }
    
    // then i guess switch on even and odd?
    
    
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
