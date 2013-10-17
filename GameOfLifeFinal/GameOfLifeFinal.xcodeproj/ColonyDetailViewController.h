//
//  detail.h
//  EvolveIpad
//
//  Created by Josh Sapers on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColonyView.h"

@interface ColonyDetailViewController : UIViewController  {
    
    
    
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
    float *cellColor;
    float *bColor;
}
-(IBAction) setCells: (id)sender;
-(IBAction) glider: (id)sender;
-(IBAction) gliderGun: (id)sender;
-(IBAction) basic: (id)sender;
-(IBAction) setPreColony: (id)sender;
-(IBAction) getPreColony: (id)sender;
-(IBAction) sliderValueChanged:(id)sender;

-(void)changeCells;
-(UITextView*)getCoordinates;
-(void)setCoordinates:(NSString*)coo;
-(void)setColony:(Colony*)c2;
-(void)setColonies:(NSMutableArray*)colonies2;
-(NSMutableArray*)getColonies;
-(void)updateCoodinates:(NSString*) coUpdate;
-(void)test;
-(Colony*)getcolony;
-(void)setColonyView:(ColonyView*)cv2;
-(ColonyView*)getColonyView;
-(void)setUseNum:(int)use;
-(float*)getCellColor;
-(float*)getBackroundColor;
-(void)setSliderValueRed:(float)r Green:(float)g Blue:(float)b;
//-(void)decode:(NSCoder*)deCoder;
@end
