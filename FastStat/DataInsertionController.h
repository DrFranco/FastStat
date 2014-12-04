//
//  DataInsertionController.h
//  FastStat
//
//  Created by Michael Franco on 11/10/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "GameViewController.h"
#import "Game.h"
@interface DataInsertionController : UIViewController
@property (strong, nonatomic) Game *currGame;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property Player *player;
@property (nonatomic) NSInteger index;
@end