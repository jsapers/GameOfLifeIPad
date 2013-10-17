//
//  ColonyView.h
//  EvolveIpad
//
//  Created by Josh Sapers on 12/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colony.h"
//#import "EvolveIpadViewController.h"
@class DetailViewController;


@interface ColonyView : UIView {
    Colony *c;
    DetailViewController *myController;
    CGRect bounds;
    UIColor *cellColor;
    float red;
    float green;
    float blue;
}

-(void)setColony:(id)c2;
-(Colony*)getColony;
-(void)endTouches:(NSSet *) touches;
-(int*)locationAsCells:(CGPoint) loc;
-(void)getViewController: (id)evc;
-(void)setColor:(float*)color;
@end
