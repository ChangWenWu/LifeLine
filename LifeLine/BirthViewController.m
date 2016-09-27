//
//  BirthViewController.m
//  LifeLine
//
//  Created by Charvel on 16/5/11.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import "BirthViewController.h"
#import "Habit.h"
#import "HabitStore.h"
#import "AddHabitViewController.h"

@interface BirthViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) IBOutlet UIView * headerView;


@end

@implementation BirthViewController










-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    


    return [[[HabitStore sharedStore] allHabits] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
    HabitTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"HabitTableViewCell" forIndexPath:indexPath];
    
    NSLog(@"加载cell");

    
    NSArray * habits = [[HabitStore sharedStore] allHabits];
    
    Habit * habit = habits[indexPath.row];
    cell.habitName.text = [habit habitName];
    cell.habitDes.text = [habit des];
    
    return cell;
}


- (void)timerFunc: (NSTimer *)timer

{
    
    NSTimeInterval  timeInterval = [birthDate timeIntervalSinceNow];
    
    timeInterval = -timeInterval;

    
    NSLog(@"%f",timeInterval);
    
    
    self.L1.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60/60/24/30/12];
    
    self.L2.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60/60/24/30];
    
    self.L3.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60/60/24];
    
    self.L4.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60/60];
    
    self.L5.text = [NSString stringWithFormat:@"%d",(int)timeInterval/60];
    
    self.L6.text = [NSString stringWithFormat:@"%d",(int)timeInterval];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    

    
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"LifeList.plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    
    birthDate = [data objectForKey:@"birthDate"];
    NSLog(@"%@",birthDate);
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                      target:self
                      selector:@selector(timerFunc:)
                      userInfo:nil
                      repeats:YES];
    


    
    
    
    
    UIView * header = self.headerView;
    [self.tableView setTableHeaderView:header];
    
    
    
    UINib *nib = [UINib nibWithNibName:@"HabitTableViewCell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"HabitTableViewCell"];
    
    
    // Do any additional setup after loading the view from its nib.
}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addHabbit:(id)sender {
    
    AddHabitViewController *add = [[AddHabitViewController alloc] init];
    
    [self presentViewController:add animated:YES completion:nil];
    
    
    
    
    
   // NSInteger lastRow = [[[HabitStore sharedStore] allHabits] indexOfObject:newHabit ];
    
   // NSIndexPath * indexPath = [NSIndexPath indexPathForItem:lastRow inSection:0];
    
    //[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    
}

-(IBAction)toggleEditingModing:(id)sender{
    
    if(self.tableView.isEditing){
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        
        [self.tableView setEditing:NO animated:YES];
        
    }else{
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self.tableView setEditing:YES animated:YES];
    }
    
    
}






-(UIView *)headerView{
    if(!_headerView){
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}


-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        NSArray * habits = [[HabitStore sharedStore] allHabits];
        Habit * habit = habits[indexPath.row];
        [[HabitStore sharedStore] removeHabit:habit];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[HabitStore sharedStore] moveHabitAtIndex:sourceIndexPath.row todex:destinationIndexPath.row];
}



@end
