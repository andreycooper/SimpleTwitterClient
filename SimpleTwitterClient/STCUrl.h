//
//  STCTweetUrl.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 16.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STCRuntimeEntity.h"

@protocol STCUrl
@end

extern NSString *const STCUrlKey;
extern NSString *const STCDisplayUrlKey;
extern NSString *const STCExpandedUrlKey;

@interface STCUrl : STCRuntimeEntity

@property (strong, nonatomic) NSString *displayUrl;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *expandedUrl;

@end
