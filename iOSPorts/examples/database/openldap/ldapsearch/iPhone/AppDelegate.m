//
//  AppDelegate_Phone.m
//  ldapsearch
//
//  Created by David Syzdek on 6/22/10.
//  Copyright David M. Syzdek 2010. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "LoginViewController.h"

@implementation AppDelegate

@synthesize window;

/*
- (BOOL)application:(UIApplication *)application orig_didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   NSAutoreleasePool * pool;
   NSString          * filePath;
   const char        * caFile;

   [window makeKeyAndVisible];

   pool = [[NSAutoreleasePool alloc] init];

   test_all_ldap(NULL);

   [pool release];

	return YES;

}
*/
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    MasterViewController *masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
   // self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    
    LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    self.window.rootViewController = loginViewController;//self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
