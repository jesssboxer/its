//
//  EditAbsenceTableViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Day.h"
#import "EditAbsenceTableDelegate.h"

@interface EditAbsenceTableViewController : UITableViewController {
    Day *d;
    id<EditAbsenceTableDelegate> delegate;
}
@property (nonatomic, assign) id<EditAbsenceTableDelegate> delegate;

@property (nonatomic, retain) Day *d;

@end
