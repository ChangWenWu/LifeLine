//
//  ViewController.h
//  LifeLine
//
//  Created by Charvel on 16/5/11.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *birthDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *deadDate;
- (IBAction)btn_enter:(id)sender;


@end

