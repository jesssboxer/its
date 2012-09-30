//
//  AbsenceViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Day.h"

@class EditAbsenceTableViewController;

@interface AbsenceViewController : UIViewController {
    Day *d;
}

@property (nonatomic, retain) Day *d;

@property (strong, nonatomic) EditAbsenceTableViewController *detailViewController;

@end
