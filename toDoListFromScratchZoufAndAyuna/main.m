
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

//************************************** INTERFACE ITEM ********
@interface Item : NSObject

-(void) createItem: (NSString*) name withPriority: (int) itemPriority;
-(NSString*) getName;
-(int) getPriority;

@end

//************************************** IMPLEM ITEM ********
@implementation Item {
    NSString* _itemName; //private property
    int _priority;
}
-(void) createItem: (NSString*) name withPriority: (int) itemPriority {
    _itemName = name;
    _priority = itemPriority;
}

-(NSString*) getName {
    return _itemName;
}
-(int) getPriority {
    return _priority;
}




@end


//************************************** INTERFACE LIST ********
@interface List : NSObject
-(NSString*)getListName;
-(NSMutableArray*)items;
-(void)setListNameAndInitializeItemsArray: (NSString*) listName;
-(void) addItemToList: (Item*) task;
-(void)editItemName:(NSString*) newItemName;
-(NSString*)getItemNames;
-(NSString*) getNewItemName;
-(void) deleteItemFromList: (Item*) removeTask;
-(void)editListName:(NSString*) newListName;
-(NSString*)markedCompletedItems;
-(BOOL) markItemInList: (Item*) markTask;
-(void) printAllItemsInList;
-(BOOL) markItemDone: (Item*) markTaskDone;
-(NSString *)parse;
-(void) printAllItemsInList;
@end

//************************************** IMPLEM LIST ********
@implementation List {
    NSString* _listName;
    NSString* _itemNames;
    NSMutableArray* _items;
    BOOL markItemInList;
    NSString* markedCompletedItems;
    NSString* _getNewItemName;
}
-(NSString*) getListName {
    return _listName;
}
- (NSMutableArray*)items {
    return _items;
}

-(NSString*)getItemNames {
    return _itemNames;
}

-(void)setListNameAndInitializeItemsArray: (NSString*) listName {
    _listName = listName;
    _items = [[NSMutableArray alloc] init];
}

-(void) addItemToList: (Item*) task {
    [_items addObject:task];
}

-(NSString *)parse {
    
    printf("\n    ");
    
    /* Allocate memory and check if okay. */
    char *userInput = malloc (256);
    if (userInput == NULL) {
        printf ("No memory\n");
    }
    
    // fgets is a function analogous to scanf but with better protection against
    // buffer overflow
    fgets (userInput, 256, stdin);
    
    /* Remove trailing newline, if there. */
    if ((strlen(userInput) > 0) && (userInput[strlen (userInput) - 1] == '\n')) {
        userInput[strlen(userInput) - 1] = '\0';
    }
    
    // change C string to NSString
    NSString *command = [NSString stringWithCString:userInput
                                           encoding:NSUTF8StringEncoding];
    
    return command;
}



-(void)editItemName:(NSString*) newItemName {
    
    NSLog(@"Which item would you like to edit?");
    
    for (int i = 0; i < [_items count]; i++) {
        int j;
        scanf("%d", &j);
        Item *item = [_items objectAtIndex:j-1];
        printf("Edit description");
        NSString *userInputStringforTheNewItemName = [NSString stringWithString:[self parse]];
        userInputStringforTheNewItemName =[item getName];
    }
}

-(NSString*) getNewItemName {
    return _getNewItemName;
}

-(void) deleteItemFromList: (Item*) removeTask {
    [_items removeObject:removeTask];
}


-(void)printAllItemsInList {
    for (int i = 0; i < [_items count]; i++) {
        NSString *itemNames = [[_items objectAtIndex:i] getItemNames];
        NSLog(@"%@", itemNames);
    }
}

-(BOOL) markItemInList: (Item*) markTask {
    NSLog(@"Would you like to mark an item completed? 1) Yes 2) No");
    int j;
    scanf("%d", &j);
    for (int i = 0; i < [_items count]; i++) {
        int j;
        if (j == 1) {
            Item *item = [_items objectAtIndex:i-1];
            [item createItem:[NSString stringWithFormat:@"✔︎ %@",[item getName]] withPriority:[item getPriority]];
            
        }
    }
    return markItemInList;
}
@end


//************************ INTERFACE LIST MANAGER ********
@interface ListManager : NSObject
-(NSMutableArray*) getLists;
-(void) addListToListManager: (List*) list;
-(void) removeListFromListManager: (List*) removeList;
-(void)printLists;
@end

//************************************** IMPLEM LIST MANAGER ********
@implementation ListManager {
    NSMutableArray *_lists;
}
- (NSMutableArray *) getLists {
    if (_lists == nil) {
        _lists = [[NSMutableArray alloc] init];
    }
    return _lists;
}
-(void) addListToListManager: (List*) list {
    [_lists addObject:list];
}

-(void) removeListFromListManager: (List*) removeList {
    [_lists removeObject:removeList];
}

-(void)printLists {
    for (int i = 0; i < [_lists count]; i++) {
        NSString *listName = [[_lists objectAtIndex:i] getListName];
        NSLog(@"%@", listName);
    }
}


@end




// ************ *********** ****** >>> MAIN FUNCTION <<< ********* ******** **********
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Item *firstTask = [[Item alloc]init];
        [firstTask createItem:@"Buy bananas" withPriority:1];
        
        Item *secondTask = [[Item alloc]init];
        [secondTask createItem:@"Buy coffee and tea" withPriority:2];
        
        List *newList = [[List alloc]init];
        [newList setListNameAndInitializeItemsArray:@"Grocery List"];
        [newList addItemToList:firstTask];
        [newList addItemToList:secondTask];
        //[groceryList printAllItemsInList];
        
        ListManager *newListInListManager = [[ListManager alloc]init];
        [newListInListManager getLists];
        [newListInListManager addListToListManager: newList];
        [newListInListManager printLists];
        
        
        int i;
        while(1) {
            NSLog(@"Please what you would like to do to the list. 1)pick a list 2)add list 3)rename list 4)remove list 5)list items 6)add item 7)remove item 8)mark item completed  9)quit");
            
            scanf("%d", &i);
            
            if (i == 1) {
                NSLog(@"Pick a list: \n");
                [newListInListManager printLists];
                
            } else if (i == 2) {
                NSLog(@"You chose to add list. Please enter a description: \n");
                [newListInListManager addListToListManager:newList];
                
            } else if (i == 3) {
               NSLog(@"You chose to rename list. Please enter a description: \n");
                [newList editListName:<#(NSString *)#>];
                
            } else if (i == 4){
                  NSLog(@"You chose to remove list \n");
                 [newListInListManager removeListFromListManager:newList];
                
            } else if (i == 5) {
                  NSLog(@"You chose to list items. \n");
                 [newList printAllItemsInList];
                
            } else if (i == 6) {
                NSLog(@"You chose to add an item to the list. Please enter a description: \n");
                 [newList addItemToList:<#(Item *)#>];
                
            } else if (i == 7) {
                NSLog(@"You chose to delete an item from the list \n");
                 [newList deleteItemFromList:<#(Item *)#>];
                
            } else if (i == 8) {
                 NSLog(@"You chose to mark an item completed \n");
                 [newList markItemInList:<#(Item *)#>];
                
            } else if (i == 9) {
                  NSLog(@"Adios amigo! See you soon \n");
                
                
            } else {
                NSLog(@"Invalid Entry");
            }
        }
        
        
        
        
    }
    return 0;
}
