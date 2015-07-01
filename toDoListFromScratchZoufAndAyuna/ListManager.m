//
//  ListManager.m
//  toDoListFromScratchZoufAndAyuna
//
//  Created by Ayuna Vogel on 6/30/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import "ListManager.h"

@class Item;
@class List; 

@implementation ListManager {
    NSMutableArray *_lists;
}
- (NSMutableArray *) getLists {
    if (_lists == nil) {
        _lists = [[NSMutableArray alloc] init];
    }
    return _lists;
}

-(void) addListToListManager: (List*) list {
    NSLog(@"Enter a name for your new to-do list"); commenting it out for now, but it will be in the loop method later
    List *somethingList = [[List alloc] init];
    // doesn't work [somethingList itemsInList]; - initializes items array in the new todo list
    //[_lists addObject:];
    //scanf for user input string name for the new to-do list
    //[list setListName: user input string for the new to do list name];
    //should list options for that list - home menu list options (display all tasks, add task, etc.
}

-(void) deleteListFromListManager: (List*) list {
    //printlists method - display all lists
    NSLog(@"Enter a list number to delete it");
    int j;
    scanf("%d", &j);
    for (int i = 0; i < [_lists count]; i++) {
        if (i == j) {
            [_lists removeObjectAtIndex:j-1];
        }
    }
}
-(void)printLists {
    for (int i = 0; i < [_lists count]; i++) {
        NSString *listName = [[_lists objectAtIndex:i] listName];
        NSLog(@"%@", listName);
    }
    NSLog(@"Enter a number to pick your to-do list");
}

-(void) listManagerMenuOptions { //this has to be inside a while loop, don't know how to write it yet
    int userInputInteger;
    while (true) { // ?
        NSArray *listManagerMenuOptions = [[NSArray alloc] initWithObjects:@"1 - Display all to-do lists", @"2 - Add new to-do list", @"3 - Delete a to-do list", @"0 - Quit", @"Enter a number to pick your option:", nil];
        NSLog(@"%@", listManagerMenuOptions);
        scanf("%d", &userInputInteger);
        fpurge(stdin);
        if (userInputInteger == 1) {
            // print lists
        }
        if (userInputInteger == 2) {
            ListManager *newList = [[ListManager alloc]init];
            //method doesn't work [newList addListDescription]; has something to do with the while loop
            //method doesn't work [newList _itemsInList]; has something to do with the while loop
            //method doesn't work [newList listName]; has something to do with the while loop
        }
        if (userInputInteger == 0) {
            NSLog(@"It was good to see you! Bye!");
            break; //doesn't break out of the while loop here
        }
        else {
            NSLog(@"Bummer! Try again?");
        }
    }
}
@end

