//
//  STCUser.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 16.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "STCUser.h"

NSString *const STCUserNameKey = @"name";
NSString *const STCUserScreenNameKey = @"screen_name";
NSString *const STCUserDescriptionKey = @"description";

NSString *const STCUserUrlKey = @"url";
NSString *const STCHTTPSProfileImageUrlKey = @"profile_image_url_https";
NSString *const STCHTTPSProfileBackgroundImageUrlKey = @"profile_background_image_url_https";
NSString *const STCUserURLsPathKey = @"entities.url.urls";

NSString *const STCIsFollowingKey = @"following";
NSString *const STCIsFollowRequestSentKey =  @"follow_request_sent";

NSString *const STCFollowersCountKey = @"followers_count";
NSString *const STCFriendsCountKey = @"friends_count";
NSString *const STCFavouritesCountKey = @"favourites_count";

NSString *const STCIsUserVerifiedKey = @"verified";
NSString *const STCIsProfileUseBackgroundImageKey = @"profile_use_background_image";

@implementation STCUser

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{STCIdKey:@"userId",
                                                       STCLangKey:@"lang",
                                                       STCCreatedDateKey:@"createdDate",
                                                       
                                                       STCUserNameKey:@"name",
                                                       STCUserScreenNameKey:@"screenName",
                                                       STCUserDescriptionKey:@"userDescription",
                                                       
                                                       STCUserUrlKey:@"url",
                                                       STCHTTPSProfileImageUrlKey:@"httpsProfileImageUrl",
                                                       STCHTTPSProfileBackgroundImageUrlKey:@"httpsProfileImageBackgroundUrl",
                                                       STCUserURLsPathKey:@"userUrlList",
                                                       
                                                       STCIsFollowingKey:@"isFollowing",
                                                       STCIsFollowRequestSentKey:@"isFollowRequestSent",
                                                       
                                                       STCFollowersCountKey:@"followersCount",
                                                       STCFriendsCountKey:@"friendsCount",
                                                       STCFavouritesCountKey:@"favouritesCount",
                                                       
                                                       STCIsUserVerifiedKey:@"isVerified",
                                                       STCIsProfileUseBackgroundImageKey:@"isProfileUseBackgroundImage"}];
}

- (NSManagedObject *)mergeWithContext:(NSManagedObjectContext *)context {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}

@end
