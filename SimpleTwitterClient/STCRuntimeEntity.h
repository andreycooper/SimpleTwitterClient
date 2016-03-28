//
//  STCRuntimeEntity.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CoreData+DI.h"

extern NSString *const STCIdKey;
extern NSString *const STCLangKey;
extern NSString *const STCCreatedDateKey;

@interface STCRuntimeEntity : JSONModel

- (NSManagedObject *)mergeWithContext:(NSManagedObjectContext *)context;

- (BOOL)isEntityExistWithName:(NSString *)name attribute:(NSString *)attributeName value:(NSString *)value inContext:(NSManagedObjectContext *)context;

- (NSManagedObject *)managedEntityWithName:(NSString *)name attribute:(NSString *)attributeName value:(NSString *)value inContext:(NSManagedObjectContext *)context;

@end
