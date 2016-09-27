//
//  HabitTableViewCell.h
//  LifeLine
//
//  Created by Charvel on 16/5/17.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HabitTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *habitName;
@property (weak, nonatomic) IBOutlet UILabel *habitDes;
- (IBAction)doHabit:(id)sender;

@end
