//
//  DetailViewController.h
//  GameOfLifeFinal
//
//  Created by Josh Sapers on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColonyView.h"
#import "Colony.h"
#import "ColonyDetailViewController.h"
#import "etra.h"
@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {

    IBOutlet ColonyView *cv;
    IBOutlet UISlider *evolveSpeed;
    IBOutlet UISwitch *wrap;
    IBOutlet UITextField *evolveGenerations;
    IBOutlet UIButton *evolveButton;
    IBOutlet UIButton *evolve1;
    IBOutlet UIButton *evolve10;
    IBOutlet UIButton *evolve100;
    IBOutlet UILabel *generation;
    Colony *c;
    NSTimer *t;
    CGPoint beforeTouch;
    CGPoint afterTouch;
    int*locCell1;
    int*locCell2;
    int tenCount;
    int maxGeneration;
    NSMutableArray *colonies;
    ColonyDetailViewController *cdvc;
    int colonyNum;
    etra *e;
    float *cellColor;
    float *bColor;
    BOOL color; 
    BOOL alive;
}



@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) id detailItem;

-(void)setHeader;
-(IBAction)wrapValueChanged:(id)sender;
- (IBAction)evolve:(id)sender;
- (IBAction)evolve1:(id)sender;
- (IBAction)evolve10:(id)sender;
- (IBAction)evolve100:(id)sender;
-(void)evolveTimer;
-(void) firstTouch:(UITouch*) firstTouch;
-(void) movedTouch:(UITouch*) secondTouch;
-(void) test;
-(void)setColony:(Colony*)colony2;
-(void)setColonies:(NSMutableArray*)colonies2;
-(void)setUseNum:(int)num;
-(void)setColonyView:(ColonyView*) cv2;
@end
