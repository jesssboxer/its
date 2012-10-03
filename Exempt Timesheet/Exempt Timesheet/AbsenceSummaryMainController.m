//
//  AbsenceSummaryMainController.m
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/2/12.
//
//

#import "AbsenceSummaryMainController.h"
#import "Day.h"
#import "AbsenceType.h"

@interface AbsenceSummaryMainController ()

@end

@implementation AbsenceSummaryMainController

@synthesize absenceSummaryViewController;
@synthesize hoursWorked;
@synthesize week1;
@synthesize week2;
@synthesize payPeriodLabel;
@synthesize isReadOnly;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!absenceSummaryViewController) {
        absenceSummaryViewController = [[AbsenceSummaryViewController alloc] initWithNibName:@"AbsenceSummaryViewController" bundle:nil];
    }
    absenceSummaryViewController.payPeriodLabel = payPeriodLabel;
    absenceSummaryViewController.hoursWorked = hoursWorked;
    absenceSummaryViewController.week1 = week1;
    absenceSummaryViewController.week2 = week2;
    
    
    if (!isReadOnly) {
        // add the confirm button
        UIBarButtonItem *confirm = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStyleBordered target:self action:@selector(confirmHours:)];
        [[self navigationItem] setRightBarButtonItem:confirm];
    }
    
    // setup absences array
    NSMutableArray *absences = [[NSMutableArray alloc] init];
    
    // and count hours
    float hoursTaken = 0;
    
    // week 1
    for (int i=0; i<week1.count; i++) {
        Day *d = [week1 objectAtIndex:i];
        if (d.absences != nil) {
            for (int j=0; j<d.absences.count; j++) {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                NSString *dayStr = [NSString stringWithFormat:@"Week 1: %@", d.dayName];
                AbsenceType *at = [d.absences objectAtIndex:j];
                [dict setObject:at forKey:@"absence"];
                [dict setObject:dayStr forKey:@"day"];
                [absences addObject:dict];
                
                hoursTaken += at.hours;
            }
        }
    }
    
    // week 2
    for (int i=0; i<week2.count; i++) {
        Day *d = [week2 objectAtIndex:i];
        if (d.absences != nil) {
            for (int j=0; j<d.absences.count; j++) {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                NSString *dayStr = [NSString stringWithFormat:@"Week 2: %@", d.dayName];
                AbsenceType *at = [d.absences objectAtIndex:j];
                [dict setObject:at forKey:@"absence"];
                [dict setObject:dayStr forKey:@"day"];
                [absences addObject:dict];
                
                hoursTaken += at.hours;
            }
        }
    }
    
    absenceSummaryViewController.absences = absences;
    absenceSummaryViewController.hoursWorked = 70 - hoursTaken;
    
    [self.view addSubview:absenceSummaryViewController.tableView];
    [self.absenceSummaryViewController.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)confirmHours:(id)sender {
    NSLog(@"uh");
    [self.delegate confirm];
}

@end
