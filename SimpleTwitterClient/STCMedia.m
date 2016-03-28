//
//  STCMediaEntity.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 24.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "STCMedia.h"
#import "STCUrl.h"

NSString *const STCMediaURLKey = @"media_url";
NSString *const STCHttpsMediaURLKey = @"media_url_https";
NSString *const STCMediaTypeKey = @"type";

@implementation STCMedia

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{STCIdKey:@"mediaID",
                                                       
                                                       STCUrlKey:@"URL",
                                                       STCMediaURLKey:@"mediaURL",
                                                       STCHttpsMediaURLKey:@"httpsMediaURL",
                                                       
                                                       STCDisplayUrlKey:@"displayURL",
                                                       STCMediaTypeKey:@"mediaType"}];
}

- (NSManagedObject *)mergeWithContext:(NSManagedObjectContext *)context {
    return nil;
}

@end
