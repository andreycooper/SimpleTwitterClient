//
//  AppDelegate.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 11.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)initFabricWithKitList:(NSArray *)kits;


@end

