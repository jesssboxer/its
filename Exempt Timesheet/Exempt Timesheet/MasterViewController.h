//
//  MasterViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController {
    NSArray *savedTimesheets;
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *savedTimesheets;

-(void)loadSavedTimesheets;

@end
