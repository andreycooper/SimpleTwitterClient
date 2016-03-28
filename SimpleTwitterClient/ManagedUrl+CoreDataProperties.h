//
//  ManagedUrl+CoreDataProperties.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ManagedUrl.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagedUrl (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *displayUrl;
@property (nullable, nonatomic, retain) NSString *expandedUrl;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) ManagedTweet *tweet;
@property (nullable, nonatomic, retain) ManagedUser *user;

@end

NS_ASSUME_NONNULL_END
