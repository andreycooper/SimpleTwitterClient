//
//  STCTwitterService.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 15.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <TwitterKit/TwitterKit.h>
#import <JSONKit.h>

#import "STCTwitterService.h"
#import "STCCoreDataService.h"

#import "STCTweet.h"
#import "STCTweet.h"



NSString *const STCTweetCountKey = @"count";
NSString *const STCMaxTweetIdKey = @"max_id";
NSString *const STCSinceTweetIdKey = @"since_id";


static NSString *const kSTCDefaultTweetsCount = @"20";
static NSString *const kSTCGetMethod = @"GET";

@interface STCTwitterService ()

@end

@implementation STCTwitterService

- (BOOL)isUserLoggedIn {
    return self.userID != nil;
}

- (void)loadTwetsWithDelegate:(id<STCTwitterServiceDelegate>)delegate {
    NSDictionary *params = @{STCTweetCountKey : kSTCDefaultTweetsCount, };
    NSError *clientError;
    
    NSURLRequest *request = [self.twitterApiClient URLRequestWithMethod:kSTCGetMethod URL:self.timelineEndpointUrl parameters:params error:&clientError];
    if (request) {
        [self.twitterApiClient sendTwitterRequest:request completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (data) {
                NSError *jsonError;
                NSArray *timelineTweetList = [STCTweet arrayOfModelsFromData:data error:&jsonError];
                if (jsonError) {
                    NSLog(@"Error while parsing JSON: %@", jsonError);
                }
                
                if (delegate && [delegate respondsToSelector:@selector(twitterService:didLoadTimeLineTweets:)]) {
                    [delegate twitterService:self didLoadTimeLineTweets:timelineTweetList];
                }
            }
            else {
                NSLog(@"Error: %@", connectionError);
            }
        }];
    }
    else {
        NSLog(@"Error: %@", clientError);
    }
}

- (void)loadTweetsWithCompletionBlock:(void (^)(NSArray<STCTweet *> *tweets, NSError *error))completionBlock {
    if (completionBlock == nil) {
        return;
    }
    
    NSDictionary *params = @{STCTweetCountKey : kSTCDefaultTweetsCount, };
    
    [self loadTweetsWithParameters:params completionBlock:completionBlock];
}

- (void)loadTweetsFrom:(NSInteger)maxTweetId count:(NSInteger)count withCompletionBlock:(void (^)(NSArray<STCTweet *> *tweets, NSError *error))completionBlock {
    if (completionBlock == nil) {
        return;
    }
    
    NSDictionary *params = @{STCTweetCountKey : [@(count) stringValue], STCMaxTweetIdKey:[@(maxTweetId) stringValue]};
    
    [self loadTweetsWithParameters:params completionBlock:completionBlock];
}

- (void)loadTweetsWithParameters:(NSDictionary *)parameters completionBlock:(void (^)(NSArray *tweets, NSError *error))completionBlock {
    NSError *clientError;
    NSURLRequest *request = [self.twitterApiClient URLRequestWithMethod:kSTCGetMethod URL:self.timelineEndpointUrl parameters:parameters error:&clientError];
    if (clientError) {
        NSLog(@"Client error: %@", clientError);
        completionBlock(nil, clientError);
    } else if (request) {
        [self.twitterApiClient sendTwitterRequest:request completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (connectionError) {
                NSLog(@"Connection error: %@", connectionError);
                completionBlock(nil, connectionError);
            } else if (data) {
//                [self parseJSONUsingJSONKitFromData:data];
                NSError *jsonError;
                NSArray *timelineTweetList = [STCTweet arrayOfModelsFromData:data error:&jsonError];
                
                if (jsonError) {
                    NSLog(@"Parsing JSON error: %@", jsonError);
                    completionBlock(nil, jsonError);
                } else if (timelineTweetList) {
                    completionBlock(timelineTweetList, nil);
                }
            }
        }];
    }
}

- (void)parseJSONUsingJSONKitFromData:(NSData *)data {
    JSONDecoder* decoder = [[JSONDecoder alloc]
                            initWithParseOptions:JKParseOptionNone];
    NSArray *listJSON = [decoder objectWithData:data];
    if (listJSON.count > 0) {
        NSLog(@"%@", [listJSON JSONString]);
    }
}

- (void)logTweetList:(NSArray *)tweetList {
    for (STCTweet *tweet in tweetList) {
        NSLog(@"%@", [tweet toJSONString]);
    }
}

@end
