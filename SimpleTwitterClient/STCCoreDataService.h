//
//  STCcoreDataService.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData+DI.h"

@interface STCCoreDataService : NSObject

@property (strong, nonatomic) NSManagedObjectContext *mainManagedObjectContext;
@property (strong, nonatomic) NSManagedObjectContext *privateManagedOnjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext:(NSManagedObjectContext *)context;

- (void)deleteAllManagedEntities;

- (void)deleteManagedEntityWithName:(NSString *)entityName;

- (void)saveTweetList:(NSArray *)tweetList;

@end
