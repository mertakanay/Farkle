//
//  playersCell.m
//  Farkle
//
//  Created by Mert Akanay on 22.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "playersCell.h"

@implementation playersCell

-(void)changePlayerName;
{
    self.customPlayerName = self.playerTextField.text;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
