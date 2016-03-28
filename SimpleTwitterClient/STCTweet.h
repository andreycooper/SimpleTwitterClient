//
//  STCTimelineTweet.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 14.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

#import "STCRuntimeEntity.h"
#import "STCUrl.h"
#import "STCMedia.h"

@class STCUser;

extern NSString *const STCRetweetedStatusKey;

extern NSString *const STCTweetTextKey;
extern NSString *const STCRetweetCountKey;
extern NSString *const STCFavoriteCountKey;
extern NSString *const STCIsQuoteStatusKey;
extern NSString *const STCIsRetweetedKey;
extern NSString *const STCIsFavoritedKey;
extern NSString *const STCURLsPathKey;
extern NSString *const STCHashtagsPathKey;
extern NSString *const STCUserKey;

@protocol STCTweet
@end

@interface STCTweet : STCRuntimeEntity

@property (strong, nonatomic) STCTweet<STCTweet, Optional> *retweetedTweet;

@property (assign, nonatomic) NSInteger tweetId;
@property (strong, nonatomic) NSString *lang;
@property (strong, nonatomic) NSDate *createdDate;

@property (strong, nonatomic) NSString *text;

@property (assign, nonatomic) NSInteger retweetCount;
@property (assign, nonatomic) NSInteger favoriteCount;

@property (assign, nonatomic) BOOL isQuoteStatus;
@property (assign, nonatomic) BOOL isRetweeted;
@property (assign, nonatomic) BOOL isFavorited;

@property (strong, nonatomic) NSArray<STCMedia, Optional> *mediaList;
@property (strong, nonatomic) NSArray<STCUrl, Optional> *urlList;
@property (strong, nonatomic) NSArray<NSString *> *hashtagList;

@property (strong, nonatomic) STCUser *user;

@end
