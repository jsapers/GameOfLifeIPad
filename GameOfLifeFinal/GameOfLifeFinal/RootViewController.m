//
//  RootViewController.m
//  GameOfLifeFinal
//
//  Created by Josh Sapers on 4/9/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "Colony.h"
#import "DetailViewController.h"

@implementation RootViewController
		
@synthesize detailViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    Colony* c =[[Colony alloc]initColonyWithNumberRows:50 numberCols:50];
    colonies=[[NSMutableArray alloc]initWithObjects:c, nil];
    //[c release];
    cellNum=1;
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewCell)];
    // Set this bar button item as the right item in the navigationItem 
    [[self navigationItem] setRightBarButtonItem:bbi];
    [[self navigationItem] setTitle:@"colonies"];

}

		
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(void)addNewCell
{
    Colony* c =[[Colony alloc]initColonyWithNumberRows:50 numberCols:50];
    [colonies addObject:c];
    [c release];
    [self.detailViewController setColonies:colonies];
    cellNum++;
    //printf("%d",cellNum);
    [self tableView:[self tableView] numberOfRowsInSection:cellNum];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    		
}

		
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // printf("%d",section);
    return cellNum;
    		
}

		
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NSString *name=[[NSString alloc]initWithFormat:@"colony %d",[indexPath row]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        [[cell textLabel] setText:name];
        [name release];
    }

    // Configure the cell.
    		
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here -- for example, create and push another view controller.
    
    [self.detailViewController setUseNum:[indexPath row]];
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     NSManagedObject *selectedObject = [[self fetchedResultsController] objectAtIndexPath:indexPath];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

#pragma mark - model support

-(void)setColonies:(NSMutableArray*)colonies2
{
    colonies=colonies2;
}
-(void)setDetail:(DetailViewController*)d2
{
    self.detailViewController=d2;
}

- (void)dealloc
{
    [detailViewController release];
    [super dealloc];
}

@end
