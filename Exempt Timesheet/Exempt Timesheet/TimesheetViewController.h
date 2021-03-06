//
//  TimesheetViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Timesheet.h"
#import "WeekOneTableViewController.h"
#import "WeekTableViewDelegate.h"
#import "AbsenceViewController.h"
#import "AbsenceViewControllerDelegate.h"
#import "AbsenceSummaryDelegate.h"
#import "AbsenceSummaryMainController.h"

@class AbsenceTableViewController;

@interface TimesheetViewController : UIViewController<UIAlertViewDelegate, WeekTableViewDelegate, AbsenceViewControllerDelegate, AbsenceSummaryDelegate> {
    Timesheet *timesheet;
    WeekOneTableViewController *week1Controller;
    WeekOneTableViewController *week2Controller;
    AbsenceSummaryMainController *absenceSummaryController;
    IBOutlet UISegmentedControl *weekSwitch;
    IBOutlet UILabel *payPeriodLabel;
    NSString *timesheetPeriodNID;
}

@property (nonatomic, retain) Timesheet *timesheet;
@property (nonatomic, retain) WeekOneTableViewController *week1Controller;
@property (nonatomic, retain) WeekOneTableViewController *week2Controller;
@property (nonatomic, retain) AbsenceSummaryMainController *absenceSummaryController;
@property (nonatomic, retain) IBOutlet UISegmentedControl *weekSwitch;
@property (nonatomic, retain) IBOutlet UILabel *payPeriodLabel;
@property (nonatomic, retain) NSString *timesheetPeriodNID;

@property (strong, nonatomic) AbsenceViewController *detailViewController;

-(IBAction)switchWeek:(id)sender;
-(void)confirmHours:(id)sender;

@end
