//
//  MainViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;

@interface MainViewController : UIViewController {
    IBOutlet UILabel *currentPayPeriodLabel;
}

@property (strong, nonatomic) MasterViewController *masterViewController;
@property (strong, nonatomic) IBOutlet UILabel *currentPayPeriodLabel;

-(IBAction)editTimesheet:(id)sender;

@end
