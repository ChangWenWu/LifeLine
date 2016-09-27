//
//  DeadViewController.m
//  LifeLine
//
//  Created by Charvel on 16/5/11.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import "DeadViewController.h"

@interface DeadViewController ()

@end

@implementation DeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"LifeList.plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    
    deadDate = [data objectForKey:@"deadDate"];
    NSLog(@"%@",deadDate);
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                              target:self
                                            selector:@selector(timerFunc:)
                                            userInfo:nil
                                             repeats:YES];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)timerFunc: (NSTimer *)timer

{
    
    NSTimeInterval  timeInterval = [deadDate timeIntervalSinceNow];
    
    //timeInterval = -timeInterval;
    
    
    
    
    self.L1.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60/60/24/30/12];
    
    self.L2.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60/60/24/30];
    
    self.L3.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60/60/24];
    
    self.L4.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60/60];
    
    self.L5.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60];
    
    self.L6.text = [NSString stringWithFormat:@"%d",(int)timeInterval];
    
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
