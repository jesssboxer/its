//
//  Timesheet.h
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timesheet : NSObject {
    NSMutableArray *week1;
    NSMutableArray *week2;
    NSString *submittedStr;
    NSString *payPeriodStr;
}

@property (nonatomic, retain) NSMutableArray *week1;
@property (nonatomic, retain) NSMutableArray *week2;
@property (nonatomic, retain) NSString *submittedStr;
@property (nonatomic, retain) NSString *payPeriodStr;

-(id)initTimesheet;

@end
