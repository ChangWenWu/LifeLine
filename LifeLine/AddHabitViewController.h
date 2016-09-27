//
//  AddHabitViewController.h
//  LifeLine
//
//  Created by Charvel on 16/5/25.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddHabitViewController : UIViewController<UIPickerViewDelegate, UITextFieldDelegate,UIPickerViewDataSource>{
    NSArray *pickerArray;
}



- (IBAction)btnReturn:(id)sender;

- (IBAction)btnSave:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *habitName;
@property (weak, nonatomic) IBOutlet UITextField *habitDes;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pickerIsPositive;
@property (weak, nonatomic) IBOutlet UIPickerView *habitLevel;
@end
