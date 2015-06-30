//
//  Item.h
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

@interface Item : NSObject

-(void) setItemName: (NSString*) itemName;
-(void) setItemPriority: (int) itemPriority;
-(NSString*) itemName;
-(int) itemPriority;

@end
