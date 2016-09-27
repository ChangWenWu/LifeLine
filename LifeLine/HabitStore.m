//
//  HabitStore.m
//  LifeLine
//
//  Created by Charvel on 16/5/20.
//  Copyright © 2016年 Jarvis. All rights reserved.
//

#import "HabitStore.h"
#import "Habit.h"


@interface HabitStore ()

@property (nonatomic) NSMutableArray * privateHabits;

@end

@implementation HabitStore

+(instancetype) sharedStore{
    static HabitStore * sharedStore = nil;
    
    if(!sharedStore){
        sharedStore = [[self alloc] initPrivate];
        
    }
    
    return sharedStore;
    
}


-(instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use+[HabitStore shareStore]" userInfo:nil];
    return nil;
}

- (instancetype) initPrivate{
    self = [super init];
    
    if(self){
        _privateHabits = [[NSMutableArray alloc] init];
    }
    
    return self;
}



-(NSArray *)allHabits{
    return self.privateHabits;
}


-(Habit *)createHabit:(NSString*) habitName
          description:(NSString*) des
                level:(int) level
           isPositive:(int) isPositive{
    
    Habit * habit = [Habit test];
    [self.privateHabits addObject:habit];
    return habit;
}


-(void)removeHabit:(Habit *)habit{
    [self.privateHabits removeObjectIdenticalTo:habit];
}


-(void) moveHabitAtIndex:(NSInteger)fromIndex todex:(NSInteger)toIndex{
    if(fromIndex == toIndex){
        return;
    }
    
    Habit *habit = self.privateHabits[fromIndex];
    
    [self.privateHabits removeObjectAtIndex:fromIndex];
    
    [self.privateHabits insertObject:habit atIndex:toIndex];
    
    
}

@end
