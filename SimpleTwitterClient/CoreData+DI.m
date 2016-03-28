////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2014 Code Monastery Pty Ltd
//  All Rights Reserved.
//
//  NOTICE: This software is the proprietary information of Code Monastery
//  Use is subject to license terms.
//
////////////////////////////////////////////////////////////////////////////////



#import "CoreData+DI.h"


@implementation NSManagedObjectContext (InjectedInitialization)

- (instancetype)initWithConcurrencyType:(NSManagedObjectContextConcurrencyType)type
    persistentStoreCoordinator:(NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    self = [self initWithConcurrencyType:type];
    if (self) {
        [self setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    return self;
}

- (instancetype)initWithConcurrencyType:(NSManagedObjectContextConcurrencyType)type parentContext:(NSManagedObjectContext *)parentContext {
    self = [self initWithConcurrencyType:type];
    if (self) {
        self.parentContext = parentContext;
    }
    return self;
}

@end


@implementation NSPersistentStoreCoordinator (InjectedInitialization)

- (instancetype)initWithManagedObjectModel:(NSManagedObjectModel *)model type:(NSString *)type URL:(NSURL *)storeURL
    options:(NSDictionary *)options {
    self = [self initWithManagedObjectModel:model];
    if (self) {
        NSLog(@"Store URI: %@", storeURL);
        [self addPersistentStoreWithType:type configuration:nil URL:storeURL options:options error:nil];
    }
    return self;
}

@end