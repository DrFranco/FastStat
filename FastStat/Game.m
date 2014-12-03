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
        NSString *initFilename;
        NSBundle *bundle = [NSBundle mainBundle];
        initFilename =
        [bundle pathForResource:@"Default"  ofType:@"plist"];
        players = [[NSMutableArray alloc ] initWithContentsOfFile:initFilename];
        int i;
        for (i=0; i<26;i++)
        {
            Player *thisPlayer = [Player new];
            thisPlayer.name = [NSString stringWithFormat:@"%d", i+1];
            thisPlayer.gamePlayed =@0;
            thisPlayer.gameStarted =@0;
            thisPlayer.turnovers =@0;
            thisPlayer.offensives =@0;
            thisPlayer.steals =@0;
            thisPlayer.fieldBlocks = @0;
            thisPlayer.ejectionsAgainst = @0;
            thisPlayer.ejectionsEarned = @0;
            thisPlayer.attempts = @0;
            thisPlayer.assists = @0;
            thisPlayer.goals =@0;
            NSData* objData = [NSKeyedArchiver archivedDataWithRootObject:thisPlayer];
            [players replaceObjectAtIndex:i withObject:objData];
        }
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
            NSLog(@"Hopefully all is well \n\n");
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
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filename=[[documentsDirectory stringByAppendingPathComponent:@"savedData"]stringByAppendingPathExtension:@"plist"];
    return filename;
}
-(void) saveData
{
    NSString *savedDataFilename = [self savedDataFilename];
    [players writeToFile:savedDataFilename atomically:YES];
}
/*+(void) initializeFileDic:(NSString*)FileNameExt
{
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *startPath = [[path stringByAppendingPathComponent:FileNameExt]stringByAppendingPathExtension:@"plist"];
    NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [[documentsDirectoryPath stringByAppendingPathComponent:FileNameExt]stringByAppendingPathExtension:@"plist"];
    NSLog(@"Help!\n");
    NSLog(@"%@ \n,\n %@ ", startPath,filePath);
    if([NSMutableArray arrayWithContentsOfFile:startPath])
    {
        NSLog(@"File %@exists",filePath);
    }
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        if ([[NSMutableArray arrayWithContentsOfFile:startPath]writeToFile:filePath atomically:NO])
        {
            NSLog(@"File copied inside App DocumentsDirectory\n\n");
        }
    }
    else{
        NSLog(@"Error while trying to copy into DocumentsDirectory\n\n");
    }
}*/
@end