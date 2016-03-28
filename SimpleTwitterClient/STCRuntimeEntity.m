//
//  STCRuntimeEntity.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "STCRuntimeEntity.h"

NSString *const STCIdKey = @"id";
NSString *const STCLangKey = @"lang";
NSString *const STCCreatedDateKey = @"created_at";

@implementation STCRuntimeEntity

- (NSManagedObject *)mergeWithContext:(NSManagedObjectContext *)context {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (NSManagedObject *)managedEntityWithName:(NSString *)name attribute:(NSString *)attributeName value:(NSString *)value inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [self fetchRequestForEntityWithName:name attribute:attributeName value:value inContext:context];
    
    NSError *fetchError;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    // TODO: refactor this code!
    if (results.count) {
        return results[0];
    } else {
        return nil;
    }
}

- (BOOL)isEntityExistWithName:(NSString *)name attribute:(NSString *)attributeName value:(NSString *)value inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [self fetchRequestForEntityWithName:name attribute:attributeName value:value inContext:context];
    [fetchRequest setFetchLimit:1];
    
    NSError *fetchError;
    NSUInteger count = [context countForFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Fetch error: %@", fetchError);
        return NO;
    }
    
    if (count == 0) {
        return NO;
    } else {
        return YES;
    }
}

- (NSFetchRequest *)fetchRequestForEntityWithName:(NSString *)name attribute:(NSString *)attributeName value:(NSString *)value inContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription entityForName:name inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ == %@", attributeName, value];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate: predicate];
    
    return fetchRequest;
}

@end
