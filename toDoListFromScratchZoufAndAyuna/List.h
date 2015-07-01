//
//  List.h
//  toDoListFromScratchZoufAndAyuna
//
//  Created by Ayuna Vogel on 6/30/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "List.h"
#import "ListManager.h"

@class ListManager;
@class List;
@class Item;

@interface List : NSObject
-(NSString *) listName;
-(NSMutableArray *) itemsInList;
-(void)setListName: (NSString *) listName;
-(void) addItemToList: (Item *) task;
-(void) deleteItemFromList: (Item *) task;
-(void) printAllItemsInList;
-(void) markItemDone: (Item *) task;
//-(void) editItemName;
-(void) listOptions;
-(void) addListDescription;
@end