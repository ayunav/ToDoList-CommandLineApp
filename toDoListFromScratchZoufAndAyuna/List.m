//
//  List.m
//  toDoListFromScratchZoufAndAyuna
//
//  Created by Ayuna Vogel on 6/30/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import "List.h"

@implementation List {
    NSString* _listName;
    NSMutableArray* _itemsInList;
}

-(void)setListName:(NSString *)listName {
    _listName = listName;
}
-(NSString*) listName {
    return _listName;
}
-(NSMutableArray*)itemsInList {
    if (_itemsInList == nil) {
        _itemsInList = [[NSMutableArray alloc] init];
    }
    return _itemsInList;
}

-(void) addItemToList: (Item*) task {
    [_itemsInList addObject:task];
}
-(void) deleteItemFromList: (Item*) task {
    NSLog(@"Enter a number to delete task");
    int j;
    scanf("%d", &j);
    for (int i = 0; i < [_itemsInList count]; i++) {
        if (i == j) {
            [_itemsInList removeObjectAtIndex:j-1];
        }
    }
}

-(void) printAllItemsInList {
    for (int i = 0; i < [_itemsInList count]; i++) {
        NSString *itemName = [[_itemsInList objectAtIndex:i] itemName];
        int itemPriority = [[_itemsInList objectAtIndex:i] itemPriority];
        NSLog(@"%@, %d", itemName, itemPriority);
    }
}

-(void) markItemDone: (Item *) task {
    NSLog(@"Enter a number to mark task done");
    int j;
    scanf("%d", &j);
    for (int i = 0; i < [_itemsInList count]; i++) {
        if (i == j) {
            NSString *task = [[_itemsInList objectAtIndex:j-1] itemName];
            NSString *printTaskAsCompleted = [NSString stringWithFormat:@"✔︎ %@", task];
            NSLog(@"%@", printTaskAsCompleted);
        }
    }
}

//-(void) editItemName {
// first version of this code - doesn't work
//    NSLog(@"Enter task description");
//    char newItemName[256];
//    fgets(newItemName, 256, stdin);
//    NSString *editedItemName = [NSString stringWithUTF8String:newItemName];

//2nd version:
//    //if scanf user input = edit task {
//    int j;
//    scanf("%d", &j);
//    for (int i = 0; i < [_itemsInList count]; i++) {
//        if (j == i) {
//            NSString *itemName = [[_itemsInList objectAtIndex:j-1] itemName];
//            NSLog(@"Enter task description");
//            char newItemName[256];
//            fgets(newItemName, 256, stdin);
//            NSString *editedItemName = [NSString stringWithUTF8String:newItemName];
//            itemName = editedItemName;
//        }
//    }
//}

-(void) addListDescription {
    NSLog(@"Enter list description: ");
    // fgets method allows user to input more than one word ie: "finish project"
    char listDescriptionInput[256];
    fgets(listDescriptionInput, 256, stdin);
    //  NSLog(@"item added: %s", name); // we test our work above here
    NSString *listDescription = [NSString stringWithUTF8String:listDescriptionInput]; //stringWithUTF8String converts char to string
    //    NSLog(@"string test: %@", item1);
    [self setListName:listDescription];
}

-(void) listOptions {
    //this has to be inside a while loop, don't know how to write it yet
    NSArray *listOptions = [[NSArray alloc] initWithObjects:@"1 - Display all tasks", @"2 - Add new task", @"3 - Edit task", @"4 - Delete task", @"5 - Mark task done", @"6 - List all active tasks", @"7 - List completed tasks", @"0 - Quit",  nil];
    NSLog(@"%@", listOptions);
    int i;
    scanf("%d", &i);
    if (i == 1) {
        //print all items in list
    }
    if (i == 2) {
        //add new item
    }
    if (i ==3) {
        //rename item
    }
    if (i == 4) {
        //delete item
    }
    if (i == 5) {
        //mark task done
    }
    if (i == 6) {
        //list all 'not marked done' items
    }
    if (i == 7) {
        //print all items in list, versions: either excluding marked done items, or print all incl marked done items with a check sign
    }
    if (i == 0) {
        NSLog(@"It was good to see you! Bye!");
    }
    else {
        NSLog(@"Bummer! Try again?");
    }
}


@end

