//
//  STCCoreDataAssembly.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class STCCoreDataService;

@interface STCCoreDataAssembly : TyphoonAssembly

- (STCCoreDataService *)coreDataService;

@end
