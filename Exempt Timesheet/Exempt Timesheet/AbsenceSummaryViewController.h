//
//  AbsenceSummaryViewController.h
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/2/12.
//
//

#import <UIKit/UIKit.h>

@interface AbsenceSummaryViewController : UITableViewController {
    NSArray *week1;
    NSArray *week2;
    NSMutableArray *absences;
    float hoursWorked;
    NSString *payPeriodLabel;
}

@property (nonatomic, retain) NSArray *week1;
@property (nonatomic, retain) NSArray *week2;
@property (nonatomic, retain) NSMutableArray *absences;
@property (nonatomic, retain) NSString *payPeriodLabel;
@property float hoursWorked;

@end
