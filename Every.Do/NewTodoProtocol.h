//
//  NewTodoProtocol.h
//  Every.Do
//
//  Created by Callum Davies on 2017-02-21.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewTodoProtocol <NSObject>

-(void)addNew:(Todo *)newTodo;

@end
