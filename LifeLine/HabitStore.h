//
//  HabitStore.h
//  LifeLine
//
//  Created by Charvel on 16/5/20.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Habit;

@interface HabitStore : NSObject

@property (nonatomic,readonly) NSArray *allHabits;

+(instancetype) sharedStore;

-(Habit *)createHabit:(NSString*) habitName
          description:(NSString*) des
                level:(int) level
           isPositive:(int) isPositive;

- (void) removeHabit:(Habit *) habit;


-(void) moveHabitAtIndex:(NSInteger)fromIndex todex:(NSInteger) toIndex;

@end
