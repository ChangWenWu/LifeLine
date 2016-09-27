//
//  ViewController.m
//  LifeLine
//
//  Created by Charvel on 16/5/11.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"3.jpg"]]] ;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_enter:(id)sender {
    
    
    NSLog(@"kkkkkkk");
    
    
    NSDate * birthDate = self.birthDate.date;
    NSDate * deadDate = self.deadDate.date;
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"LifeList" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    //添加一项内容
    [data setObject:birthDate forKey:@"birthDate"];
    [data setObject:deadDate forKey:@"deadDate"];
    
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"LifeList.plist"];
    //输入写入
    [data writeToFile:filename atomically:YES];
    
    NSMutableDictionary *data1 = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    NSLog(@"%@", data1);
    
}
@end
