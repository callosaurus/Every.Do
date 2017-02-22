//
//  AddNewViewController.m
//  Every.Do
//
//  Created by Callum Davies on 2017-02-21.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "AddNewViewController.h"

@implementation AddNewViewController

- (IBAction)doneButton:(UIButton *)sender {
    
    Todo *newToDo = [[Todo alloc] initWithTitle:self.titleField.text Description:self.descriptionField.text AndPriority:[self.priorityField.text intValue]];
    [self.delegate addNew:newToDo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
