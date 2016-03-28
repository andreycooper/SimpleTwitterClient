//
//  ManagedUser+CoreDataProperties.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ManagedUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagedUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *createdDate;
@property (nullable, nonatomic, retain) NSNumber *favouritesCount;
@property (nullable, nonatomic, retain) NSNumber *followersCount;
@property (nullable, nonatomic, retain) NSNumber *friendsCount;
@property (nullable, nonatomic, retain) NSString *httpsProfileImageBackgroundUrl;
@property (nullable, nonatomic, retain) NSString *httpsProfileImageUrl;
@property (nullable, nonatomic, retain) NSNumber *isFollowing;
@property (nullable, nonatomic, retain) NSNumber *isFollowRequestSent;
@property (nullable, nonatomic, retain) NSNumber *isProfileUseBackgroundImage;
@property (nullable, nonatomic, retain) NSNumber *isVerified;
@property (nullable, nonatomic, retain) NSString *lang;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *screenName;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *userDescription;
@property (nullable, nonatomic, retain) NSNumber *userId;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *urls;

@end

@interface ManagedUser (CoreDataGeneratedAccessors)

- (void)addUrlsObject:(NSManagedObject *)value;
- (void)removeUrlsObject:(NSManagedObject *)value;
- (void)addUrls:(NSSet<NSManagedObject *> *)values;
- (void)removeUrls:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
