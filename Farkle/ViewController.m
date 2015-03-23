//
//  ViewController.m
//  Farkle
//
//  Created by Mert Akanay on 19.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"
#import "ScoreChart.h"
#import "PlayersViewController.h"

@interface ViewController ()<DieLabelDelegate, UITextFieldDelegate, UIAlertViewDelegate, UICollisionBehaviorDelegate>

@property NSMutableArray *dice;

@property (weak, nonatomic) IBOutlet UILabel *userScore;
@property CGPoint originalDicePosition;

@property UIDynamicAnimator *shakeItUp;
@property UIDynamicItemBehavior *shakingDice;
@property UIGravityBehavior *gravityDice;
@property UICollisionBehavior *collisionDice;

@property (weak, nonatomic) IBOutlet UIView *box;

@property CGPoint rightTopEdge;
@property CGPoint leftBottomEdge;
@property CGPoint rightBottomEdge;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.backBarButtonItem.enabled = NO;

    for (DieLabel *die in self.diceOutlets) {
        die.delegate = self;
    }

    self.scoreX = [NSMutableArray arrayWithObjects:self.scoreLabel1,self.scoreLabel2,self.scoreLabel3,self.scoreLabel4,self.scoreLabel5,self.scoreLabel6, nil];
    self.score = [NSMutableArray arrayWithObjects: nil];

    self.rightTopEdge = CGPointMake(self.box.frame.origin.x + self.box.frame.size.width, self.box.frame.origin.y);
    self.leftBottomEdge = CGPointMake(self.box.frame.origin.x, self.box.frame.origin.y + self.box.frame.size.height);
    self.rightBottomEdge = CGPointMake(self.box.frame.origin.x + self.box.frame.size.width, self.box.frame.origin.y + self.box.frame.size.height);


}

-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
    UIDynamicBehavior *bouncingDice = [[UIDynamicItemBehavior alloc]initWithItems:self.diceOutlets];
    [self.shakeItUp addBehavior:bouncingDice];
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    self.shakeItUp = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.shakingDice = [[UIDynamicItemBehavior alloc]initWithItems:self.diceOutlets];
    self.gravityDice = [[UIGravityBehavior alloc]initWithItems:self.diceOutlets];
    self.collisionDice = [[UICollisionBehavior alloc]initWithItems:self.diceOutlets];

    self.rightTopEdge = CGPointMake(self.box.frame.origin.x + self.box.frame.size.width, self.box.frame.origin.y);
    self.leftBottomEdge = CGPointMake(self.box.frame.origin.x, self.box.frame.origin.y + self.box.frame.size.height);
    self.rightBottomEdge = CGPointMake(self.box.frame.origin.x + self.box.frame.size.width, self.box.frame.origin.y + self.box.frame.size.height);

    [self.collisionDice addBoundaryWithIdentifier:@"box" fromPoint:self.box.frame.origin toPoint:self.rightTopEdge];
    [self.collisionDice addBoundaryWithIdentifier:@"box" fromPoint:self.box.frame.origin toPoint:self.leftBottomEdge];
    [self.collisionDice addBoundaryWithIdentifier:@"box" fromPoint:self.box.frame.origin toPoint:self.rightBottomEdge];

    self.collisionDice.translatesReferenceBoundsIntoBoundary = YES;
    [self.shakeItUp addBehavior:self.collisionDice];
    [self.shakeItUp addBehavior:self.gravityDice];

    
    
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeMotionShake)
    {
        for (DieLabel *die in self.diceOutlets) {
            [die roll];
        }
    }

    if ([super respondsToSelector:@selector(motionEnded:withEvent:)]) {
        [super motionEnded:motion withEvent:event];
    }
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
    for (DieLabel *die in self.diceOutlets) {
         [die roll];

        self.originalDicePosition = die.center;

    }
    if (sender.backgroundColor == [UIColor blueColor])
    {
        sender.enabled = NO;
    }else
    {
        sender.enabled = YES;
    }

    
}
- (IBAction)onEndTurnButtonPressed:(UIButton *)sender
{
    //FARKLE LOGIC STARTS HERE


        if (![self.scoreLabel1.text isEqualToString:@""]){
            [self.score addObject:self.scoreLabel1.text];
        }

        if (![self.scoreLabel2.text isEqualToString:@""]){
            [self.score addObject:self.scoreLabel2.text];
        }

        if (![self.scoreLabel3.text isEqualToString:@""]){
            [self.score addObject:self.scoreLabel3.text];
        }

        if (![self.scoreLabel4.text isEqualToString:@""]){
            [self.score addObject:self.scoreLabel4.text];
        }

        if (![self.scoreLabel5.text isEqualToString:@""]){
            [self.score addObject:self.scoreLabel5.text];
        }

        if (![self.scoreLabel6.text isEqualToString:@""]){
            [self.score addObject:self.scoreLabel6.text];
        }
    

    for (int i = 0; i<5; i++) {
        //        if (self.score.count == 6 && [self.score[0] isEqualToString:self.score[1]] && [self.score[1] isEqualToString:self.score[2]] && [self.score[2] isEqualToString:self.score[3]] && [self.score[3] isEqualToString:self.score[4]] && [self.score[4] isEqualToString:self.score[5]])
        if([self.score[i] isEqualToString:self.score[i+1]] && self.score.count == 6)
        {
            self.userScore.text = @"1000";
        }
    }

    for (int i = 0; i<5 ; i++) {
        for (int j = 0; j<5; j++) {
            for (int k = 0; k<5; k++){
                if ([self.score[i] isEqualToString:self.score[i+1]] && [self.score[j] isEqualToString:self.score[j+1]] && [self.score[k] isEqualToString:self.score[k+1]] && i != k && k != j && i != k)
                {
                    self.userScore.text = @"1000";
                }

            }
        }
    }

    NSArray *localArray = @[@1,@2,@3,@4,@5,@6];
    int count = 0;
    for (NSNumber *number in localArray) {
        if ([self.score containsObject:number])
        {
            count = count + 1;
        }
    }
    if (count == localArray.count)
    {
        self.userScore.text = @"1000";
    }


    NSArray *onesArray = @[@1,@1,@1];
    if ([self.score containsObject:onesArray])
    {
        self.userScore.text = @"1000";
    }

    NSArray *twosArray = @[@2,@2,@2];
    if ([self.score containsObject:twosArray])
    {
        self.userScore.text = @"200";
    }

    NSArray *threesArray = @[@3,@3,@3];
    if ([self.score containsObject:threesArray])
    {
        self.userScore.text = @"300";
    }

    NSArray *foursArray = @[@4,@4,@4];
    if ([self.score containsObject:foursArray])
    {
        self.userScore.text = @"400";
    }

    NSArray *fivesArray = @[@5,@5,@5];
    if ([self.score containsObject:fivesArray])
    {
        self.userScore.text = @"500";
    }

    NSArray *sixesArray = @[@6,@6,@6];
    if ([self.score containsObject:sixesArray])
    {
        self.userScore.text = @"600";
    }

    if ([self.score containsObject:@1]) {
        self.userScore.text = @"100";
    }

    if ([self.score containsObject:@5]) {
        self.userScore.text = @"50";
    }
    
    
    //FARKLE LOGIC ENDS HERE

}

-(void)shouldSelectDiceWhichWillNotRerolled:(DieLabel *)die
{
    if(![die.text isEqualToString:@""])
        die.backgroundColor = [UIColor blueColor];
        if (die.backgroundColor == [UIColor blueColor])
        {
            die.enabled = NO;
        }
}

- (IBAction)doDrag:(UIPanGestureRecognizer *)sender
{
    DieLabel *dieLabel = (DieLabel *)sender.view;

    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1 animations:^{

                dieLabel.center = self.originalDicePosition;
                dieLabel.alpha = 1;

        }completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{

                    dieLabel.alpha = 1;

            }];

        }];

        }else{

    CGPoint point = [sender locationInView:self.view];

        dieLabel.center = point;

        if (CGRectContainsPoint(self.scoreLabel1.frame, point)) {
            self.scoreLabel1.text = dieLabel.text;
            self.scoreLabel1.backgroundColor = [UIColor cyanColor];
            self.scoreLabel1.textColor = [UIColor blueColor];
            dieLabel.hidden = YES;
        }else if (CGRectContainsPoint(self.scoreLabel2.frame, point)) {
            self.scoreLabel2.text = dieLabel.text;
            self.scoreLabel2.backgroundColor = [UIColor cyanColor];
            self.scoreLabel2.textColor = [UIColor blueColor];
            dieLabel.hidden = YES;
        }else if (CGRectContainsPoint(self.scoreLabel3.frame, point)) {
            self.scoreLabel3.text = dieLabel.text;
            self.scoreLabel3.backgroundColor = [UIColor cyanColor];
            self.scoreLabel3.textColor = [UIColor blueColor];
            dieLabel.hidden = YES;
        }else if (CGRectContainsPoint(self.scoreLabel4.frame, point)) {
            self.scoreLabel4.text = dieLabel.text;
            self.scoreLabel4.backgroundColor = [UIColor cyanColor];
            self.scoreLabel4.textColor = [UIColor blueColor];
            dieLabel.hidden = YES;
        }else if (CGRectContainsPoint(self.scoreLabel5.frame, point)) {
            self.scoreLabel5.text = dieLabel.text;
            self.scoreLabel5.backgroundColor = [UIColor cyanColor];
            dieLabel.hidden = YES;
        }else if (CGRectContainsPoint(self.scoreLabel6.frame, point)) {
            self.scoreLabel6.text = dieLabel.text;
            self.scoreLabel6.backgroundColor = [UIColor cyanColor];
            self.scoreLabel6.textColor = [UIColor blueColor];
            dieLabel.hidden = YES;

    }

    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PlayersViewController *playersVC = [segue destinationViewController];
    NSString *transferNumber = self.numberOfP;
    NSString *score = self.userScore.text;
    playersVC.playerNumber = transferNumber;
    playersVC.scoring = score;
    
}

@end
