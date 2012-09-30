//
//  Day.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Day.h"

@implementation Day

@synthesize absences;
@synthesize dayName;

-(id)initWithDayName:(NSString *)dname {
    if ((self = [super init])) {
        self.dayName = dname;
        self.absences = nil;
    }    
    return self;
}

@end
