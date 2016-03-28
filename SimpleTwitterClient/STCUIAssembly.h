//
//  STCAppAssembly.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 16.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "STCTwitterAssembly.h"
#import "STCCoreDataService.h"

@class STCAppDelegate;
@class STCLoginViewController;
@class STCTimelineTableViewController;

@interface STCUIAssembly : TyphoonAssembly

@property (strong, nonatomic) STCTwitterAssembly *twitterAssembly;
@property (strong, nonatomic) STCCoreDataAssembly *coreDataAssembly;

- (STCAppDelegate *)appDelegate;
- (STCLoginViewController *)loginViewController;
- (STCTimelineTableViewController *)timelineTableViewController;

@end
