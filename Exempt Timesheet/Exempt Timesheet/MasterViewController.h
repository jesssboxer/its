//
//  MasterViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewDelegate.h"

@interface MasterViewController : UITableViewController {
    NSArray *savedTimesheets;
    
    id<MasterViewDelegate> delegate;
}
@property (nonatomic, assign) id<MasterViewDelegate> delegate;

@property (strong, nonatomic) NSArray *savedTimesheets;

-(void)loadSavedTimesheets;

@end
