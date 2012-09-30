//
//  WeekOneTableViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AbsenceViewController;

@interface WeekOneTableViewController : UITableViewController {
    NSArray *days;
}

@property (nonatomic, retain) NSArray *days;
@property (strong, nonatomic) AbsenceViewController *detailViewController;

@end
