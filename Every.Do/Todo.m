//
//  Todo.m
//  Every.Do
//
//  Created by Callum Davies on 2017-02-21.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithTitle:(NSString *)title Description:(NSString *)description AndPriority:(int)priority
{
    self = [super init];
    if (self) {
        self.title = title;
        self.todoDescription = description;
        self.priorityNumber = priority;
        self.isCompleted = NO;
    }
    return self;
}

@end
