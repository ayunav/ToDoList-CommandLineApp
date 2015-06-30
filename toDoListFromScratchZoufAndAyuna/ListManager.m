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
    NSLog(@"Enter a name for your new to-do list");
    //List *somethingList = [[List alloc] init];
    //[somethingList itemsInList]; - initializes items array in the new todo list
    [_lists addObject:list];
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
@end

