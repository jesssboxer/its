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

@interface TimesheetViewController : UIViewController<UIAlertViewDelegate> {
    Timesheet *timesheet;
    WeekOneTableViewController *week1Controller;
    WeekOneTableViewController *week2Controller;
    IBOutlet UISegmentedControl *weekSwitch;
    IBOutlet UILabel *payPeriodLabel;
}

@property (nonatomic, retain) Timesheet *timesheet;
@property (nonatomic, retain) WeekOneTableViewController *week1Controller;
@property (nonatomic, retain) WeekOneTableViewController *week2Controller;
@property (nonatomic, retain) IBOutlet UISegmentedControl *weekSwitch;
@property (nonatomic, retain) IBOutlet UILabel *payPeriodLabel;

-(IBAction)switchWeek:(id)sender;
-(void)confirm:(id)sender;

@end
