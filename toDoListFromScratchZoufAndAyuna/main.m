//
//  main.m
//  toDoListFromScratchZoufAndAyuna
//
//  Created by Ayuna Vogel on 6/28/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "List.h"
#import "ListManager.h"

@class ListManager;
@class List;
@class Item;

//************************************** INTERFACE ITEM ********

//************************************** IMPLEM ITEM ********

//************************************** INTERFACE LIST ********

//************************************** IMPLEM LIST ********

//************************ INTERFACE LIST MANAGER ********

//************************************** IMPLEM LIST MANAGER ********

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
        [groceryList itemsInList]; 
        [groceryList addItemToList:firstTask];
        [groceryList addItemToList:secondTask];
        [groceryList printAllItemsInList];
        //[groceryList editItemName:secondTask];
        
        ListManager *oneListSoFar = [[ListManager alloc]init];
        [oneListSoFar getLists];
        [oneListSoFar addListToListManager: groceryList];
        [oneListSoFar printLists];
        
        //[groceryList deleteItemFromList:firstTask];
        //[groceryList printAllItemsInList];
        //[groceryList markItemDone:secondTask];
        //[groceryList printAllItemsInList];
    
//        NSArray *homeMenuOptions = [[NSArray alloc] initWithObjects:@"1 - Display all to-do lists", @"2 - Add new to-do list\n", @"3 - Delete a to-do list\n", @"4 - Display all tasks\n", @"5 - Add new task\n", @"6 - Delete task\n", @"7 - Mark task done\n", @"8 - Edit task\n", @"9 - List all active tasks\n", @"10 - List completed tasks\n", nil];
//        NSLog(@"%@", homeMenuOptions);

        
        
//        NSLog(@"Would you like to create a to-do list? Enter:\n 1 = Yes\n 2 = NO");
//        int i;
//        scanf("%d", &i);
//        if (i == 2) {
//            return NO;
//        }
//        if (i == 1) {
//            NSLog(@"Enter a name for your to-do list:");
//            }
//        else {
//            NSLog(@"Sorry, this input is incorrect. Please enter:\n 1 = Yes\n 2 = NO");
//        }
        
        
        
    
    
    
    }
    return 0;
}
