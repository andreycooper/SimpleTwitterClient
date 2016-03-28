//
//  STCAppAssembly.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 16.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <TwitterKit/TwitterKit.h>

#import "STCUIAssembly.h"
#import "STCAppDelegate.h"
#import "STCLoginViewController.h"
#import "STCTimelineTableViewController.h"

@implementation STCUIAssembly

- (STCAppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[STCAppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectMethod:@selector(initFabricWithKitList:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:@[[Twitter class]]];
        }];
    }];
}

- (STCLoginViewController *)loginViewController {
    return [TyphoonDefinition withClass:[STCLoginViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(twitterServiceInstance) with:[self.twitterAssembly twitterService]];
    }];
}

- (STCTimelineTableViewController *)timelineTableViewController {
    return [TyphoonDefinition withClass:[STCTimelineTableViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(twitterService) with:[self.twitterAssembly twitterService]];
        [definition injectProperty:@selector(coreDataService) with:[self.coreDataAssembly coreDataService]];
    }];
}

@end
