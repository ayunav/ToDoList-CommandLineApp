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
    [_lists addObject:list];
}
-(void) deleteListFromListManager: (List*) list {
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
}
@end

