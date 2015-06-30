
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
-(NSString*)listName;
-(NSMutableArray*)items;
-(void)setListNameAndInitializeItemsArray: (NSString*) listName;
-(void) addItemToList: (Item*) task;
-(void)editItemName:(NSString*) newItemName;
-(NSString*) getNewItemName;
-(void) deleteItemFromList: (Item*) removeTask;
-(void)editListName:(NSString*) newListName;
-(NSString*)markedCompletedItems;
-(BOOL) markItemInList: (Item*) markTask;
-(void) printAllItemsInList;
@end

//************************************** IMPLEM LIST ********
@implementation List {
    NSString* _listName;
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


//************************************** INTERFACE LIST MANAGER ********
@interface ListManager : NSObject
-(NSMutableArray*) lists;
-(void) addListToListManager: (List*) list;
-(void) removeListFromListManager: (List*) removeList;
-(void)printLists;
-(NSString *)parse;
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




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Item *firstTask = [[Item alloc]init];
        [firstTask createItem:@"Buy bananas" withPriority:1];
        
        Item *secondTask = [[Item alloc]init];
        [secondTask createItem:@"Buy coffee and tea" withPriority:2];
        
        List *groceryList = [[List alloc]init];
        [groceryList setListNameAndInitializeItemsArray:@"Grocery List"];
        [groceryList addItemToList:firstTask];
        [groceryList addItemToList:secondTask];
        [groceryList printAllItemsInList];
        
        ListManager *oneListSoFar = [[ListManager alloc]init];
        [oneListSoFar getLists];
        [oneListSoFar addListToListManager: groceryList];
        [oneListSoFar printLists];
        
        
        int i;
        while(1) {
            NSLog(@"Please what you would like to do to the list. 1)remove list 2)add list 3)rename list 4)pick a list 5)quit");
            
            scanf("%d", &i);
            
            if (i == 1) {
                NSLog(@"You chose to list your active items: \n");
                [oneListSoFar removeListFromListManager];
            } else if (i == 2) {
                NSLog(@"You chose to add an item to the list. Please enter a description: \n");
                [oneListSoFar addListToListManager];
            } else if (i == 3) {
                NSLog(@"You chose to delete an item from the list \n");
                [self renameList];
            } else if (i == 4){
                
            } else if (i == 5) {
                
                
            } else {
                NSLog(@"Invalid Entry");
            }
        }
        
        
        
        
        
        //************************************** SAMPLE USER INPUT ********
        //        int i;
        //        scanf("%d", &i);
        //
        //        //    for (int j = 0; j < 5; j++) {
        //
        //        if (i == 1) {
        //            NSLog(@"You chose to list your active items: \n");
        //            [self showList];
        //        } else if (i == 2) {
        //            NSLog(@"You chose to add an item to the list. Please enter a description: \n");
        //            [self addItem];
        //        } else if (i == 3) {
        //            NSLog(@"You chose to delete an item from the list \n");
        //            [self deleteItem];
        //        } else if (i == 4) {
        //            NSLog(@"You chose to mark an item as completed: \n");
        //            [self markAsCompleted];
        //        } else if (i == 5 ) {
        //            NSLog(@"You chose to list completed items: \n");
        //            [self _completedList];
        //        } else {
        //            NSLog(@"Invalid Entry");
        //        }
        //
        //    }
        //        Please enter a description: swim
        //
        //        What would you like to do?
        //            l - list items
        //            a - add item
        //            r - remove item
        //            d - mark item done
        //            c - list completed item
        //            
        //            > l
        
        
    }
    return 0;

