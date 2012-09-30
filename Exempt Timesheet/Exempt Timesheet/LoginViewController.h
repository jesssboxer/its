//
//  LoginViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate> { 
    IBOutlet UITextField *cwid;
    IBOutlet UITextField *passwd;
    IBOutlet UISwitch *saveCwid;
    IBOutlet UILabel *errorLabel;
}

-(IBAction)login:(id)sender;

@end
