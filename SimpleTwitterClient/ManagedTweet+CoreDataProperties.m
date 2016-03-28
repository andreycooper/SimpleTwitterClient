//
//  ManagedTweet+CoreDataProperties.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ManagedTweet+CoreDataProperties.h"

@implementation ManagedTweet (CoreDataProperties)

@dynamic createdDate;
@dynamic favoriteCount;
@dynamic isFavorited;
@dynamic isQuoteStatus;
@dynamic isRetweeted;
@dynamic lang;
@dynamic retweetCount;
@dynamic text;
@dynamic tweetId;
@dynamic hashtags;
@dynamic user;

@end
