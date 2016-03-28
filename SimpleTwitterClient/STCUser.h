//
//  STCUser.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 16.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STCRuntimeEntity.h"
#import "STCUrl.h"

extern NSString *const STCUserNameKey;
extern NSString *const STCUserScreenNameKey;
extern NSString *const STCUserDescriptionKey;

extern NSString *const STCUserUrlKey;
extern NSString *const STCHTTPSProfileImageUrlKey;
extern NSString *const STCHTTPSProfileBackgroundImageUrlKey;
extern NSString *const STCUserURLsPathKey;

extern NSString *const STCIsFollowingKey;
extern NSString *const STCIsFollowRequestSentKey;

extern NSString *const STCFollowersCountKey;
extern NSString *const STCFriendsCountKey;
extern NSString *const STCFavouritesCountKey;

extern NSString *const STCIsUserVerifiedKey;
extern NSString *const STCIsProfileUseBackgroundImageKey;

@protocol STCUser
@end

@interface STCUser : STCRuntimeEntity

@property (assign, nonatomic) NSInteger userId;
@property (strong, nonatomic) NSString *lang;
@property (strong, nonatomic) NSDate *createdDate;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSString *userDescription;


@property (strong, nonatomic) NSString<Optional> *url;
@property (strong, nonatomic) NSString *httpsProfileImageUrl;
@property (strong, nonatomic) NSString *httpsProfileImageBackgroundUrl;
@property (strong, nonatomic) NSArray<STCUrl, Optional> *userUrlList;

@property (assign, nonatomic) BOOL isFollowing;
@property (assign, nonatomic) BOOL isFollowRequestSent;

@property (assign, nonatomic) NSInteger followersCount;
@property (assign, nonatomic) NSInteger friendsCount;
@property (assign, nonatomic) NSInteger favouritesCount;

@property (assign, nonatomic) BOOL isVerified;
@property (assign, nonatomic) BOOL isProfileUseBackgroundImage;

@end
