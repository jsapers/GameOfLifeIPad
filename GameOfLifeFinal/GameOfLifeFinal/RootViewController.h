//
//  RootViewController.h
//  GameOfLifeFinal
//
//  Created by Josh Sapers on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController {
    int cellNum;
    NSMutableArray *colonies;
   
}

		
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;
-(void)addNewCell;
-(void)setColonies:(NSMutableArray*)colonies2;
-(void)setDetail:(DetailViewController*)d2;
@end
