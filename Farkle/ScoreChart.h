//
//  ScoreChart.h
//  Farkle
//
//  Created by Mert Akanay on 21.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DieLabel.h"
#import "ViewController.h"

@protocol ScoreChartDelegate <NSObject>

-(void)shouldShowTheSelectedDice:(UILabel *)selectedLabel;

@end

@interface ScoreChart : UIView
@property id<ScoreChartDelegate> scoreChartDelegate;

@end
