//
//  ScoreChart.m
//  Farkle
//
//  Created by Mert Akanay on 21.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ScoreChart.h"



@implementation ScoreChart

//- (IBAction)doDrag:(UIPanGestureRecognizer *)sender
//{
//    if (sender.state == UIGestureRecognizerStateEnded) {
//        [UIView animateWithDuration:5 animations:^{
//            for (DieLabel *die in self.diceOutlets) {
//                die.center = self.originalDicePosition;
//                die.alpha = 0;
//            }
//        }completion:^(BOOL finished) {
//            [UIView animateWithDuration:5 animations:^{
//                for (DieLabel *die in self.diceOutlets) {
//                    die.alpha = 1;
//                }
//            }];
//
//        }];
//
//    }else{
//
//        CGPoint point = [sender locationInView:self.view];
//        for (DieLabel *die in self.diceOutlets) {
//            die.center = point;
//
//            if (CGRectContainsPoint(self.scoreLabel1.frame, point)) {
//                self.scoreLabel1.text = die.text;
//                self.scoreLabel1.backgroundColor = [UIColor cyanColor];
//                self.scoreLabel1.textColor = [UIColor blueColor];
//                die.hidden = YES;
//            }else if (CGRectContainsPoint(self.scoreLabel2.frame, point)) {
//                self.scoreLabel2.text = die.text;
//                self.scoreLabel2.backgroundColor = [UIColor cyanColor];
//                self.scoreLabel2.textColor = [UIColor blueColor];
//                die.hidden = YES;
//            }else if (CGRectContainsPoint(self.scoreLabel3.frame, point)) {
//                self.scoreLabel3.text = die.text;
//                self.scoreLabel3.backgroundColor = [UIColor cyanColor];
//                self.scoreLabel3.textColor = [UIColor blueColor];
//                die.hidden = YES;
//            }else if (CGRectContainsPoint(self.scoreLabel4.frame, point)) {
//                self.scoreLabel4.text = die.text;
//                self.scoreLabel4.backgroundColor = [UIColor cyanColor];
//                self.scoreLabel4.textColor = [UIColor blueColor];
//                die.hidden = YES;
//            }else if (CGRectContainsPoint(self.scoreLabel5.frame, point)) {
//                self.scoreLabel5.text = die.text;
//                self.scoreLabel5.backgroundColor = [UIColor cyanColor];
//                die.hidden = YES;
//            }else if (CGRectContainsPoint(self.scoreLabel6.frame, point)) {
//                self.scoreLabel6.text = die.text;
//                self.scoreLabel6.backgroundColor = [UIColor cyanColor];
//                self.scoreLabel6.textColor = [UIColor blueColor];
//                die.hidden = YES;
//            }
//            
//        }
//        
//    }
//    
//}
//

@end
