//
//  AbsenceTypeTableViewController.h
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/1/12.
//
//

#import <UIKit/UIKit.h>
#import "AbsenceTypeTableDelegate.h"

@interface AbsenceTypeTableViewController : UITableViewController {
    NSArray *absenceTypes;
    id<AbsenceTypeTableDelegate> delegate;
}
@property (nonatomic, assign) id<AbsenceTypeTableDelegate> delegate;


@property (nonatomic, retain) NSArray *absenceTypes;

@end
