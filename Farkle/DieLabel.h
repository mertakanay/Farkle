//
//  DieLabel.h
//  Farkle
//
//  Created by Mert Akanay on 19.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DieLabel;

@protocol DieLabelDelegate <NSObject>

-(void)shouldSelectDiceWhichWillNotRerolled:(DieLabel *)die;

@end

@interface DieLabel : UILabel
@property id<DieLabelDelegate> delegate;

-(void)roll;

@end
