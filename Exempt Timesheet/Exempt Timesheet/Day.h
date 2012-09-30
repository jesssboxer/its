//
//  Day.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Day : NSObject {
    NSString *dayName;
    NSMutableArray *absences;
}

@property (nonatomic, retain) NSMutableArray *absences;
@property (nonatomic, retain) NSString *dayName;


-(id)initWithDayName:(NSString *)dname;

@end
