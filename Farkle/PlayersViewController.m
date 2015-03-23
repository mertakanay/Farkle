//
//  PlayersViewController.m
//  Farkle
//
//  Created by Mert Akanay on 22.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "PlayersViewController.h"
#import "playersCell.h"

@interface PlayersViewController () <UITableViewDelegate, UITableViewDataSource, CellDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;





@end

@implementation PlayersViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.playerArray = [NSMutableArray arrayWithObjects: nil];

    for (int i=0; i<[self.playerNumber intValue]; i++) {
        int k = i+1;
        [self.playerArray addObject:[NSString stringWithFormat:@"Player %i",k]];

    }

}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"did end editing");
}

-(playersCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    playersCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = self.playerArray[(long)indexPath.row];

    
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.playerNumber intValue];
}

-(void)shouldChangePlayerName:(NSString *)name
{
    
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    playersCell *PC = [segue destinationViewController];
//    NSMutableArray *name = self.playerArray;
//    PC.customPlayerArray = name;
//
//}

@end
