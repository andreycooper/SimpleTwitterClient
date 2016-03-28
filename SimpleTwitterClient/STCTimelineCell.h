//
//  STCTimeLineTableViewCell.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 14.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STCTweet;

@interface STCTimelineCell : UITableViewCell

- (void)setupWithTimelineTweet:(STCTweet *)tweet;

@end
