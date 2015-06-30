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
    NSLog(@"Enter an item number to delete it");
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
    NSLog(@"What item do you want to mark as completed?");
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

@end

