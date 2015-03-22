//
//  DieLabel.m
//  Farkle
//
//  Created by Mert Akanay on 19.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel


-(IBAction)onTapped:(UITapGestureRecognizer *)sender

{
        DieLabel *die = (DieLabel *)sender.view;
        [self.delegate shouldSelectDiceWhichWillNotRerolled:die];
}

-(void)roll
{
    int randomNumber = 1 + arc4random() % 6;

    self.text = [NSString stringWithFormat:@"%i",randomNumber];
}

//-(void)reroll
//{
//    int randomNumber = 1 + arc4random() % 6;
//
//    self.text = [NSString stringWithFormat:@"%i",randomNumber];
//}

@end
