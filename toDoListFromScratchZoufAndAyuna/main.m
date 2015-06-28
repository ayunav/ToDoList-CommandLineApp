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

//********* INTERFACE ITEM ********
@interface Item : NSObject
-(NSString*) setName;
-(int) setPriority;
-(void) createItem: (NSString*) name withPriority: (int) itemPriority;
@end

//********* IMPLEM ITEM ********

@implementation Item {
    NSString* _itemName;
    int _priority;
}
-(NSString*) setName {
    return _itemName;
}
-(int) setPriority {
    return _priority;
}
-(void) createItem: (NSString*) name withPriority: (int) itemPriority {
    _itemName = name;
    _priority = itemPriority;
}
@end



//********* INTERFACE LIST ********
@interface List : NSObject
-(void)setListNameAndInitializeItemsArray: (NSString*) listName;
-(void) addItemToList: (Item*) task;
-(void) printAllItemsInList;

@end


//********* IMPLEM LIST ********

@implementation List {
    NSString* _listName;
    NSMutableArray* _items;
}


-(void)setListNameAndInitializeItemsArray: (NSString*) listName {
    _listName = listName;
    _items = [[NSMutableArray alloc] init];
}

-(void) addItemToList: (Item*) task {
    [_items addObject:task];
}

-(void) printAllItemsInList: (NSMutableArray*) itemsInAList {
    for (int i = 0; i < [_items count]; i++) {
        NSString *name = [[_items objectAtIndex:i] setName];
        int priority = [[_items objectAtIndex:i] setPriority];
        NSLog(@"%@, %d", name, priority);
    }
}


//[persons removeObjectAtIndex:index];

@end


//********* INTERFACE LIST MANAGER ********
@interface ListManager : NSObject
@end

//********* IMPLEM LIST MANAGER ********

@implementation ListManager
@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
