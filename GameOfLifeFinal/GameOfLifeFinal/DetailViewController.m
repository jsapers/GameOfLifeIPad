 //
//  DetailViewController.m
//  GameOfLifeFinal
//
//  Created by Josh Sapers on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"

@interface DetailViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end

@implementation DetailViewController

@synthesize toolbar=_toolbar;

@synthesize detailItem=_detailItem;

@synthesize popoverController=_myPopoverController;

#pragma mark - Managing the detail item

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];
        
        // Update the view.
        [self configureView];
    }

    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

}


#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    e=[[etra alloc]init];
     c=[[Colony alloc]initColonyWithNumberRows:50 numberCols:50];
    colonies=[[NSMutableArray alloc]initWithObjects:c, nil];
    cdvc=[[ColonyDetailViewController alloc]init];
    [cdvc setColonies:colonies];
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]initWithTitle:@"detail" style:UIBarButtonItemStyleDone target:self action:@selector(test)];
    // Set this bar button item as the right item in the navigationItem 
    cellColor=malloc(3*sizeof(float));
    bColor=malloc(3*sizeof(float));
    cellColor[0]=0;
    cellColor[1]=0;
    cellColor[2]=0;
    bColor[0]=.5;
    bColor[1]=.5;
    bColor[2]=.5;
    [cdvc setSliderValueRed:.5 Green:.5 Blue:.5];
    [cv setColor:cellColor];
    color=NO;
    [[self navigationItem] setRightBarButtonItem:bbi];
    [cv getViewController:self];
    [super viewDidLoad];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [cdvc setColonies:colonies];
}
-(void) test
{
    [[self navigationController] pushViewController:cdvc animated:YES];
    }

-(void)viewWillAppear:(BOOL)animated
{
    colonies=[cdvc getColonies];
    if (color) {
        cellColor=[cdvc getCellColor];
        bColor=[cdvc getBackroundColor];
    }
    color=YES;
    [cv setColor:cellColor];
    [cv setBackgroundColor:[UIColor colorWithRed:bColor[0] green:bColor[1] blue:bColor[2] alpha:1]];
    [cv setColony:[colonies objectAtIndex:colonyNum]];
    [cv setNeedsDisplay];
    }

- (void)viewDidUnload
{
    [cv release];
    cv = nil;
    [evolveSpeed release];
    evolveSpeed = nil;
    [wrap release];
    wrap = nil;
    [evolveGenerations release];
    evolveGenerations = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}
-(IBAction)wrapValueChanged:(id)sender
{
    [[colonies objectAtIndex:colonyNum] setWrap:wrap.on];
}


- (IBAction)evolve:(id)sender
{
    evolveButton.enabled=NO;
    evolve1.enabled=NO;
    evolve10.enabled=NO;
    evolve100.enabled=NO;
    
    tenCount=0;
    NSScanner* scan=[NSScanner scannerWithString:evolveGenerations.text];
        [scan scanInt:&maxGeneration];
t= [NSTimer scheduledTimerWithTimeInterval:.05/evolveSpeed.value target:self selector:@selector(evolveTimer) userInfo:nil repeats:YES];
}


- (IBAction)evolve1:(id)sender
{
    evolveButton.enabled=NO;
    evolve1.enabled=NO;
    evolve10.enabled=NO;
    evolve100.enabled=NO;
    
    tenCount=0;
    maxGeneration=1;
    t= [NSTimer scheduledTimerWithTimeInterval:.05/evolveSpeed.value target:self selector:@selector(evolveTimer) userInfo:nil repeats:YES];
}
- (IBAction)evolve10:(id)sender
{
    evolveButton.enabled=NO;
    evolve1.enabled=NO;
    evolve10.enabled=NO;
    evolve100.enabled=NO;    
    tenCount=0;
    maxGeneration=10;
    t= [NSTimer scheduledTimerWithTimeInterval:.05/evolveSpeed.value target:self selector:@selector(evolveTimer) userInfo:nil repeats:YES];
}
- (IBAction)evolve100:(id)sender
{
    evolveButton.enabled=NO;
    evolve1.enabled=NO;
    evolve10.enabled=NO;
    evolve100.enabled=NO;    
    tenCount=0;
    maxGeneration=100;
    t= [NSTimer scheduledTimerWithTimeInterval:.05/evolveSpeed.value target:self selector:@selector(evolveTimer) userInfo:nil repeats:YES];
}


-(void)evolveTimer
{
    NSMutableString *coUpdate=[[NSMutableString alloc]init];
    [[colonies objectAtIndex:colonyNum] evolve];
   NSString *gen=[[NSString alloc]initWithFormat:@"%d",[[colonies objectAtIndex:colonyNum] generation]];
    generation.text=gen;
    tenCount++;
    bColor=[cdvc getBackroundColor];
    [cv setBackgroundColor:[UIColor colorWithRed:bColor[0] green:bColor[1] blue:bColor[2] alpha:1]];
    [cv setNeedsDisplay];
    if (tenCount==maxGeneration) {
        [t invalidate];
        for (int r=1; r<50; r++) {
            for (int col=1; col<50; col++) {
                if ([c isCellAliveRow:r col:col]==1) {
                    [coUpdate appendFormat:@"%d %d\n",r,col];
                }
            }
        }
        //[t release];
        t=nil;
        evolveButton.enabled=YES;
        evolve1.enabled=YES;
        evolve10.enabled=YES;
        evolve100.enabled=YES;   
    }
}



-(void) firstTouch:(UITouch*) firstTouch
{
    locCell1= malloc(2*(sizeof(int)));
    beforeTouch=[firstTouch locationInView:cv];
    locCell1=[cv locationAsCells:beforeTouch];
    
    if ([[colonies objectAtIndex:colonyNum ] isCellAliveRow:locCell1[1] col:locCell1[0]]==1) {
        [[colonies objectAtIndex:colonyNum ] setCellDeadRow:locCell1[1] col:locCell1[0]];
        alive=NO;
    }
    else
    {
        [[colonies objectAtIndex:colonyNum ] setCellAliveRow:locCell1[1] col:locCell1[0]]; 
        alive=YES;
    }
    [cv setColony:[colonies objectAtIndex:colonyNum ]];
    [cv setColor:cellColor];
    bColor=[cdvc getBackroundColor];
    [cv setBackgroundColor:[UIColor colorWithRed:bColor[0] green:bColor[1] blue:bColor[2] alpha:1]];
    [cv setNeedsDisplay];
    
}

-(void) movedTouch:(UITouch*) secondTouch
{
    locCell2= malloc(2*(sizeof(int)));
    afterTouch=[secondTouch locationInView:cv];
    locCell1=[cv locationAsCells:afterTouch];
    locCell2=[cv locationAsCells:beforeTouch];
    if (locCell1[0]!=locCell2[0] || locCell1[1]!=locCell2[1]) {
        
        if (alive) {
                  [[colonies objectAtIndex:colonyNum ] setCellAliveRow:locCell1[1] col:locCell1[0]];
        }
        else
            [[colonies objectAtIndex:colonyNum ] setCellDeadRow:locCell1[1] col:locCell1[0]];

        
    }    
    
    [cv setColony:[colonies objectAtIndex:colonyNum ]];
    [cv setColor:cellColor];
    bColor=[cdvc getBackroundColor];
    [cv setBackgroundColor:[UIColor colorWithRed:bColor[0] green:bColor[1] blue:bColor[2] alpha:1]];
    [cv setNeedsDisplay];
    
}
#pragma mark - model support

-(void)setColonies:(NSMutableArray*)colonies2
{
    colonies=colonies2;
    [cdvc setColonies:colonies];
}
-(void)setColony:(Colony*)colony2
{
    c=colony2;
}

-(void)setUseNum:(int)num
{
    colonyNum=num;
    [cdvc setUseNum:num];
    if ([[colonies objectAtIndex:colonyNum] getWrap]==YES) {
        wrap.on=YES;
    }
    else
        wrap.on=NO;
    NSString *gen=[[NSString alloc]initWithFormat:@"%d",[[colonies objectAtIndex:colonyNum] generation]];
    generation.text=gen;
    bColor=[cdvc getBackroundColor];
    [cv setBackgroundColor:[UIColor colorWithRed:bColor[0] green:bColor[1] blue:bColor[2] alpha:1]];
    [cv setColony:[colonies objectAtIndex:colonyNum]];
    [cv setNeedsDisplay];

}

-(void)setColonyView:(ColonyView*)cv2
{
    cv=cv2;
    [cdvc setColonyView:cv];
}
#pragma mark - navigation support

- (void)setHeader {
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPossession:)];
        // Set this bar button item as the right item in the navigationItem 
        [[self navigationItem] setRightBarButtonItem:bbi];
        // The navigationItem retains its buttons, so bbi can be released 
        [bbi release];
        // Set the title of the navigation item 
        [[self navigationItem] setTitle:@"Colony"];
    
}

#pragma mark - Split view support

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController: (UIPopoverController *)pc
{
    barButtonItem.title = @"Events";
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
 */

- (void)dealloc
{
    [_myPopoverController release];
    [_toolbar release];
    [_detailItem release];

    [cv release];
    [evolveSpeed release];
    [wrap release];
    [evolveGenerations release];
    [super dealloc];
}

@end
