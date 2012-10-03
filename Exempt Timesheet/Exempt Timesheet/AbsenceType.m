//
//  AbsenceType.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AbsenceType.h"

@implementation AbsenceType

@synthesize absenceCode;
@synthesize absenceName;
@synthesize hours;

-(id)init {
    absenceName = nil;
    absenceCode = nil;
    hours = 0;
    
    return self;
}

@end
