//
//  AbsenceViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Day.h"
#import "EditAbsenceTableDelegate.h"
#import "AbsenceTypeTableDelegate.h"

@class EditAbsenceTableViewController;

@interface AbsenceViewController : UIViewController<EditAbsenceTableDelegate, AbsenceTypeTableDelegate> {
    Day *d;
}

@property (nonatomic, retain) Day *d;

@property (strong, nonatomic) EditAbsenceTableViewController *detailViewController;

-(void)saveHours:(id)sender;
@end
