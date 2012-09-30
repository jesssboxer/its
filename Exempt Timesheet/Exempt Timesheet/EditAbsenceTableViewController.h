//
//  EditAbsenceTableViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Day.h"

@interface EditAbsenceTableViewController : UITableViewController {
    Day *d;
}

@property (nonatomic, retain) Day *d;

@end
