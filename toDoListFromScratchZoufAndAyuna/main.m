//
//  main.m
//  toDoListFromScratchZoufAndAyuna
//
//  Created by Ayuna Vogel on 6/28/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>
//********* INTERFACE LIST MANAGER ********
@interface ListManager : NSObject
@end

@implementation ListManager
@end

//********* INTERFACE LIST ********
@interface List : NSObject
-(NSString*) setListName;
-(NSMutableArray*) items;
-(void) printAllItems;
@end

@implementation List {
    NSString* listName;
    NSMutableArray* items;
}

-(void) printAllItems: (NSMutableArray*) itemsInAList {
    
}

@end

//********* INTERFACE ITEM ********
@interface Item : NSObject
-(NSString*) setName;
-(int) setPriority;
-(void) createItem: (NSString*) name withPriority: (int) itemPriority;
@end

@implementation Item {
    NSString* itemName;
    int priority;
}
-(NSString*) setName {
    return itemName;
}
-(int) setPriority {
    return priority;
}
-(void) createItem: (NSString*) name withPriority: (int) itemPriority {
    itemName = name;
    priority = itemPriority;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
