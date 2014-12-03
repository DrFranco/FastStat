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
        self.name =[aDecoder decodeObjectForKey:@"Name"];
        self.gamePlayed = [aDecoder decodeObjectForKey:@"GamePlayed"];
        self.gameStarted = [aDecoder decodeObjectForKey:@"GameStarted"];
        self.turnovers = [aDecoder decodeObjectForKey:@"Turnovers"];
        self.offensives = [aDecoder decodeObjectForKey:@"Offensives"];
        self.steals = [aDecoder decodeObjectForKey:@"Steals"];
        self.fieldBlocks = [aDecoder decodeObjectForKey:@"FieldBlocks"];
        self.ejectionsAgainst = [aDecoder decodeObjectForKey:@"EjectionsAgainst"];
        self.ejectionsEarned = [aDecoder decodeObjectForKey:@"EjectionsEarned"];
        self.attempts = [aDecoder decodeObjectForKey:@"Attempts"];
        self.goals = [aDecoder decodeObjectForKey:@"Goals"];
        self.assists = [aDecoder decodeObjectForKey:@"Assists"];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.gamePlayed forKey:@"GamePlayed"];
    [aCoder encodeObject:self.gameStarted forKey:@"GameStarted"];
    [aCoder encodeObject:self.turnovers forKey:@"Turnovers"];
    [aCoder encodeObject:self.offensives forKey:@"Offensives"];
    [aCoder encodeObject:self.steals forKey:@"Steals"];
    [aCoder encodeObject:self.fieldBlocks forKey:@"FieldBlocks"];
    [aCoder encodeObject:self.ejectionsAgainst forKey:@"EjectionsAgainst"];
    [aCoder encodeObject:self.ejectionsEarned forKey:@"EjectionsEarned"];
    [aCoder encodeObject:self.attempts forKey:@"Attempts"];
    [aCoder encodeObject:self.goals forKey:@"Goals"];
    [aCoder encodeObject:self.assists forKey:@"Assists"];
}
@end