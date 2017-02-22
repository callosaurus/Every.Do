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
    if (self.todo.isCompleted == NO) {
        self.titleLabel.text = self.todo.title;
        self.descriptionLabel.text = self.todo.todoDescription;
        self.priorityLabel.text = [NSString stringWithFormat:@"%i", self.todo.priorityNumber];
    } else {
        NSMutableAttributedString *titleStrikethrough = [[NSMutableAttributedString alloc] initWithString:self.todo.title];
        [titleStrikethrough addAttribute:NSStrikethroughStyleAttributeName
                                   value:@4
                                   range:NSMakeRange(0, [titleStrikethrough length])];
        NSMutableAttributedString *descriptionStrikethrough = [[NSMutableAttributedString alloc] initWithString:self.todo.todoDescription];
        [descriptionStrikethrough addAttribute:NSStrikethroughStyleAttributeName
                                   value:@4
                                   range:NSMakeRange(0, [descriptionStrikethrough length])];
        self.titleLabel.attributedText = titleStrikethrough;
        self.descriptionLabel.attributedText = descriptionStrikethrough;
    }
    
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
