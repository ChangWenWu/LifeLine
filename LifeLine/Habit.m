//
//  Habit.m
//  LifeLine
//
//  Created by Charvel on 16/5/20.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import "Habit.h"

@implementation Habit

-(instancetype) initWithHabitName:(NSString*) habitName
                      description:(NSString*) des
                            level:(int) level
                       isPositive:(int) isPositive{
    
    self = [super init];
    
    
    if(self){
        _habitName = habitName;
        _des = des;
        _level = level;
        _isPositive = isPositive;
        
    }
    
    return self;
}

+(instancetype)test{
    Habit * h = [[self alloc] initWithHabitName:@"跑步半小时" description:@"健康每一天" level:1 isPositive:1];
    return h;
}


@end
