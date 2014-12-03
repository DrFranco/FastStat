//
//  Player.m
//  FastStat
//
//  Created by Michael Franco on 11/10/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//


#import "Player.h"
@implementation Player
@synthesize gamePlayed, gameStarted, turnovers,offensives,steals,fieldBlocks, ejectionsAgainst,ejectionsEarned,attempts,goals,assists,name;

-(id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        name =[[aDecoder decodeObjectForKey:@"Name"] copy];
        gamePlayed = [[aDecoder decodeObjectForKey:@"GamePlayed"] copy];
        gameStarted = [[aDecoder decodeObjectForKey:@"GameStarted"] copy];
    }
}
@end