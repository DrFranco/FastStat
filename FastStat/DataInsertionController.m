//
//  DataInsertionController.m
//  FastStat
//
//  Created by Michael Franco on 11/10/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//

#import "DataInsertionController.h"
@implementation DataInsertionController

@synthesize textField, currGame;

-(IBAction) buttonPushed: (id) sender
{
    NSString *restorationId = self.restorationIdentifier;
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@",restorationId,textField.text]message:@"Choose applicable" delegate: self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
    [alert show];
}
- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)
    {
        NSArray *temp = [currGame playerAccessor];
        Player *tempPlayer = [temp objectAtIndex:[textField.text integerValue]];
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
            tempPlayer.steals++;
        else if([restorationId isEqualToString:@"Field Block by"])
            tempPlayer.fieldBlocks++;
        else if([restorationId isEqualToString:@"Shot by"])
            tempPlayer.attempts++;
        else if([restorationId isEqualToString:@"Goal by"])
            tempPlayer.goals++;
        else if([restorationId isEqualToString:@"Assist by"])
            tempPlayer.assists++;
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}
-(IBAction)cancelButton:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}




@end