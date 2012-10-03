//
//  AbsenceViewControllerDelegate.h
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/1/12.
//
//

#import <Foundation/Foundation.h>
#import "Day.h"

@protocol AbsenceViewControllerDelegate <NSObject>

-(void)didEditDay:(Day *)day forWeek:(int)forWeek;

@end
