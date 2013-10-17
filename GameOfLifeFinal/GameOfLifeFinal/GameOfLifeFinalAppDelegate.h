//
//  GameOfLifeFinalAppDelegate.h
//  GameOfLifeFinal
//
//  Created by Josh Sapers on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
#import "Colony.h"
@class DetailViewController;

@interface GameOfLifeFinalAppDelegate : NSObject <UIApplicationDelegate> {

    NSMutableArray *colonies;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;

@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, retain)IBOutlet UINavigationController *navController;

@end
