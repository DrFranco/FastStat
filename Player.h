//
//  Player.h
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player: NSObject <NSCoding>
@property (nonatomic) BOOL gamePlayed;
@property (nonatomic) BOOL gameStarted;
@property (nonatomic) NSInteger turnovers;
@property (nonatomic) NSInteger offensives;
@property (nonatomic) NSInteger steals;
@property (nonatomic) NSInteger fieldBlocks;
@property (nonatomic) NSInteger ejectionsAgainst;
@property (nonatomic) NSInteger ejectionsEarned;
@property (nonatomic) NSInteger attempts;
@property (nonatomic) NSInteger goals;
@property (nonatomic) NSInteger assists;
@property (strong, nonatomic) NSString *name;


@end