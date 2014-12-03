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

@synthesize textField, currGame, label, index ;


- (void) viewDidLoad
{
    [super viewDidLoad];
    NSString *restorationId = self.restorationIdentifier;
    if([restorationId isEqualToString:@"NameInput"])
    {
        UIToolbar* nameToolbar= [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        nameToolbar.barStyle = UIBarStyleDefault;
        nameToolbar.items = [NSArray arrayWithObjects: [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(enterName)],nil];
        [nameToolbar sizeToFit];
        textField.inputAccessoryView=nameToolbar;
        label.text = [NSString stringWithFormat:@"Name for #%ld", (long)self.index+1];
        [textField becomeFirstResponder];

    }
    else
    {
        UIToolbar* numberToolbar= [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbar.barStyle = UIBarStyleDefault;
        numberToolbar.items = [NSArray arrayWithObjects:[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButton)], [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],[[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(buttonPushed)],nil];
        [numberToolbar sizeToFit];
        textField.inputAccessoryView=numberToolbar;
        [textField becomeFirstResponder];
    }
}


-(void) buttonPushed
{
    NSMutableArray *temp = [currGame playerAccessor];
    NSUInteger num = [temp count];
    if ([textField.text integerValue]>num || [textField.text integerValue] < 1|| [textField.text isEqualToString:@""])
    {
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"Invalid Number" message:@"Please check if number is valid. By default, numbers cannot exceed 26." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        alert.tag=TAG_ERR;
        [alert show];
    }
    else
    {
        NSData* objData = [temp objectAtIndex:[textField.text integerValue]-1];
        Player *tempPlayer = [NSKeyedUnarchiver unarchiveObjectWithData:objData];
        NSString *restorationId = self.restorationIdentifier;
        if ([restorationId isEqualToString:@"Ejection Against"])
            tempPlayer.ejectionsAgainst= [NSNumber numberWithInt:[tempPlayer.ejectionsAgainst intValue]+1];
        else if([restorationId isEqualToString:@"Ejection Earned by"])
            tempPlayer.ejectionsEarned= [NSNumber numberWithInt:[tempPlayer.ejectionsEarned intValue]+1];
        else if([restorationId isEqualToString:@"Game Played"])
            tempPlayer.gamePlayed=@1;
        else if([restorationId isEqualToString:@"Game Started"])
            tempPlayer.gameStarted=@1;
        else if([restorationId isEqualToString:@"Turnover by"])
            tempPlayer.turnovers= [NSNumber numberWithInt:[tempPlayer.turnovers intValue]+1];
        else if([restorationId isEqualToString:@"Offensive by"])
            tempPlayer.offensives= [NSNumber numberWithInt:[tempPlayer.offensives intValue]+1];
        else if([restorationId isEqualToString:@"Field Block by"])
            tempPlayer.fieldBlocks= [NSNumber numberWithInt:[tempPlayer.fieldBlocks intValue]+1];
        else if([restorationId isEqualToString:@"Shot by"])
            tempPlayer.attempts= [NSNumber numberWithInt:[tempPlayer.attempts intValue]+1];
        else if([restorationId isEqualToString:@"Goal by"])
            tempPlayer.goals= [NSNumber numberWithInt:[tempPlayer.goals intValue]+1];
        else if([restorationId isEqualToString:@"Assist by"])
            tempPlayer.assists= [NSNumber numberWithInt:[tempPlayer.assists intValue]+1];
        else if([restorationId isEqualToString:@"Steal by"])
            tempPlayer.steals= [NSNumber numberWithInt:[tempPlayer.steals intValue]+1];
        
        objData= [NSKeyedArchiver archivedDataWithRootObject:tempPlayer];
        [temp replaceObjectAtIndex:[textField.text integerValue]-1 withObject:objData];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void) enterName
{
    NSMutableArray *temp = [currGame playerAccessor];
    NSData* objData = [temp objectAtIndex:self.index];
    Player *tempPlayer = [NSKeyedUnarchiver unarchiveObjectWithData:objData];
    tempPlayer.name = textField.text;
    objData= [NSKeyedArchiver archivedDataWithRootObject:tempPlayer];
    [temp replaceObjectAtIndex: self.index withObject:objData];

}
- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //now this is unnecessary at the moment, but if I were to add more alerts, it would avoid problems
    if (alertView.tag==TAG_OK)
    {
        
    }
}
-(void)cancelButton
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end