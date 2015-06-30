//
//  main.m
//  toDoListFromScratchZoufAndAyuna
//
//  Created by Ayuna Vogel on 6/28/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//


#import <Foundation/Foundation.h>

@class ListManager;
@class List;
@class Item;

//************************************** INTERFACE ITEM ********
@interface Item : NSObject
-(void) setItemName: (NSString*) itemName;
-(void) setItemPriority: (int) itemPriority;
-(NSString*) itemName;
-(int) itemPriority;
@end

//************************************** IMPLEM ITEM ********
@implementation Item {
    NSString* _itemName;
    int _itemPriority;
}
-(void) setItemName: (NSString*) itemName {
    _itemName = itemName;
}
-(NSString*) itemName {
    return _itemName;
}
-(void) setItemPriority: (int) itemPriority {
    _itemPriority = itemPriority;
}
-(int) itemPriority {
    return _itemPriority;
}
@end


//************************************** INTERFACE LIST ********
@interface List : NSObject
-(NSString *) listName;
-(NSMutableArray *) itemsInList;
-(void)setListName: (NSString *) listName;
-(void) addItemToList: (Item *) task;
-(void) deleteItemFromList: (Item *) task;
-(void) printAllItemsInList;
-(void) markItemDone: (Item *) task;
@end

//************************************** IMPLEM LIST ********
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


//************************ INTERFACE LIST MANAGER ********
@interface ListManager : NSObject
-(NSMutableArray*) getLists;
-(void) addListToListManager: (List*) list;
-(void) deleteListFromListManager: (List*) list;
-(void)printLists;
@end

//************************************** IMPLEM LIST MANAGER ********
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

// ************ *********** ****** >>> MAIN FUNCTION <<< ********* ******** **********
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Item *firstTask = [[Item alloc]init];
        [firstTask setItemName:@"Buy bananas"];
        [firstTask setItemPriority:1];
        
        Item *secondTask = [[Item alloc]init];
        [secondTask setItemName:@"Buy coffee and tea"];
        [secondTask setItemPriority:2];
        
        List *groceryList = [[List alloc]init];
        [groceryList setListName:@"Grocery List"];
        [groceryList addItemToList:firstTask];
        [groceryList addItemToList:secondTask];
        [groceryList printAllItemsInList];
        
        ListManager *oneListSoFar = [[ListManager alloc]init];
        [oneListSoFar getLists];
        [oneListSoFar addListToListManager: groceryList];
        [oneListSoFar printLists];
    
    
    }
    return 0;
}
