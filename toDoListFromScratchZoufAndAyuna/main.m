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
        
        ListManager *allLists = [[ListManager alloc]init];
        [allLists getLists];
        [allLists addListToListManager: groceryList];
        [allLists addListToListManager:homeworkToDoList];
        
        
        //[groceryList deleteItemFromList:firstTask];
        //[groceryList printAllItemsInList];
        //[groceryList markItemDone:secondTask];
        //[groceryList printAllItemsInList];

        
        NSLog(@"Welcome to your to-do list app! Let's get you started:\n");
        //print options menu for list options menu
        [allLists listManagerMenuOptions];
        
        [groceryList listOptions]; 
        
        
        
        
        
        
        
    
    
    
    }
    return 0;
}
