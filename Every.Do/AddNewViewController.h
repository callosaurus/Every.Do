//
//  AddNewViewController.h
//  Every.Do
//
//  Created by Callum Davies on 2017-02-21.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
#import "NewTodoProtocol.h"

@interface AddNewViewController : UIViewController

@property id <NewTodoProtocol> delegate;

@property (weak, nonatomic) IBOutlet UITextField *priorityField;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;

@end
