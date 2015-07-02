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
    BOOL _markedDone;
}

-(void) setItem: (NSString *) item {
    _itemName = item;
}

-(void) addItemDescription {
    NSLog(@"Enter task description: ");
    // fgets method allows user to input more than one word ie: "finish project"
    char itemInput[256];
    fgets(itemInput, 256, stdin);
    //  NSLog(@"item added: %s", name); // we test our work above here
    NSString *itemDescription = [NSString stringWithUTF8String:itemInput]; //stringWithUTF8String converts char to string
    //    NSLog(@"string test: %@", item1);
    [self setItem: itemDescription];
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
-(void) setMarkedDone:(BOOL)markedDone {
    _markedDone = markedDone; 
}

-(BOOL) markedDone {
    return _markedDone;
}

@end
