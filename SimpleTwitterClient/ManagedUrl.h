//
//  ManagedUrl.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 21.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ManagedTweet, ManagedUser;
@class JSONModel;

NS_ASSUME_NONNULL_BEGIN

@interface ManagedUrl : NSManagedObject

- (void)fillManagedUrlFromJSONModel:(JSONModel *)jsonModel;

@end

NS_ASSUME_NONNULL_END

#import "ManagedUrl+CoreDataProperties.h"
