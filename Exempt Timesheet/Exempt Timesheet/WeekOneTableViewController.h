//
//  WeekOneTableViewController.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeekTableViewDelegate.h"


@interface WeekOneTableViewController : UITableViewController<UITableViewDataSource> {
    NSArray *days;
    id<WeekTableViewDelegate> delegate;
}
@property (nonatomic, assign) id<WeekTableViewDelegate> delegate;

@property (nonatomic, retain) NSArray *days;

@end
