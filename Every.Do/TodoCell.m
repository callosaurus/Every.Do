//
//  TodoCell.m
//  Every.Do
//
//  Created by Callum Davies on 2017-02-21.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "TodoCell.h"

@interface TodoCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end

@implementation TodoCell

-(void)setTodo:(Todo *)todo
{
    _todo = todo;
    
    [self configure];
}

-(void)configure
{
    self.titleLabel.text = self.todo.title;
    self.descriptionLabel.text = self.todo.todoDescription;
    self.priorityLabel.text = [NSString stringWithFormat:@"%i", self.todo.priorityNumber];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
