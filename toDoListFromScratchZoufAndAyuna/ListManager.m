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
    //NSLog(@"Enter a name for your new to-do list"); //commenting it out for now, but it will be in the loop method later
    [_lists addObject:list];
    

    //scanf for user input string name for the new to-do list
    //[list setListName: user input string for the new to do list name];
    //should list options for that list - home menu list options (display all tasks, add task, etc.
}

-(void) renameList {
//    [self printLists];
//    NSLog(@"Enter a number to pick a list");
//    int j;
//    scanf("%d", &j);
//    NSString *oldListName = [[_lists objectAtIndex:j-1] listName];
//    NSLog(@"Enter list description");
//    char newUserListName[256];
//    fgets(newUserListName, 256, stdin);
//    NSString *editedListName = [NSString stringWithUTF8String:newUserListName];
//    oldListName = editedListName;
//    [_lists replaceObjectAtIndex:j-1 withObject:editedListName];
    
    
    [self printLists];
    NSLog(@"Enter a number to pick a list");
    int j;
    scanf("%d", &j);
    fpurge(stdin);
    NSLog(@"Enter new list description");
    char newUserListName[256];
    fgets(newUserListName, 256, stdin);
    NSString *editedListName = [NSString stringWithUTF8String:newUserListName];
    [[_lists objectAtIndex:j-1] setListName:editedListName];
}

-(void) deleteListFromListManager: (int) j {
            [_lists removeObjectAtIndex:j-1];
}

-(void)printLists {
    for (int i = 0; i < [_lists count]; i++) {
        NSString *listName = [[_lists objectAtIndex:i] listName];
        NSLog(@"%i %@", i+1, listName);
    }
    //NSLog(@"Enter a number to pick your to-do list");
}

-(void) listManagerMenuOptions { 
    int userInputInteger;
    BOOL runListManagerMenuOptions = true;
    while (runListManagerMenuOptions) {
        
        NSArray *listManagerMenuOptions = [[NSArray alloc] initWithObjects:@"1 - Display all to-do lists", @"2 - Add new to-do list", @"3 - Rename a to-do list", @"4 - Delete a to-do list", @"0 - Quit", @"Enter a number to pick your option:", nil];
        NSLog(@"%@", listManagerMenuOptions);
        scanf("%d", &userInputInteger);
        fpurge(stdin);
        
        if (userInputInteger == 1) {
            [self printLists];
            break;
        }
        else if (userInputInteger == 2) {
// this next lines of code might not be necessary
//            if ([_lists count] == 0) {
//                ListManager *newList = [[ListManager alloc]init];
//            }
            List *newToDoList = [[List alloc]init];
            [newToDoList addListDescription];
            [newToDoList itemsInList];
            [newToDoList listName];
            [self addListToListManager:newToDoList];
        }
        else if (userInputInteger == 3) {
            [self printLists];
            NSLog(@"Enter a number to pick a list");
            int j;
            scanf("%d", &j);
            fpurge(stdin);
            NSLog(@"Enter new list description");
            char newUserListName[256];
            fgets(newUserListName, 256, stdin);
            NSString *editedListName = [NSString stringWithUTF8String:newUserListName];
            [[_lists objectAtIndex:j-1] setListName:editedListName];
        }
        else if (userInputInteger == 4) {
            [self printLists];
            int j;
            scanf("%d", &j);
            [self deleteListFromListManager:j];
            NSLog(@"Deleted");
        }
        else if (userInputInteger == 0) {
            NSLog(@"It was good to see you! Bye!");
            //runListManagerMenuOptions = false;
            break;
        }
        else {
            NSLog(@"Bummer! Try again?");
        }
    }
}

//-(void)sortList {
//    _lists = [_lists sortUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
//        
//    }];
//}

@end

