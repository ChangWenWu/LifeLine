//
//  Habit.h
//  LifeLine
//
//  Created by Charvel on 16/5/20.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Habit : NSObject

@property NSString * habitName;
@property NSString * des;
@property int level;
@property int isPositive;

+(instancetype) test;

-(instancetype) initWithHabitName:(NSString*) habitName
                      description:(NSString*) description
                            level:(int) level
                       isPositive:(int) isPositive;





@end
