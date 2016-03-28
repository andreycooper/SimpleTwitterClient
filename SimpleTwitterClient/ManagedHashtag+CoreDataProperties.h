//
//  ManagedHashtag+CoreDataProperties.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ManagedHashtag.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagedHashtag (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *hashTag;
@property (nullable, nonatomic, retain) NSManagedObject *tweet;

@end

NS_ASSUME_NONNULL_END
