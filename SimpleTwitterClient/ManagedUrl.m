//
//  ManagedUrl.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#import "ManagedUrl.h"
#import "ManagedTweet.h"
#import "ManagedUser.h"

#import "STCUrl.h"

@implementation ManagedUrl

- (void)fillManagedUrlFromJSONModel:(JSONModel *)jsonModel {
    if ([jsonModel isMemberOfClass:[STCUrl class]]) {
        STCUrl *urlEntity = (STCUrl *)jsonModel;
        [self fillManagedUrlFromUrlEntity:urlEntity];
    } else {
        NSDictionary *urlDictionary = [jsonModel toDictionary];
        [self fillManagedUrlFromDictionary:urlDictionary];
    }
}

- (void)fillManagedUrlFromUrlEntity:(STCUrl *)urlEntity {
    if (self) {
        self.url = urlEntity.url;
        self.displayUrl = urlEntity.displayUrl;
        self.expandedUrl = urlEntity.expandedUrl;
    }
}

- (void)fillManagedUrlFromDictionary:(NSDictionary *)urlDictionary {
    NSArray *keys = [urlDictionary allKeys];
    if (self) {
        if ([keys containsObject:STCUrlKey]) {
            self.url = urlDictionary[STCUrlKey];
        }
        if ([keys containsObject:STCDisplayUrlKey]) {
            self.displayUrl = urlDictionary[STCDisplayUrlKey];
        }
        if ([keys containsObject:STCExpandedUrlKey]) {
            self.expandedUrl = urlDictionary[STCExpandedUrlKey];
        }
    }
}

@end
