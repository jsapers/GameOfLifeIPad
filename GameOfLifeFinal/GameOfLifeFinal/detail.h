//
//  detail.h
//  EvolveIpad
//
//  Created by Josh Sapers on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColonyView.h"

@interface detail : UIViewController {
    
    

        IBOutlet ColonyView *cv;
        IBOutlet UITextView *coordinates;
        IBOutlet UITextView *coordinates2;
        IBOutlet UITextField *colonyLabel;
        IBOutlet UISlider *cRed;
        IBOutlet UISlider *cBlue;
        IBOutlet UISlider *cGreen;
        IBOutlet UISlider *bRed;
        IBOutlet UISlider *bBlue;
        IBOutlet UISlider *bGreen;
        NSMutableArray *colonyName;
        NSMutableArray *colonyCoordinates;
        Colony *c;
        NSMutableArray *colonies;
        int useNum;
        }
    -(IBAction) setCells: (id)sender;
    -(IBAction) glider: (id)sender;
    -(IBAction) gliderGun: (id)sender;
    -(IBAction) basic: (id)sender;
    -(IBAction) setPreColony: (id)sender;
    -(IBAction) getPreColony: (id)sender;
    
    -(void)changeCells;
    -(UITextView*)getCoordinates;
    -(void)setCoordinates:(NSString*)coo;
    -(void)setColony:(NSMutableArray*)c2;
    -(void)updateCoodinates:(NSString*) coUpdate;
    -(void)test;
    @end
