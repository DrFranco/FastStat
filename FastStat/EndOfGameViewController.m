//
//  EndOfGameViewController.m
//  FastStat
//
//  Created by Michael Franco on 11/11/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//
//  Code inspired by AllRecordsViewController created by Joshua Conner in MVCDemo. No plagiarism intended.

#import "EndOfGameViewController.h"
#import "StatViewController.h"

@interface EndOfGameViewController ()

@end

@implementation EndOfGameViewController

@synthesize currGame, tableView;

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self currGame] playerAccessor] count];
}


- (UITableViewCell *) tableView:(UITableView *)tView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *playerCellID = @"PlayerCell";
    
    UITableViewCell *newCell = [tView dequeueReusableCellWithIdentifier:playerCellID];
    
    if (newCell == nil)
    {
        newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                         reuseIdentifier:playerCellID];
        newCell.showsReorderControl = YES;
    }
    
    NSArray *allPlayers = [self.currGame playerAccessor];
    Player *temp =[allPlayers objectAtIndex:indexPath.row];
    NSString *ourPlayerName = [temp name];
    newCell.textLabel.text = ourPlayerName;
    
    return newCell;
}

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *allPlayers = [self.currGame playerAccessor];
    Player *temp =[allPlayers objectAtIndex:indexPath.row];
    UIStoryboard *storyboard = self.storyboard;
    StatViewController *statVC = [storyboard instantiateViewControllerWithIdentifier:@"StatView"];
    statVC.player = temp;
    [self.navigationController pushViewController:statVC animated:YES];
}


- (void)viewDidLoad
{
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Quit" style:UIBarButtonItemStylePlain
                                                  target:self
                                                  action:@selector(quitToMainMenu)];
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Send" style: UIBarButtonItemStyleDone
                                                  target:self
                                                  action:nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void) quitToMainMenu
{
    [[[self presentingViewController] presentingViewController] dismissViewControllerAnimated:NO completion:nil];
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
