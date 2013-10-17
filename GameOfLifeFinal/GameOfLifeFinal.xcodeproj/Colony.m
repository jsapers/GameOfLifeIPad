//
//  Colony.m
//  GameOfLife
//
//  Created by Josh Sapers on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Colony.h"


@implementation Colony


-(Colony *) initColonyWithNumberRows: (int)rs numberCols: (int)cs{
    self = [super init];
    if (self) {
        numberCells= (rs+2)*(cs+2);
        cells = malloc(sizeof(char)*numberCells);
        evolveCells = malloc(sizeof(char)*(numberCells));
        for (int i=0; i<numberCells; i++) {
            cells[i]=0;
            evolveCells[i]=0;
            colonyName=[[NSMutableArray alloc]init];
            colonyCoordinates=[[NSMutableArray alloc]init];
            name=[[NSString alloc]initWithString:@"fred"];
            aliveCount=0;
        }
        numberCols=cs;
        numberRows=rs;
        wrap=YES;
        
    }
    return self;
}
-(void) setCellAliveRow:(int)r col: (int)c{
    //it sets a cell to alive
    
    cells[[self indexRow: r col: c]]=1;
    aliveCount++;
    
}
-(void) setCellDeadRow:(int)r col: (int)c{
    //it sets a cell to dead
    cells[[self indexRow: (int)r col: (int)c]]=0;
    aliveCount=aliveCount-1;
}
-(int) isCellAliveRow:(int)r col: (int)c{
    //checks to see if a cell is alive
    return cells[[self indexRow: (int)r col: (int)c]];
}
-(int) generation{
    //returns the generation number
    return generation;
}
-(int)numberRows{
    //returns the number of rows
    return numberRows;
}
-(int)numberCols{
    //returns the number of colums
    return numberCols;
}
-(void)evolve{
    //it uses counts the neighbors, uses the rules then updates the cells
    int* neighborCount;
    neighborCount = malloc(sizeof(int)*numberCells);
    
    for (int y=0; y<numberRows; y++) {
        for (int x=0; x<numberCols; x++) {
            int c=0;
            int rowtop,coltop,rowdown,coldown;
            if (wrap) {
                if (y==0) {
                    rowtop=numberRows-1;
                }
                else{
                    rowtop=y-1;
                }
                if (y==numberRows-1) {
                    rowdown=0;
                }
                else{
                    rowdown=y+1;
                }
                if (x==0) {
                    coltop=numberCols-1;
                }
                else{
                    coltop=x-1;
                }
                if (x==numberCols-1) {
                    coldown=0;
                }
                else{
                    coldown=x+1;
                }
            }
            else{
                rowtop=y-1;
                rowdown=y+1;
                coltop=x-1;
                coldown=x+1;
            }
            c=cells[[self indexRow: (int)rowtop col: (int)coltop]]+cells[[self indexRow: (int)rowtop col: (int)x]]+cells[[self indexRow: (int)rowtop col: (int)coldown]];
            c+=cells[[self indexRow: (int)y col: (int)coltop]]+cells[[self indexRow: (int)y col: (int)coldown]];
            c+=cells[[self indexRow: (int)rowdown col: (int)coltop]]+cells[[self indexRow: (int)rowdown col: (int)x]]+cells[[self indexRow: (int)rowdown col: (int)coldown]];
            neighborCount[[self indexRow: (int)y col: (int)x]]=c;
            //printf("% d %d %d: %d \n",y,x,[self indexRow: (int)y col: (int)x],neighborCount[[self indexRow: (int)y col: (int)x]]);
        }
    }
    
    for (int x=0; x<numberCells; x++) {
        
        if (neighborCount[x]<=1||neighborCount[x]>=4) {
            cells[x]=0;
        }
        if (neighborCount[x]==3) {
            cells[x]=1;
        }
    }
    generation++;
}


-(int)numberLivingCell{
    //it count all of the living cells
    int liveCount=0;
    for (int i=0; i<numberCells; i++) {
        if (cells[i]==1) {
            liveCount++;
        }
    }
    return liveCount;
}
-(void)resetColony{
    //sets all cells dead 
    for (int i=0; i<numberCells; i++) {
        cells[i]=0; 
        
    }
}
-(NSString *) report{
    //turns the chars cell into a NSString
    NSMutableString *report=[[NSMutableString alloc]init ];
    [report appendFormat:@"\n"];
    for (int i=0; i<numberCols; i++) {
        [report appendFormat:@"--"];
        
    }
    for (int i=0; i<numberRows; i++) {
        for (int x=0; x<numberCols; x++) {
            if (cells[[self indexRow:i col:x]]==1) {
                evolveCells[[self indexRow:i col:x]]='*';
            }
            else
                evolveCells[[self indexRow:i col:x]]=' ';
        }
    }
    for (int i=0; i<numberRows; i++) {
        [report appendFormat:@"\n"];
        for (int x=0; x<numberCols; x++) {
            if (x==0) {
                [report appendFormat:@"|"];
            }   
            
            [report appendFormat:@"%c ",evolveCells[[self indexRow:i col:x]]];
            if (x==numberCols-1) {
                [report appendFormat:@"|"];
            }  
        }
        
    }
    [report appendFormat:@"\n"];
    for (int i=0; i<numberCols; i++) {
        [report appendFormat:@"--"];
        
    }
    return report;
}

-(int) indexRow: (int)row col: (int)col{
    //finds the cell number from a row and colum
    return (row+1)*(numberCols +2)+(col+1);
}
-(BOOL)getWrap{
    //return whenther there is wrap or not
    return wrap;
}
-(void)setWrap:(BOOL)w
{
    //sets the wrap to yes or no
    wrap=w;
}
-(NSString *) cellsAsString{
    //turns the cells into an NSString
    int j;
    NSMutableString *report;
    for (int i=0; i<numberRows; i++) {
        [report appendFormat:@"\n"];
        for (j=0; j<numberCols; j++) {
            if ([self isCellAliveRow:i col:j]==1) {
                [report appendFormat:@"%d %d",i,j];
            }
        }
    }
    return report;
}
-(void) setCellsFromString:(NSString *)colonyAsString{
    //finds each set of coordinants from a string
    [self resetColony];
    int x,y;
    BOOL stop =YES;
    NSScanner* scan=[NSScanner scannerWithString:(NSString *)colonyAsString];
    while (stop) {
        [scan scanInt:&x];
        [scan scanInt:&y];
        cells[[self indexRow:x col:y]]=1;
        if ([scan isAtEnd]) {
            stop=NO;
        }
    }
    
}
-(int)countNeighborsRow:(int) row col: (int) col
{
    //it counts all of the neighbors and returns that number
    int c=0;
    int rowtop=row-1,coltop=col-1,rowdown=row+1,coldown=col+1;
    if (wrap) {
        if (row==1) {
            rowtop=numberRows-1;
            }
        else{
            rowtop=row-1;
        }
        if (row==numberRows-1) {
            rowdown=1;
        }
        else{
            rowdown=row+1;
        }
        if (col==1) {
            coltop=numberCols;
        }
        else{
            coltop=col-1;
        }
        if (col==numberCols) {
            coldown=1;
        }
        else{
            coldown=col+1;
        }
    }
    c=cells[[self indexRow: rowtop col: coltop]]+cells[[self indexRow: rowtop col: col]]+cells[[self indexRow: rowtop col: coldown]];
    c+=cells[[self indexRow: row col: coltop]]+cells[[self indexRow: row col: coldown]];
    c+=cells[[self indexRow: rowdown col: coltop]]+cells[[self indexRow: rowdown col: col]]+cells[[self indexRow: rowdown col: coldown]];
    return c;
}
-(void)enforceRulesCell:(int) cellNum Neighbors:(int)neighborCount
{
    //it takes the amount of neighbors and decides whether it is alive of dead
    if (neighborCount<=1||neighborCount>=4) {
        cells[cellNum]=0;
    }
    if (neighborCount==3) {
        cells[cellNum]=1;
        
    }
    
}
-(void)updateCells
{//it sets the actual cells after so the changed cells do not affect the evolve process
    for (int row=1; row<=numberRows; row++) {
        for (int col=1; col<=numberCols; col++) {
            cells[[self indexRow:row col:col]]=evolveCells[[self indexRow:row+1 col:col+1]];
        }
    }
}
- (void)dealloc {
    free(cells);
    [super dealloc];
}
-(void) setPreColony: (NSString*) cName coordinates:(NSString*) coo
{
    [colonyName addObject:cName];
    [colonyCoordinates addObject:coo];
    
}
-(NSString*) getPreColony2: (NSString*)cName
{
    
    for (int x=0; x<[colonyName count]; x++) {
        NSString *checkName =[[NSString alloc]initWithString:[colonyName objectAtIndex:x]];
        if([cName isEqualToString:checkName])
        {
            [self setCellsFromString:[colonyCoordinates objectAtIndex:x]];
             return [colonyCoordinates objectAtIndex:x];
        }
    }
    return@"";
}
-(void)setName:(NSString*)cName
{
    name=cName;
}
-(NSString*)getName;
{
    return name;
}


@end