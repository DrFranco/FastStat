//
//  DataInsertionController.m
//  FastStat
//
//  Created by Michael Franco on 11/10/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//
#define TAG_ERR 1
#define TAG_OK 2
#import "DataInsertionController.h"
@implementation DataInsertionController

@synthesize textField, currGame;


- (void) viewDidLoad
{
    [super viewDidLoad];
    UIToolbar* numberToolbar= [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButton)], [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(buttonPushed)],nil];
    [numberToolbar sizeToFit];
    textField.inputAccessoryView=numberToolbar;
    [textField becomeFirstResponder];
}


-(void) buttonPushed
{
    NSArray *temp = [currGame playerAccessor];
    NSUInteger num = [temp count];
    if ([textField.text integerValue]>num || [textField.text integerValue] < 1|| [textField.text isEqualToString:@""])
    {
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"Invalid Number" message:@"Please check if number is valid. By default, numbers cannot exceed 26." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        alert.tag=TAG_ERR;
        [alert show];
    }
    else
    {
        NSString *restorationId = self.restorationIdentifier;
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ #%@",restorationId,textField.text]message:@"Are you sure?" delegate: self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
        alert.tag=TAG_OK;
        [alert show];
    }
    
}
- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //now this is unnecessary at the moment, but if I were to add more alerts, it would avoid problems
    if (alertView.tag==TAG_OK)
    {
        if (buttonIndex==1)
        {
            NSMutableArray *temp = [currGame playerAccessor];
            Player *tempPlayer = [temp objectAtIndex:[textField.text integerValue]-1];
            NSString *restorationId = self.restorationIdentifier;
            if ([restorationId isEqualToString:@"Ejection Against"])
                tempPlayer.ejectionsAgainst++;
            else if([restorationId isEqualToString:@"Ejection Earned by"])
                tempPlayer.ejectionsEarned++;
            else if([restorationId isEqualToString:@"Game Played"])
                tempPlayer.gamePlayed=YES;
            else if([restorationId isEqualToString:@"Game Started"])
                tempPlayer.gameStarted=YES;
            else if([restorationId isEqualToString:@"Turnover by"])
                tempPlayer.turnovers++;
            else if([restorationId isEqualToString:@"Offensive by"])
                tempPlayer.offensives++;
            else if([restorationId isEqualToString:@"Field Block by"])
                tempPlayer.fieldBlocks++;
            else if([restorationId isEqualToString:@"Shot by"])
                tempPlayer.attempts++;
            else if([restorationId isEqualToString:@"Goal by"])
                tempPlayer.goals++;
            else if([restorationId isEqualToString:@"Assist by"])
                tempPlayer.assists++;
            else if([restorationId isEqualToString:@"Steal by"])
                tempPlayer.steals++;
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        }
    }
}
-(void)cancelButton
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end