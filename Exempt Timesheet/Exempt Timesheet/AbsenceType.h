//
//  AbsenceType.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbsenceType : NSObject {
    NSString *absenceName;
    NSString *absenceCode;
    float hours;
}

@property (nonatomic, retain) NSString *absenceName;
@property (nonatomic, retain) NSString *absenceCode;
@property float hours;

@end
