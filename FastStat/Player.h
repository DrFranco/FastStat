//
//  Player.h
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player: NSObject <NSCoding>
@property (nonatomic) NSNumber *gamePlayed;
@property (nonatomic) NSNumber *gameStarted;
@property (nonatomic) NSNumber *turnovers;
@property (nonatomic) NSNumber *offensives;
@property (nonatomic) NSNumber *steals;
@property (nonatomic) NSNumber *fieldBlocks;
@property (nonatomic) NSNumber *ejectionsAgainst;
@property (nonatomic) NSNumber *ejectionsEarned;
@property (nonatomic) NSNumber *attempts;
@property (nonatomic) NSNumber *goals;
@property (nonatomic) NSNumber *assists;
@property (strong, nonatomic) NSString *name;


@end