//
//  MasterViewController.m
//  Every.Do
//
//  Created by Callum Davies on 2017-02-21.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AddNewViewController.h"
#import "TodoCell.h"
#import "Todo.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource, NewTodoProtocol>

@property NSMutableArray *objects;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    Todo *firstTodo = [[Todo alloc] initWithTitle:@"groceries" Description:@"buy milk, eggs, and a horse" AndPriority:2];
    Todo *secondTodo = [[Todo alloc] initWithTitle:@"draw" Description:@"draw 30 mins every day" AndPriority:4];
    Todo *thirdTodo = [[Todo alloc] initWithTitle:@"homework" Description:@"do lighthouse assignments" AndPriority:1];
    Todo *fourthTodo = [[Todo alloc] initWithTitle:@"sword" Description:@"polish and sharpen sword" AndPriority:5];
    
    self.objects = [[NSMutableArray alloc] initWithObjects:firstTodo, secondTodo, thirdTodo, fourthTodo, nil];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAndComplete:)];
    [self.tableView addGestureRecognizer:swipe];
    
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    [self performSegueWithIdentifier:@"newToDo" sender:sender];
}

-(void)addNew:(Todo *)newTodo
{
    [self.objects insertObject:newTodo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)swipeAndComplete:(UISwipeGestureRecognizer *)swipe
{
    CGPoint swipeLocation = [swipe locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
    Todo *todo = self.objects[swipedIndexPath.row];
    
    if (todo.isCompleted == NO) {
        todo.isCompleted = YES;
    }
    
    [self.tableView reloadData];
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *todoToBeDetailed = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:todoToBeDetailed];
    }
    
    if ([[segue identifier] isEqualToString:@"newToDo"]) {
        AddNewViewController *newVC = segue.destinationViewController;
        
        newVC.delegate = self;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (TodoCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];

    cell.todo = self.objects[indexPath.row];

    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
