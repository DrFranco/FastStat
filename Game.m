//
//  Game.m
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//


#import "Game.h"
@implementation Game

/*- (id) init
{
    NSString *initFilename;
    if (self=[super init])
    {
        NSString *savedDataFilename = [self savedDataFilename];
        if([[NSFileManager defaultManager]fileExistsAtPath:savedDataFilename])
        {
            initFilename = savedDataFilename;
        }
        else
        {
            NSBundle *bundle = [NSBundle mainBundle];
            initFilename = [bundle pathForResource:@"DefaultNames" ofType: @"plist"];
        }
        players = [[NSMutableArray alloc] initWithContentsOfFile: initFilename];
    }
    return self;
}*/
-(NSArray *) playerNames
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