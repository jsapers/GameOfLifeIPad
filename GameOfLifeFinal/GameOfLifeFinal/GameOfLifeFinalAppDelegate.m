//
//  GameOfLifeFinalAppDelegate.m
//  GameOfLifeFinal
//
//  Created by Josh Sapers on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameOfLifeFinalAppDelegate.h"
#import "DetailViewController.h"
#import "RootViewController.h"

@implementation GameOfLifeFinalAppDelegate


@synthesize window=_window;

@synthesize splitViewController=_splitViewController;

@synthesize rootViewController=_rootViewController;

@synthesize detailViewController=_detailViewController;

@synthesize navController=_navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the split view controller's view to the window and display.
    [self.rootViewController setDetail:self.detailViewController];
    [self.detailViewController setColonies:colonies];
    [self.rootViewController setColonies:colonies];
    ColonyView *cv=[[ColonyView alloc]init];
    [self.detailViewController setColonyView:cv];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:self.detailViewController];
     UINavigationController *masterNav =[[UINavigationController alloc]initWithRootViewController:self.rootViewController];
    NSArray *vcs =[[NSArray alloc]initWithObjects:masterNav,nav, nil];
    [self.splitViewController setViewControllers:vcs];
    //DetailViewController* dvc = [[DetailViewController alloc] init];
   // self.detailViewController=dvc;
    //[dvc release];
    [self.detailViewController setHeader];
    self.window.rootViewController = self.splitViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_splitViewController release];
    [_rootViewController release];
    [_detailViewController release];
    [super dealloc];
}

@end
