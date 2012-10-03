//
//  AbsenceSummaryMainController.h
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/2/12.
//
//

#import <UIKit/UIKit.h>
#import "AbsenceSummaryDelegate.h"
#import "AbsenceSummaryViewController.h"

@interface AbsenceSummaryMainController : UIViewController {
    NSArray *week1;
    NSArray *week2;
    float hoursWorked;
    NSString *payPeriodLabel;
    id<AbsenceSummaryDelegate> delegate;
    AbsenceSummaryViewController *absenceSummaryViewController;
    BOOL isReadOnly;
}

@property (nonatomic, assign) id<AbsenceSummaryDelegate> delegate;

@property (nonatomic, retain) AbsenceSummaryViewController *absenceSummaryViewController;
@property (nonatomic, retain) NSArray *week1;
@property (nonatomic, retain) NSArray *week2;
@property (nonatomic, retain) NSString *payPeriodLabel;
@property float hoursWorked;
@property BOOL isReadOnly;

-(void)confirmHours:(id)sender;

@end
