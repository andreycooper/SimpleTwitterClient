//
//  STCCoreDataAssembly.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "STCCoreDataAssembly.h"
#import "STCCoreDataService.h"
#import "CoreData+DI.h"

@implementation STCCoreDataAssembly

- (STCCoreDataService *)coreDataService {
    return [TyphoonDefinition withClass:[STCCoreDataService class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(mainManagedObjectContext) with:[self mainManagedObjectContext]];
        [definition injectProperty:@selector(privateManagedOnjectContext) with:[self managedObjectContext]];
        [definition injectProperty:@selector(managedObjectModel) with:[self managedObjectModel]];
        [definition injectProperty:@selector(persistentStoreCoordinator) with:[self persistentStoreCoordinator]];
        definition.scope = TyphoonScopeLazySingleton;
    }];
}


#pragma mark - Contexts

- (NSManagedObjectContext *)mainManagedObjectContext {
    return [TyphoonDefinition withClass:[NSManagedObjectContext class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithConcurrencyType:persistentStoreCoordinator:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@(NSMainQueueConcurrencyType)];
            [initializer injectParameterWith:[self persistentStoreCoordinator]];
        }];
        definition.scope = TyphoonScopeLazySingleton;
    }];
}

- (NSManagedObjectContext *)managedObjectContext {
    return [TyphoonDefinition withClass:[NSManagedObjectContext class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithConcurrencyType:parentContext:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@(NSPrivateQueueConcurrencyType)];
            [initializer injectParameterWith:[self mainManagedObjectContext]];
            definition.scope = TyphoonScopeLazySingleton;
        }];
    }];
}

#pragma mark - Persistent store coordinator

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    return [TyphoonDefinition withClass:[NSPersistentStoreCoordinator class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithManagedObjectModel:type:URL:options:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self managedObjectModel]];
            [initializer injectParameterWith:NSSQLiteStoreType];
            [initializer injectParameterWith:[self storeURL]];
            [initializer injectParameterWith:nil];
        }];
    }];
}


#pragma mark - Managed object model

- (NSManagedObjectModel *)managedObjectModel {
    return [TyphoonDefinition withClass:[NSManagedObjectModel class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithContentsOfURL:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self modelURL]];
        }];
    }];
}

#pragma mark - helpers factories

- (NSURL *)modelURL {
    return [TyphoonDefinition withFactory:[self mainBundle] selector:@selector(URLForResource:withExtension:)
                               parameters:^(TyphoonMethod *factoryMethod) {
                                   [factoryMethod injectParameterWith:TyphoonConfig(@"coredata.filename")];
                                   [factoryMethod injectParameterWith:@"momd"];
                               }];
}


- (NSURL *)storeURL {
    return [TyphoonDefinition withFactory:[self applicationDocumentsDirectory] selector:@selector(URLByAppendingPathComponent:)
                               parameters:^(TyphoonMethod *factoryMethod) {
                                   [factoryMethod injectParameterWith:TyphoonConfig(@"coredata.sqlite")];
                               }];
}

- (NSArray *)applicationDocumentsDirectories {
    return [TyphoonDefinition withFactory:[self fileManager] selector:@selector(URLsForDirectory:inDomains:)
                               parameters:^(TyphoonMethod *factoryMethod) {
                                   [factoryMethod injectParameterWith:@(NSDocumentDirectory)];
                                   [factoryMethod injectParameterWith:@(NSUserDomainMask)];
                               }];
}

- (id)applicationDocumentsDirectory {
    return [TyphoonDefinition withFactory:[self applicationDocumentsDirectories] selector:@selector(lastObject)];
}

- (NSFileManager *)fileManager {
    return [TyphoonDefinition withClass:[NSFileManager class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(defaultManager)];
    }];
}

- (NSBundle *)mainBundle {
    return [TyphoonDefinition withClass:[NSBundle class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(mainBundle)];
    }];
}


@end
