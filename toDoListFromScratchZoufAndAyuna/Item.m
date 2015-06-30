//
//  Item.m
//  toDoListFromScratchZoufAndAyuna
//
//  Created by Ayuna Vogel on 6/30/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import "Item.h"

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
