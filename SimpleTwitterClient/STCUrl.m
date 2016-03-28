//
//  STCTweetUrl.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 16.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "STCUrl.h"
#import "ManagedUrl.h"

NSString *const STCUrlKey = @"url";
NSString *const STCDisplayUrlKey = @"display_url";
NSString *const STCExpandedUrlKey = @"expanded_url";

@implementation STCUrl

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{STCDisplayUrlKey:@"displayUrl",
                                                       STCUrlKey:@"url",
                                                       STCExpandedUrlKey:@"expandedUrl"}];
}

- (NSManagedObject *)mergeWithContext:(NSManagedObjectContext *)context {
    ManagedUrl *managedUrl;
    
    NSString *className = NSStringFromClass([ManagedUrl class]);
    BOOL isUrlExistInContext = [super isEntityExistWithName:className attribute:@"url" value:self.url inContext:context];
    if (isUrlExistInContext) {
        // TODO: is needed this code?
        managedUrl = (ManagedUrl *)[super managedEntityWithName:className attribute:@"url" value:self.url inContext:context];
    } else {
        managedUrl = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([ManagedUrl class]) inManagedObjectContext:context];
    }
    
    if (managedUrl) {
        [managedUrl fillManagedUrlFromJSONModel:self];
        return managedUrl;
    }
    
    return managedUrl;
}

@end
