//
//  NSDate+Relativity.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 23.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Relativity)

-(NSString *)distanceOfTimeInWordsSinceDate:(NSDate *)aDate;
-(NSString *)distanceOfTimeInWordsToNow;

@end
