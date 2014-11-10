//
//  Game.h
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
@implementation Player
@synthesize gamePlayed, gameStarted, turnovers,offensives,steals,fieldBlocks, ejectionsAgainst,ejectionsEarned,attempts,goals,assists;
@end
@interface Game : NSObject
{
    Player *player;
}

-(NSArray *) playerNames;

-(void) saveData;
@end
