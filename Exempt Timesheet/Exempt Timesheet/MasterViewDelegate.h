//
//  MasterViewDelegate.h
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/3/12.
//
//

#import <Foundation/Foundation.h>
#import "Timesheet.h"

@protocol MasterViewDelegate <NSObject>

-(void) didSelectTimesheetToView:(Timesheet *)t;

@end
