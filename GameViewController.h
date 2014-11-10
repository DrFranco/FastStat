//
//  GameViewController.h
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *teamScore;
@property (weak, nonatomic) IBOutlet UILabel *oppScore;
@property (weak, nonatomic) IBOutlet UILabel *quarter;
- (IBAction)returnToGame;
- (IBAction) quitToMainMenu;


@end