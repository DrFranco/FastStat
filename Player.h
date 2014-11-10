//
//  Player.h
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player: NSObject
@property (strong, nonatomic) BOOL gamePlayed;
@property (strong, nonatomic) BOOL gameStarted;
@property (strong, nonatomic) NSInteger turnovers;
@property (strong, nonatomic) NSInteger offensives;
@property (strong, nonatomic) NSInteger steals;
@property (strong, nonatomic) NSInteger fieldBlocks;
@property (strong, nonatomic) NSInteger ejectionsAgainst;
@property (strong, nonatomic) NSInteger ejectionsEarned;
@property (strong, nonatomic) NSInteger attempts;
@property (strong, nonatomic) NSInteger goals;
@property (strong, nonatomic) NSInteger assists;


@end