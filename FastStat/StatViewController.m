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
    self.gpLabel.text = (temp.gamePlayed)? @"Game Played: Yes":@"Game Played: No";
    self.gsLabel.text = (temp.gameStarted)? @"Game Started: Yes":@"Game Started: No";
    self.turnoverLabel.text = [NSString stringWithFormat:@"Turnovers: %d",(int)temp.turnovers];
    self.offLabel.text = [NSString stringWithFormat:@"Offensives: %d",(int)temp.offensives];
    self.stealLabel.text = [NSString stringWithFormat:@"Steals: %d",(int)temp.steals];
    self.fbLabel.text = [NSString stringWithFormat:@"Fieldblocks: %d",(int)temp.fieldBlocks];
    eaLabel.text = [NSString stringWithFormat:@"Ejections Against: %d",(int)temp.ejectionsAgainst];
    eeLabel.text = [NSString stringWithFormat:@"Ejections Earned: %d",(int)temp.ejectionsEarned];
    attLabel.text = [NSString stringWithFormat:@"Shots: %d",(int)temp.attempts];
    goalLabel.text = [NSString stringWithFormat:@"Goals: %d",(int)temp.goals];
    assLabel.text = [NSString stringWithFormat:@"Assists: %d",(int)temp.assists];
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
