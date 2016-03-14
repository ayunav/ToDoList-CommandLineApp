//
//  ListManager.h
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

@interface ListManager : NSObject

-(NSMutableArray*) getLists;
-(void) addListToListManager: (List*) list;
-(void) renameList; 
-(void) deleteListFromListManager: (int) j;
-(void) printLists;
-(void) listManagerMenuOptions;

@end