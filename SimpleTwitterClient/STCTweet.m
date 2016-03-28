//
//  STCTimelineTweet.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 14.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "STCTweet.h"

NSString *const STCRetweetedStatusKey = @"retweeted_status";

NSString *const STCTweetTextKey = @"text";

NSString *const STCRetweetCountKey = @"retweet_count";
NSString *const STCFavoriteCountKey = @"favorite_count";

NSString *const STCIsQuoteStatusKey = @"is_quote_status";
NSString *const STCIsRetweetedKey = @"retweeted";
NSString *const STCIsFavoritedKey = @"favorited";

NSString *const STCMediaPathKey = @"entities.media";
NSString *const STCURLsPathKey = @"entities.urls";
NSString *const STCHashtagsPathKey = @"entities.hashtags";

NSString *const STCUserKey = @"user";

@interface STCTweet ()

@end

@implementation STCTweet

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{STCRetweetedStatusKey:@"retweetedTweet",
                                                       
                                                       STCIdKey:@"tweetId",
                                                       STCLangKey:@"lang",
                                                       STCCreatedDateKey:@"createdDate",
                                                       
                                                       STCTweetTextKey:@"text",
                                                       
                                                       STCRetweetCountKey:@"retweetCount",
                                                       STCFavoriteCountKey:@"favoriteCount",
                                                       
                                                       STCIsQuoteStatusKey:@"isQuoteStatus",
                                                       STCIsRetweetedKey:@"isRetweeted",
                                                       STCIsFavoritedKey:@"isFavorited",
                                                       
                                                       STCMediaPathKey:@"mediaList",
                                                       STCURLsPathKey:@"urlList",
                                                       STCHashtagsPathKey:@"hashtagList",
                                                       
                                                       STCUserKey:@"user"}];
}

- (NSManagedObject *)mergeWithContext:(NSManagedObjectContext *)context {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}

@end
