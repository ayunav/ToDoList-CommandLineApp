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
-(void) createItem: (NSString*) name withPriority: (int) itemPriority;
-(NSString*) getName;
-(int) getPriority;
@end

//************************************** IMPLEM ITEM ********
@implementation Item {
    NSString* _itemName;
    int _priority;
}
-(void) createItem: (NSString*) name withPriority: (int) itemPriority {
    _itemName = name;
    _priority = itemPriority;
}
-(NSString*) getName {
    return _itemName;
}
-(int) getPriority {
    return _priority;
}
@end


//************************************** INTERFACE LIST ********
@interface List : NSObject
-(NSString*)listName;
-(NSMutableArray*)items;
-(void)setListNameAndInitializeItemsArray: (NSString*) listName;
-(void) addItemToList: (Item*) task;
-(void) printAllItemsInList;
@end

//************************************** IMPLEM LIST ********
@implementation List {
    NSString* _listName;
    NSMutableArray* _items;
}
-(NSString*) getListName {
    return _listName;
}
- (NSMutableArray*)items {
    return _items;
}
-(void)setListNameAndInitializeItemsArray: (NSString*) listName {
    _listName = listName;
    _items = [[NSMutableArray alloc] init];
}

-(void) addItemToList: (Item*) task {
    [_items addObject:task];
}

-(void) printAllItemsInList {
    for (int i = 0; i < [_items count]; i++) {
        NSString *name = [[_items objectAtIndex:i] getName];
        int priority = [[_items objectAtIndex:i] getPriority];
        NSLog(@"%@, %d", name, priority);
    }
}


//[persons removeObjectAtIndex:index];

@end


//************************************** INTERFACE LIST MANAGER ********
@interface ListManager : NSObject
-(NSMutableArray*) lists;
-(void) addListToListManager: (List*) list;
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
-(void)printLists {
    for (int i = 0; i < [_lists count]; i++) {
        NSString *listName = [[_lists objectAtIndex:i] getListName];
        NSLog(@"%@", listName);
    }
}
@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Item *firstTask = [[Item alloc]init];
        [firstTask createItem:@"Buy bananas" withPriority:1];
        
        Item *secondTask = [[Item alloc]init];
        [secondTask createItem:@"Buy coffee and tea" withPriority:2];
        
        List *groceryList = [[List alloc]init];
        [groceryList setListNameAndInitializeItemsArray:@"Grocery List"];
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
