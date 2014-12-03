//
//  Game.m
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//


#import "Game.h"
@implementation Game

- (id) init
{
    if (self=[super init])
    {
       
        NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity: 26];
        int i;
        for (i=0; i<26;i++)
        {
            Player *thisPlayer = [Player new];
            thisPlayer.name = [NSString stringWithFormat:@"%d", i+1];
            thisPlayer.goals =0;
            NSData* objData = [NSKeyedArchiver archivedDataWithRootObject:thisPlayer];
            [newArray addObject:objData];
        }
        players = newArray;
        
        
    }
    return self;
}
- (id) initWithSaveData
{
    NSString *initFilename;
    if (self=[super init])
    {
        NSString *savedDataFilename = [self savedDataFilename];
        if([[NSFileManager defaultManager]fileExistsAtPath:savedDataFilename])
        {
            initFilename = savedDataFilename;
            players = [[NSMutableArray alloc] initWithContentsOfFile: initFilename];
        }
        else
        {
            self = nil;
        }
        
    }
    return self;
}
- (BOOL) locationCheck
{
    NSString *savedDataFilename = [self savedDataFilename];
    return[[NSFileManager defaultManager]fileExistsAtPath:savedDataFilename];
}
-(NSMutableArray *) playerAccessor
{
    return players;
}

- (NSString *) savedDataFilename
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filename=[documentsDirectory stringByAppendingPathComponent:@"savedData.plist"];
    return filename;
}
-(void) saveData
{
    NSString *savedDataFilename = [self savedDataFilename];
    [players writeToFile:savedDataFilename atomically:YES];
}
@end