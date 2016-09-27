//
//  AddHabitViewController.m
//  LifeLine
//
//  Created by Charvel on 16/5/25.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import "AddHabitViewController.h"
#import "HabitStore.h"
#import "Habit.h"

@interface AddHabitViewController (){
    

}

@end

@implementation AddHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pickerArray = [NSArray arrayWithObjects:@"简单",@"中等",@"较难",@"极难", nil];
    self.habitLevel.delegate = self;
    self.habitLevel.dataSource = self;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnReturn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
    
}

- (IBAction)btnSave:(id)sender {
    NSString *habitName = self.habitName.text;
    NSString *habitDes = self.habitDes.text;
    int habitLevel = [self.habitLevel selectedRowInComponent:0];
    int isPositive = [self.pickerIsPositive selectedSegmentIndex];
    
    
    
    
    [[HabitStore sharedStore] createHabit:habitName description:habitDes level:habitLevel isPositive:isPositive];
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
    
    
    
}
@end
