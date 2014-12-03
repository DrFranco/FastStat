//
//  StatViewController.m
//  FastStat
//
//  Created by Michael Franco on 11/11/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//  Code inspired by DetailsViewController created by Joshua Conner in MVCDemo. No plagiarism intended.

#import "StatViewController.h"

@interface StatViewController ()

@end

@implementation StatViewController

@synthesize nameLabel,gpLabel, gsLabel,turnoverLabel, offLabel, stealLabel, fbLabel,eaLabel,eeLabel,attLabel,goalLabel,assLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    Player *temp=self.player;
    self.nameLabel.text = [NSString stringWithFormat:@"Player: %@",temp.name];
    self.gpLabel.text = ([temp.gamePlayed isEqualToNumber:@1])? @"Game Played: Yes":@"Game Played: No";
    self.gsLabel.text = ([temp.gameStarted isEqualToNumber:@1])? @"Game Started: Yes":@"Game Started: No";
    self.turnoverLabel.text = [NSString stringWithFormat:@"Turnovers: %d",[temp.turnovers intValue]];
    self.offLabel.text = [NSString stringWithFormat:@"Offensives: %d",[temp.offensives intValue]];
    self.stealLabel.text = [NSString stringWithFormat:@"Steals: %d",[temp.steals intValue]];
    self.fbLabel.text = [NSString stringWithFormat:@"Fieldblocks: %d",[temp.fieldBlocks intValue]];
    eaLabel.text = [NSString stringWithFormat:@"Ejections Against: %d",[temp.ejectionsAgainst intValue]];
    eeLabel.text = [NSString stringWithFormat:@"Ejections Earned: %d",[temp.ejectionsEarned intValue]];
    attLabel.text = [NSString stringWithFormat:@"Shots: %d",[temp.attempts intValue]];
    goalLabel.text = [NSString stringWithFormat:@"Goals: %d",[temp.goals intValue]];
    assLabel.text = [NSString stringWithFormat:@"Assists: %d",[temp.assists intValue]];
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
