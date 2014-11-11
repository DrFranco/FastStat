//
//  GameViewController.m
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import "GameViewController.h"
@interface GameViewController ()

@end


@implementation GameViewController
@synthesize teamScore, oppScore, quarter, currGame;
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
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity: 26];
    gvc.currGame = [Game new];
    NSArray *temp = [gvc.currGame playerAccessor];
    temp =newArray;
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

- (IBAction) nextQuarter
{
    if ([quarter.text isEqual:@"1st Quarter"])
    {
        quarter.text=@"2nd Quarter";
    }
    else if ([quarter.text isEqual:@"2nd Quarter"])
    {
        quarter.text=@"3rd Quarter";
    }
    else if ([quarter.text isEqual:@"3rd Quarter"])
    {
        quarter.text=@"4th Quarter";
    }
    else if ([quarter.text isEqual:@"4th Quarter"] && [oppScore.text intValue ]==[teamScore.text intValue])
    {
        quarter.text=@"OT";
    }
    else
    {
        [self endGame];
    }
        
    
}
-(void) endGame
{
    UIStoryboard *storyboard = self.storyboard;
    GameViewController *gvc = [storyboard instantiateViewControllerWithIdentifier:@"GameOver"];
    gvc.currGame = currGame;
    [self presentViewController:gvc animated:YES completion:nil];
}
- (IBAction) quitToMainMenu
{
    NSArray *temp =[currGame playerAccessor];
    temp = nil;
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end