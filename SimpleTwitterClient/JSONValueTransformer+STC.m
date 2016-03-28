//
//  JSONValueTransformer+STC.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 17.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "JSONValueTransformer+STC.h"

@implementation JSONValueTransformer (STC)

- (NSDate *)NSDateFromNSString:(NSString *)dateString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    return [formatter dateFromString:dateString];
}

- (NSString *)JSONObjectFromNSDate:(NSDate *)date {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    return [formatter stringFromDate:date];
}

@end
