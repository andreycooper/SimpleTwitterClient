//
//  STCTwitterAssembly.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 15.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "STCCoreDataAssembly.h"

@class STCTwitterService;

@interface STCTwitterAssembly : TyphoonAssembly

@property (strong, nonatomic) STCCoreDataAssembly *coreDataAssembly;

- (STCTwitterService *)twitterService;

@end
