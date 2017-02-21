//
//  Todo.h
//  Every.Do
//
//  Created by Callum Davies on 2017-02-21.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *todoDescription;
@property (nonatomic) int priorityNumber;
@property (nonatomic) BOOL isCompleted;

-(instancetype)initWithTitle:(NSString *)title Description:(NSString *)description AndPriority:(int)priority;

@end
