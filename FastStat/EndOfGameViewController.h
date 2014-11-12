//
//  EndOfGameViewController.h
//  FastStat
//
//  Created by Michael Franco on 11/11/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//  Code inspired by AllRecordsViewController created by Joshua Conner in MVCDemo. No plagiarism intended.

#import <UIKit/UIKit.h>
#import "Game.h"

@interface EndOfGameViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    BOOL editable;
}


@property Game *currGame;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
