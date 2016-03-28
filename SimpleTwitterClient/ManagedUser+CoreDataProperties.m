//
//  ManagedUser+CoreDataProperties.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ManagedUser+CoreDataProperties.h"

@implementation ManagedUser (CoreDataProperties)

@dynamic createdDate;
@dynamic favouritesCount;
@dynamic followersCount;
@dynamic friendsCount;
@dynamic httpsProfileImageBackgroundUrl;
@dynamic httpsProfileImageUrl;
@dynamic isFollowing;
@dynamic isFollowRequestSent;
@dynamic isProfileUseBackgroundImage;
@dynamic isVerified;
@dynamic lang;
@dynamic name;
@dynamic screenName;
@dynamic url;
@dynamic userDescription;
@dynamic userId;
@dynamic urls;

@end
