//
//  STCMediaEntity.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 24.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "STCRuntimeEntity.h"

extern NSString *const STCMediaURLKey;
extern NSString *const STCHttpsMediaURLKey;
extern NSString *const STCMediaTypeKey;

@protocol STCMedia
@end

@interface STCMedia : STCRuntimeEntity

@property (assign, nonatomic) NSUInteger mediaID;

@property (strong, nonatomic) NSString *URL;
@property (strong, nonatomic) NSString *mediaURL;
@property (strong, nonatomic) NSString *httpsMediaURL;

@property (strong, nonatomic) NSString *displayURL;
@property (strong, nonatomic) NSString *mediaType;

@end
