//
//  ConfirmationViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmationViewController : UIViewController {
    IBOutlet UILabel *payPeriodLabel;
    NSString *payPeriodStr;
}


@property (nonatomic, retain) IBOutlet UILabel *payPeriodLabel;
@property (nonatomic, retain) NSString *payPeriodStr;

-(IBAction)viewLog:(id)sender;
-(IBAction)logout:(id)sender;

@end
