//
//  detail.m
//  EvolveIpad
//
//  Created by Josh Sapers on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "detail.h"


@implementation detail

-(id) init{
    self = [super initWithNibName:@"detail" bundle:nil];
    if (self){
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"details"];
        colonyName=[[NSMutableArray alloc]init];
        colonyCoordinates=[[NSMutableArray alloc]init]; 
        useNum=0;
            }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(IBAction) setCells: (id)sender    
{
    [coordinates2 resignFirstResponder];
    [self changeCells];
}
-(IBAction) glider: (id)sender
{
    [coordinates2 resignFirstResponder];
    coordinates2.text=@"1 2\n2 3\n3 1\n3 2\n3 3";
    [self changeCells];
}
-(IBAction) gliderGun: (id)sender
{
    [coordinates2 resignFirstResponder];
    coordinates2.text=@"3 4\n3 17\n3 25\n3 38\n4 4\n4 17\n4 25\n4 38\n5 3\n5 5\n5 16\n5 18\n5 24\n5 26\n5 37\n5 39\n6 4\n6 17\n6 25\n6 38\n7 4\n7 17\n7 25\n7 38\n8 5\n8 9\n8 10\n8 11\n8 12\n8 16\n8 26\n8 30\n8 31\n8 32\n8 33\n8 37\n9 9\n9 10\n9 11\n9 12\n9 21\n9 30\n9 31\n9 32\n9 33\n10 5\n10 6\n10 7\n10 8\n10 13\n10 14\n10 15\n10 16\n10 19\n10 20\n10 21\n10 22\n10 23\n10 26\n10 27\n10 28\n10 29\n10 34\n10 35\n10 36\n10 37\n11 18\n11 20\n11 22\n11 24\n12 7\n12 14\n12 28\n12 35\n13 8\n13 9\n13 12\n13 13\n13 20\n13 22\n13 29\n13 30\n13 33\n13 34\n14 17\n14 20\n14 22\n14 25\n15 17\n15 20\n15 22\n15 25\n16 17\n16 19\n16 23\n16 25\n19 17\n19 18\n19 24\n19 25\n20 17\n20 18\n20 24\n20 25\n22 19\n22 20\n22 22\n22 23\n23 18\n23 20\n23 22\n23 24\n24 18\n24 20\n24 22\n24 24\n25 20\n25 22\n26 18\n26 19\n26 23\n26 24";
    [self changeCells];
}
-(IBAction) basic: (id)sender
{
    [coordinates2 resignFirstResponder];
    coordinates2.text=@"5 5\n5 6\n5 7\n6 6";
    [self changeCells];
}
-(IBAction) setPreColony: (id)sender
{
    [colonyLabel resignFirstResponder];
    [c setPreColony:colonyLabel.text coordinates:coordinates2.text];
    }
-(IBAction) getPreColony: (id)sender
{
    [colonyLabel resignFirstResponder];
    
}
-(void)changeCells
{
    [c setCellsFromString:coordinates2.text];
    [cv setColony:c];
    //[fvc setColony:c];
    //[[fvc getColonyView] setNeedsDisplay];
    [cv setNeedsDisplay];
}
-(void)updateCoodinates:(NSString*) coUpdate
{
    coordinates2.text=coUpdate;
    [self changeCells];
}
-(UITextView*)getCoordinates
{
    return coordinates2;
}
-(void)test
{
    printf("i'm here at test");
}
-(void)setCoordinates:(NSString*)coo
{
    coordinates2.text=coo;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)setColony: (NSMutableArray *)c2
{
    colonies=c2;
    c=[colonies objectAtIndex:useNum];
    
}

-(ColonyView*)getColonyView
{
    return cv;
}

- (void)dealloc
{
    [super dealloc];
}

@end
