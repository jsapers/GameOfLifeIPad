//  Colony.h
//  GameOfLife
//
//  Created by Josh Sapers on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Colony : NSObject {
    char *cells;
    char *evolveCells;
    int generation;
    int numberRows;
    int numberCols;
    int numberCells,numberCellsOut;
    BOOL wrap;
    int setCount;
    NSMutableArray *colonyName;
    NSMutableArray *colonyCoordinates;
    NSString *name;
    int aliveCount;
}

-(Colony*) initColonyWithNumberRows: (int)rs numberCols: (int)cs;
-(void) setCellAliveRow:(int)r col: (int)c; 
-(void) setCellDeadRow:(int)r col: (int)c; 
-(int) isCellAliveRow:(int)r col: (int)c; 
-(int) generation;
-(int)numberRows;
-(int)numberCols;
-(void)evolve;
-(int)numberLivingCell;
-(void)resetColony;
-(NSString*) report;
-(int) indexRow: (int)r col: (int)c;
-(BOOL)getWrap;
-(void)setWrap:(BOOL)w;
-(NSString*) cellsAsString;
-(void)setCellsFromString:(NSString *) colonyAsString;
-(int)countNeighborsRow:(int) row col: (int) col;
-(void)enforceRulesCell:(int) cellNum Neighbors:(int)NeighborCount;
-(void)updateCells;
-(void) setPreColony: (NSString*) cName coordinates:(NSString*)coo;
-(NSString*) getPreColony2: (NSString*)cName;
-(void)setName:(NSString*)cName;
-(NSString*)getName;
@end
