//
//  ManagedTweet+CoreDataProperties.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ManagedTweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagedTweet (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *createdDate;
@property (nullable, nonatomic, retain) NSNumber *favoriteCount;
@property (nullable, nonatomic, retain) NSNumber *isFavorited;
@property (nullable, nonatomic, retain) NSNumber *isQuoteStatus;
@property (nullable, nonatomic, retain) NSNumber *isRetweeted;
@property (nullable, nonatomic, retain) NSString *lang;
@property (nullable, nonatomic, retain) NSNumber *retweetCount;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSNumber *tweetId;
@property (nullable, nonatomic, retain) NSSet<ManagedHashtag *> *hashtags;
@property (nullable, nonatomic, retain) NSManagedObject *user;

@end

@interface ManagedTweet (CoreDataGeneratedAccessors)

- (void)addHashtagsObject:(ManagedHashtag *)value;
- (void)removeHashtagsObject:(ManagedHashtag *)value;
- (void)addHashtags:(NSSet<ManagedHashtag *> *)values;
- (void)removeHashtags:(NSSet<ManagedHashtag *> *)values;

@end

NS_ASSUME_NONNULL_END
