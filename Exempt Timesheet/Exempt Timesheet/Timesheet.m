//
//  Timesheet.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Timesheet.h"
#import "Day.h"

@implementation Timesheet

@synthesize week1;
@synthesize week2;
@synthesize submittedStr;
@synthesize payPeriodStr;

-(id)initTimesheet {
    
    if ((self = [super init])) {
        // setup week arrays
        week1 = [[NSMutableArray alloc] initWithObjects:[[Day alloc] initWithDayName:@"Sunday"], 
                 [[Day alloc] initWithDayName:@"Monday"],
                 [[Day alloc] initWithDayName:@"Tuesday"],
                 [[Day alloc] initWithDayName:@"Wednesday"],
                 [[Day alloc] initWithDayName:@"Thursday"],
                 [[Day alloc] initWithDayName:@"Friday"],
                 [[Day alloc] initWithDayName:@"Saturday"],
                 nil];
        week2 = [[NSMutableArray alloc] initWithObjects:[[Day alloc] initWithDayName:@"Sunday"],
                 [[Day alloc] initWithDayName:@"Monday"],
                 [[Day alloc] initWithDayName:@"Tuesday"],
                 [[Day alloc] initWithDayName:@"Wednesday"],
                 [[Day alloc] initWithDayName:@"Thursday"],
                 [[Day alloc] initWithDayName:@"Friday"],
                 [[Day alloc] initWithDayName:@"Saturday"],
                 nil];
    }
    return self;
}

@end
