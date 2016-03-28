//
//  STCcoreDataService.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "STCCoreDataService.h"

#import "ManagedTweet.h"
#import "ManagedUser.h"
#import "ManagedUrl.h"
#import "ManagedHashtag.h"

@implementation STCCoreDataService

- (void)saveContext:(NSManagedObjectContext *)context {
    [context performBlockAndWait:^{
        NSError *error;
        if (context.hasChanges && ![context save:&error]) {
            NSLog(@"Unresolved error %@, \n%@", error, [error userInfo]);
            // TODO: notify about failure of saving
            
            abort();
        }
    }];
    
    if (context.parentContext) {
        [self saveContext:context.parentContext];
    }
    // TODO: notify about successful saving
}

- (void)deleteAllManagedEntities {
    [self deleteManagedEntityWithName:NSStringFromClass([ManagedTweet class])];
    [self deleteManagedEntityWithName:NSStringFromClass([ManagedUser class])];
    [self deleteManagedEntityWithName:NSStringFromClass([ManagedUrl class])];
    [self deleteManagedEntityWithName:NSStringFromClass([ManagedHashtag class])];
    
    [self saveContext:self.privateManagedOnjectContext];
}

- (void)deleteManagedEntityWithName:(NSString *)entityName {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    NSBatchDeleteRequest *deleteRequest = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    
    // Execute batch request for deleting entities
    NSError *deleteError = nil;
    [self.persistentStoreCoordinator executeRequest:deleteRequest withContext:self.privateManagedOnjectContext error:&deleteError];
    
    if (deleteError) {
        NSLog(@"Unresolved error while deleting RSS entities: %@, \n%@", deleteError, [deleteError userInfo]);
        abort();
    } 
}

- (void)saveTweetList:(NSArray *)tweetList {
    
}

@end
