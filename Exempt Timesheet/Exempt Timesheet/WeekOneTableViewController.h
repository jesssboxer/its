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
    NSMutableArray *days;
    id<WeekTableViewDelegate> delegate;
    int week1Or2;
}
@property (nonatomic, assign) id<WeekTableViewDelegate> delegate;

@property (nonatomic, retain) NSMutableArray *days;

@property int week1Or2;

-(void)updateDay:(Day *)day;

@end
