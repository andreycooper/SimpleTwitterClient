//
//  STCTwitterAssembly.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 15.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <TwitterKit/TwitterKit.h>

#import "STCTwitterAssembly.h"
#import "STCTwitterService.h"


@implementation STCTwitterAssembly

#pragma mark -

- (NSString *)twitterUserID {
    return [TyphoonDefinition withFactory:[self twitterSession] selector:@selector(userID)];
}

- (TWTRSession *)twitterSession {
    return [TyphoonDefinition withFactory:[self twitterSessionStore] selector:@selector(session)];
}

- (TWTRSessionStore *)twitterSessionStore {
    return  [TyphoonDefinition withFactory:[self twitterInstance] selector:@selector(sessionStore)];
}

- (TWTRAPIClient *)twitterApiClient {
    return [TyphoonDefinition withClass:[TWTRAPIClient class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithUserID:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self twitterUserID]];
        }];
    }];
}

- (Twitter *)twitterInstance {
    return [TyphoonDefinition withClass:[Twitter class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(sharedInstance)];
        definition.scope = TyphoonScopeLazySingleton;
    }];
}

#pragma mark - Injection into next instances

- (STCTwitterService *)twitterService {
    return [TyphoonDefinition withClass:[STCTwitterService class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(twitterInstance) with:[self twitterInstance]];
        [definition injectProperty:@selector(twitterApiClient) with:[self twitterApiClient]];
        [definition injectProperty:@selector(userID) with:[self twitterUserID]];
        [definition injectProperty:@selector(timelineEndpointUrl) with:TyphoonConfig(@"statuses.timeline")];
        [definition injectProperty:@selector(coreDataServiceInstance) with:[self.coreDataAssembly coreDataService]];
    }];
}

@end
