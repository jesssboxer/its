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
#import "AbsenceViewControllerDelegate.h"

@class EditAbsenceTableViewController;

@interface AbsenceViewController : UIViewController<EditAbsenceTableDelegate, AbsenceTypeTableDelegate> {
    Day *d;
    int week1Or2;
    
    id<AbsenceViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id<AbsenceViewControllerDelegate> delegate;

@property (nonatomic, retain) Day *d;

@property (strong, nonatomic) EditAbsenceTableViewController *detailViewController;

@property int week1Or2;

-(void)saveHours:(id)sender;

@end
