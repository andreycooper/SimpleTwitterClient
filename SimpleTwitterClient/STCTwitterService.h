//
//  STCTwitterService.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 15.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STCCoreDataService.h"

@class Twitter;
@class TWTRAPIClient;

@class STCTweet;

@class STCCoreDataService;
@class STCTwitterService;

extern NSString *const STCTweetCountKey;
extern NSString *const STCMaxTweetIdKey;
extern NSString *const STCSinceTweetIdKey;

@protocol STCTwitterServiceDelegate <NSObject>

- (void)twitterService:(STCTwitterService *)twitterService didLoadTimeLineTweets:(NSArray<STCTweet *> *)tweets;

@end

@interface STCTwitterService : NSObject

@property (strong, nonatomic) Twitter *twitterInstance;
@property (strong, nonatomic) TWTRAPIClient *twitterApiClient;

@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) NSString *timelineEndpointUrl;

@property (strong, nonatomic) STCCoreDataService *coreDataServiceInstance;

- (BOOL)isUserLoggedIn;

- (void)loadTwetsWithDelegate:(id<STCTwitterServiceDelegate>)delegate;
- (void)loadTweetsWithCompletionBlock:(void (^)(NSArray<STCTweet *> *tweets, NSError *error))completionBlock;
- (void)loadTweetsFrom:(NSInteger)maxTweetId count:(NSInteger)count withCompletionBlock:(void (^)(NSArray<STCTweet *> *tweets, NSError *error))completionBlock;

@end
