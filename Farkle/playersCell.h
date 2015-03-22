//
//  playersCell.h
//  Farkle
//
//  Created by Mert Akanay on 22.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayersViewController.h"

@protocol CellDelegate <NSObject>

-(void)shouldChangePlayerName:(NSString *)name;

@end

@interface playersCell : UITableViewCell

@property id<CellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *playerTextField;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property NSString *customPlayerName;

@end
