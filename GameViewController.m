//
//  GameViewController.m
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import "GameViewController.h"
#import "Game.h"
@interface GameViewController ()

@end


@implementation GameViewController
@synthesize teamScore, oppScore;
-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        //Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}




- (IBAction) newGame
{
    UIStoryboard *storyboard = self.storyboard;
    GameViewController *gvc = [storyboard instantiateViewControllerWithIdentifier:@"InGameMenu"];
    [self presentViewController:gvc animated:YES completion:nil];

}


//Ejections
- (IBAction) ejectionCalled
{
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Against or Earned?"message:@"Choose applicable" delegate: self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Against",@"Earned", nil];
    [alert show];
}
- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)
    {
        UIStoryboard *storyboard = self.storyboard;
        GameViewController *gvc = [storyboard instantiateViewControllerWithIdentifier:@"EjectionAgainstHandler"];
        [self presentViewController:gvc animated:YES completion:nil];
    }
    else if(buttonIndex==2)
    {
        UIStoryboard *storyboard = self.storyboard;
        GameViewController *gvc = [storyboard instantiateViewControllerWithIdentifier:@"EjectionEarnedHandler"];
        [self presentViewController:gvc animated:YES completion:nil];
    }
}
- (IBAction) ejectionAgainst
{
    
}


//Opponent scores. Stat isn't taken, for scoring purposes only
- (IBAction) oppGoal
{
    int x = [oppScore.text intValue];
    x++;
    oppScore.text = [NSString stringWithFormat:@"%ld", (long)x];
}

- (IBAction) returnToGame
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction) quitToMainMenu
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end