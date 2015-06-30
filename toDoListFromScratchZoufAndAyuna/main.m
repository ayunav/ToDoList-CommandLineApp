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
        //[groceryList printAllItemsInList];
        //[groceryList editItemName:secondTask];
        
        
        Item *finishToDoListAppProject = [[Item alloc] init];
        [finishToDoListAppProject setItemName:@"Finish to-do list app project"];
        [finishToDoListAppProject setItemPriority:1];
        
        Item *learnGitBranching = [[Item alloc] init];
        [learnGitBranching setItemName:@"Learn Git branching"];
        [learnGitBranching setItemPriority:2];
        
        Item *readBook = [[Item alloc] init];
        [readBook setItemName:@"Read Objective-C programming: The big nerd ranch guide book"];
        [readBook setItemPriority:3];
        
        List *homeworkToDoList = [[List alloc] init];
        [homeworkToDoList itemsInList];
        [homeworkToDoList setListName:@"Homework"];
        [homeworkToDoList addItemToList:finishToDoListAppProject];
        [homeworkToDoList addItemToList:learnGitBranching];
        [homeworkToDoList addItemToList:readBook];
        //[homeworkToDoList printAllItemsInList];
        
        ListManager *oneListSoFar = [[ListManager alloc]init];
        [oneListSoFar getLists];
        [oneListSoFar addListToListManager: groceryList];
        [oneListSoFar addListToListManager:homeworkToDoList];
        
        
        //[groceryList deleteItemFromList:firstTask];
        //[groceryList printAllItemsInList];
        //[groceryList markItemDone:secondTask];
        //[groceryList printAllItemsInList];

        
        NSLog(@"Welcome to your to-do list app! Let's get you started:\n");
        //print options menu for list options menu
        NSArray *homeMenuListManagerOptions = [[NSArray alloc] initWithObjects:@"1 - Display all to-do lists", @"2 - Add new to-do list", @"3 - Delete a to-do list", @"Enter a number to pick your option:", nil];
        NSLog(@"%@", homeMenuListManagerOptions);
        int j;
        scanf("%d", &j);
        int i;
        if (i == 1) {
            [oneListSoFar printLists];
        }
        // if add new to do list - don't know how to right the whole thing
        // if delete list -> how pick a list at index? write it in the method in implementation
//        if (i == 3) {
//            [oneListSoFar deleteListFromListManager:<#(List *)#>];
//        }
//        

        
//        NSArray *homeMenuListOptions = [[NSArray alloc] initWithObjects:@"1 - Display all tasks\n", @"2 - Add new task\n", @"3 - Delete task\n", @"4 - Mark task done\n", @"5 - Edit task\n", @"6 - List all active tasks\n", @"7 - List completed tasks\n", nil];
//        NSLog(@"%@", homeMenuListOptions);

        
        
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
