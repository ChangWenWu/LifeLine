//
//  BirthViewController.h
//  LifeLine
//
//  Created by Charvel on 16/5/11.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HabitTableViewCell.h"



@interface BirthViewController : UIViewController

{
    NSDate * birthDate;
    NSTimer *_timer;

}





- (IBAction)addHabbit:(id)sender;





@property (weak, nonatomic) IBOutlet UILabel *L1;

@property (weak, nonatomic) IBOutlet UILabel *L2;
@property (weak, nonatomic) IBOutlet UILabel *L3;
@property (weak, nonatomic) IBOutlet UILabel *L4;
@property (weak, nonatomic) IBOutlet UILabel *L5;
@property (weak, nonatomic) IBOutlet UILabel *L6;


@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
