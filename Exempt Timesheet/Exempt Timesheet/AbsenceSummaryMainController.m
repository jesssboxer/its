//
//  AbsenceSummaryMainController.m
//  Exempt Timesheet
//
//  Created by Jessica Lacson on 10/2/12.
//
//

#import "AbsenceSummaryMainController.h"

@interface AbsenceSummaryMainController ()

@end

@implementation AbsenceSummaryMainController

@synthesize absenceSummaryViewController;
@synthesize hoursWorked;
@synthesize week1;
@synthesize week2;
@synthesize payPeriodLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // add the confirm button
        UIBarButtonItem *confirm = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStyleBordered target:self action:@selector(confirmHours:)];
        [[self navigationItem] setRightBarButtonItem:confirm];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (!absenceSummaryViewController) {
        absenceSummaryViewController = [[AbsenceSummaryViewController alloc] initWithNibName:@"AbsenceSummaryViewController" bundle:nil];
    }
    absenceSummaryViewController.payPeriodLabel = payPeriodLabel;
    absenceSummaryViewController.hoursWorked = hoursWorked;
    absenceSummaryViewController.week1 = week1;
    absenceSummaryViewController.week2 = week2;
    [self.view addSubview:absenceSummaryViewController.tableView];
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
