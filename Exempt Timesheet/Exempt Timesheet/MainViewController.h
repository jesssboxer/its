//
//  MainViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewDelegate.h"

@class MasterViewController;
@class AbsenceSummaryMainController;

@interface MainViewController : UIViewController<MasterViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
    IBOutlet UILabel *currentPayPeriodLabel;
    NSMutableArray *timesheetPeriods;
    int selectedPeriod;
    NSString *selectedPeriodNID;
}

@property (strong, nonatomic) MasterViewController *masterViewController;
@property (strong, nonatomic) IBOutlet UILabel *currentPayPeriodLabel;

@property (strong, nonatomic) AbsenceSummaryMainController *detailViewController;

-(IBAction)editTimesheet:(id)sender;
-(IBAction)showTimesheetPeriodPicker:(id)sender;

@end
