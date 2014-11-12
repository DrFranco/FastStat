//
//  StatViewController.h
//  FastStat
//
//  Created by Michael Franco on 11/11/14.
//  Copyright (c) 2014 Michael Franco. All rights reserved.
//  Code inspired by DetailsViewController created by Joshua Conner in MVCDemo. No plagiarism intended.

#import <UIKit/UIKit.h>
#import "Player.h"

@interface StatViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gpLabel;
@property (weak, nonatomic) IBOutlet UILabel *gsLabel;
@property (weak, nonatomic) IBOutlet UILabel *turnoverLabel;
@property (weak, nonatomic) IBOutlet UILabel *offLabel;
@property (weak, nonatomic) IBOutlet UILabel *stealLabel;
@property (weak, nonatomic) IBOutlet UILabel *fbLabel;
@property (weak, nonatomic) IBOutlet UILabel *eaLabel;
@property (weak, nonatomic) IBOutlet UILabel *eeLabel;
@property (weak, nonatomic) IBOutlet UILabel *attLabel;
@property (weak, nonatomic) IBOutlet UILabel *goalLabel;
@property (weak, nonatomic) IBOutlet UILabel *assLabel;



@property Player *player;

@end
