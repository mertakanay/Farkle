//
//  ViewController.h
//  Farkle
//
//  Created by Mert Akanay on 19.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DieLabel.h"
#import "ScoreChart.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel1;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel2;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel3;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel4;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel5;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel6;

@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *diceOutlets;

@property NSMutableArray *scoreX;

@property NSMutableArray *score;

@property NSString *numberOfP;

@property NSMutableArray *playerArray;

@end

