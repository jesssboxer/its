//
//  Timesheet.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timesheet : NSObject {
    NSArray *week1;
    NSArray *week2;
    NSString *submittedStr;
    NSString *payPeriodStr;
}

@property (nonatomic, retain) NSArray *week1;
@property (nonatomic, retain) NSArray *week2;
@property (nonatomic, retain) NSString *submittedStr;
@property (nonatomic, retain) NSString *payPeriodStr;

-(id)initTimesheet;

@end
