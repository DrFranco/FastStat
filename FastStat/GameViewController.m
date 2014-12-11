//
//  GameViewController.m
//  FastStat
//
//  Created by Michael Franco on 11/9/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import "GameViewController.h"
#define TAG_LOAD 1
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
- (void)viewWillAppear:(BOOL)animated
{
    if ([currGame goalCancel])
    {
        int x = [teamScore.text intValue];
        x--;
        teamScore.text = [NSString stringWithFormat:@"%ld", (long)x];
        currGame.goalCancel=NO;
    }
}



- (IBAction) newGame:(id) sender
{
    UIStoryboard *storyboard = self.storyboard;
    GameViewController *gvc = [storyboard instantiateViewControllerWithIdentifier:@"InGameMenu"];
    NSString *identifier = ((UIButton *) sender).titleLabel.text;
    if ([identifier  isEqual: @"New Game"])
    {
        gvc.currGame = [[Game alloc]init];
    }
    else if ([identifier isEqual: @"Load Team"])
    {
        gvc.currGame =[[Game alloc]initWithSaveData];
        if (gvc.currGame == nil)
        {
            UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Save Data Not Found!"message:@"There doesn't appear to be any team currently saved" delegate: self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            return;
        }
    }
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
    if (alertView.tag==TAG_LOAD)
    {
        if (buttonIndex==1)
        {
            UIStoryboard *storyboard = self.storyboard;
            UINavigationController *uinc = [storyboard instantiateViewControllerWithIdentifier:@"TeamCont"];
            EndOfGameViewController *eogvc = (EndOfGameViewController *)[uinc.viewControllers objectAtIndex:0];
            eogvc.currGame = [[Game alloc]init];
            [self presentViewController:uinc animated:YES completion:nil];
        }
    }
    else{
        
    
    if (buttonIndex==1)
    {
        UIStoryboard *storyboard = self.storyboard;
        DataInsertionController *dic = [storyboard instantiateViewControllerWithIdentifier:@"EjectionAgainstHandler"];
        dic.currGame = currGame;
        [self presentViewController:dic animated:YES completion:nil];
    }
    else if(buttonIndex==2)
    {
        UIStoryboard *storyboard = self.storyboard;
        DataInsertionController *dic = [storyboard instantiateViewControllerWithIdentifier:@"EjectionEarnedHandler"];
        dic.currGame = currGame;
        [self presentViewController:dic animated:YES completion:nil];
    }
    }
}


// Game Played
- (IBAction) gamePlayed
{
    UIStoryboard *storyboard = self.storyboard;
    DataInsertionController *dic = [storyboard instantiateViewControllerWithIdentifier:@"GamePlayedHandler"];
    dic.currGame = currGame;
    [self presentViewController: dic animated: YES completion: nil];
}

//GameStarted
- (IBAction) gameStarted
{
    UIStoryboard *storyboard = self.storyboard;
    DataInsertionController *dic =[storyboard instantiateViewControllerWithIdentifier:@"GameStartedHandler"];
    dic.currGame = currGame;
    [self presentViewController:dic animated:YES completion:nil];
}

//Turnover
- (IBAction) turnover
{
    UIStoryboard *storyboard = self.storyboard;
    DataInsertionController *dic =[storyboard instantiateViewControllerWithIdentifier:@"TurnoverHandler"];
    dic.currGame = currGame;
    [self presentViewController:dic animated:YES completion:nil];
}

//Offensive
- (IBAction) offensive
{
    UIStoryboard *storyboard = self.storyboard;
    DataInsertionController *dic =[storyboard instantiateViewControllerWithIdentifier:@"OffensiveHandler"];
    dic.currGame = currGame;
    [self presentViewController:dic animated:YES completion:nil];
}

//FieldBlock
- (IBAction) fieldBlock
{
    UIStoryboard *storyboard = self.storyboard;
    DataInsertionController *dic =[storyboard instantiateViewControllerWithIdentifier:@"FieldBlockHandler"];
    dic.currGame = currGame;
    [self presentViewController:dic animated:YES completion:nil];
}

//Steal
- (IBAction) steal
{
    UIStoryboard *storyboard = self.storyboard;
    DataInsertionController *dic =[storyboard instantiateViewControllerWithIdentifier:@"StealHandler"];
    dic.currGame = currGame;
    [self presentViewController:dic animated:YES completion:nil];
}

//Shot (Attempt)
-(IBAction) shot
{
    UIStoryboard *storyboard = self.storyboard;
    DataInsertionController *dic =[storyboard instantiateViewControllerWithIdentifier:@"ShotHandler"];
    dic.currGame = currGame;
    [self presentViewController:dic animated:YES completion:nil];
}

//Goal
- (IBAction)goal
{
    int x = [teamScore.text intValue];
    x++;
    teamScore.text = [NSString stringWithFormat:@"%ld", (long)x];
    UIStoryboard *storyboard = self.storyboard;
    DataInsertionController *dic =[storyboard instantiateViewControllerWithIdentifier:@"GoalHandler"];
    dic.currGame = currGame;
    [self presentViewController:dic animated:YES completion:nil];
}

//Assist
- (IBAction) assist
{
    UIStoryboard *storyboard = self.storyboard;
    DataInsertionController *dic =[storyboard instantiateViewControllerWithIdentifier:@"AssistHandler"];
    dic.currGame = currGame;
    [self presentViewController:dic animated:YES completion:nil];
}

//Opponent scores. Stat isn't taken, for scoring purposes only
- (IBAction) oppGoal
{
    int x = [oppScore.text intValue];
    x++;
    oppScore.text = [NSString stringWithFormat:@"%ld", (long)x];
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
    UINavigationController *uinc = [storyboard instantiateViewControllerWithIdentifier:@"NavCont"];
    EndOfGameViewController *eogvc = (EndOfGameViewController *)[uinc.viewControllers objectAtIndex:0];
    eogvc.currGame = self.currGame;
    [self presentViewController:uinc animated:YES completion:nil];
}
- (IBAction) createTeam
{
    Game *temp =[[Game alloc]initWithSaveData];
    if (temp != nil)
    {
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Save Data Found!"message:@"There appears to already be a team saved to this device, do you wish to continue?" delegate: self cancelButtonTitle:@"Cancel" otherButtonTitles: @"Continue", nil];
        alert.tag=TAG_LOAD;
        [alert show];
    }
    
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