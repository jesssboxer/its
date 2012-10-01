//
//  AbsenceTypeTableDelegate.h
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/1/12.
//
//

#import <Foundation/Foundation.h>

@protocol AbsenceTypeTableDelegate <NSObject>

-(void)didSelectAbsenceType:(NSString *)absenceType;

@end
