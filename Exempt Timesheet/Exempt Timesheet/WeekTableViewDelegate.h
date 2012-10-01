//
//  WeekTableViewDelegate.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Day.h"

@protocol WeekTableViewDelegate <NSObject>

- (void)didSelectWeek:(Day *)d;

@end
