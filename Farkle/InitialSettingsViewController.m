//
//  InitialSettingsViewController.m
//  Farkle
//
//  Created by Mert Akanay on 22.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "InitialSettingsViewController.h"
#import "ViewController.h"

@interface InitialSettingsViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property NSArray *numbers;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@end

@implementation InitialSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.numbers = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.numbers[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController *VC = [segue destinationViewController];
    NSString *playerNum = [NSString stringWithFormat:@"%li", self.pickerView.];
    VC.numberOfP = playerNum;

}


@end
