//
//  Game.h
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Game : NSObject
{
    NSMutableArray *players;
    NSString *fileLoc;
}
@property (nonatomic) BOOL goalCancel;
-(NSMutableArray *) playerAccessor;
-(NSString *)filePath;
-(id) initWithSaveData;
-(void) saveData;
//+(void) initializeFileDic:(NSString*)FileNameExt;

@end
