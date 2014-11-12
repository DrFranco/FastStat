//
//  AppDelegate.h
//  FastStat
//
//  Created by Michael Franco on 10/26/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    Game *currGame;
}
@property (strong, nonatomic) UIWindow *window;


@end

