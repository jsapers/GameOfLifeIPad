//
//  ColonyView.m
//  EvolveIpad
//
//  Created by Josh Sapers on 12/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ColonyView.h"
#import "DetailViewController.h"



@implementation ColonyView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        cellColor =[[UIColor alloc]init];
            }
    return self;
}

-(void)setColony:(id)c2{
    c=c2;
    
}
-(Colony*)getColony{
    return c;
}
-(void)drawRect:(CGRect)rect
{
    [self setBackgroundColor:[UIColor lightGrayColor]];
    bounds = [self bounds];
    CGPoint center;
    center.x=bounds.origin.x + bounds.size.width /2.0;
    center.x=bounds.origin.y + bounds.size.height /2.0;
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i=1; i<=50; i++) {
        for (int x=1; x<=50; x++){
            
            if ([c isCellAliveRow:i col:x]==1) {
               //CGColorRef color =[cellColor CGColor];
            // CGContextSetFillColorWithColor(context, color);
                CGContextSetRGBFillColor(context, red, green, blue, 0.5);
                    CGContextFillRect(context, CGRectMake((x-1)*(bounds.size.height/50), (i-1)*(bounds.size.width/50), (bounds.size.height/50), (bounds.size.height/50)));
            }
        }
    }
}

-(void)getViewController: (DetailViewController*)dvc{
    myController=dvc; 
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    [myController firstTouch:touch];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    [myController movedTouch:touch];
}

-(void)endTouches:(NSSet *) touches
{
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(int*)locationAsCells:(CGPoint) loc
{
    int* locCell= malloc(2*(sizeof(int)));
    locCell[0]=loc.x/(bounds.size.width/50)+1;
    locCell[1]=loc.y/(bounds.size.height/50)+1;
    return locCell;
}

-(void)setColor:(float*)color
{
    red=color[0];
    green=color[1];
    blue=color[2];
    }
- (void)dealloc
{
    printf("%d\n",[c retainCount]);
    
    [c release];
    [super dealloc];
}

@end
