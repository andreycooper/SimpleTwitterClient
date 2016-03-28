//
//  STCTimeLineTableViewCell.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 14.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import "STCTimelineCell.h"
#import "STCTweet.h"
#import "STCUser.h"
#import "STCMedia.h"
#import "NSDate+Relativity.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface STCTimelineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIButton *replyButton;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mediaImage;

@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCountLabel;


@end

@implementation STCTimelineCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupWithTimelineTweet:(STCTweet *)tweet {
    // if tweet is retweeted then load user, text and media from it
    if (tweet.retweetedTweet) {
        [self setupUserFromTweet:tweet.retweetedTweet];
        [self setupTextFromTweet:tweet.retweetedTweet];
        [self setupMediaFromTweet:tweet.retweetedTweet];
    } else {
        [self setupUserFromTweet:tweet];
        [self setupTextFromTweet:tweet];
        [self setupMediaFromTweet:tweet];
    }
    
    self.dateLabel.text = [tweet.createdDate distanceOfTimeInWordsToNow];
    
    if (tweet.retweetCount > 0) {
        self.retweetCountLabel.text = [NSString stringWithFormat:@"%ld", (long)tweet.retweetCount];
    } else {
        self.retweetCountLabel.text = @"";
    }
    
    if (tweet.favoriteCount > 0) {
        self.favoriteCountLabel.text = [NSString stringWithFormat:@"%ld", (long)tweet.favoriteCount];
    } else {
        self.favoriteCountLabel.text = @"";
    }
}

- (void)setupUserFromTweet:(STCTweet *)tweet {
    NSURL *userImageURL = [NSURL URLWithString:[tweet.user.httpsProfileImageUrl stringByReplacingOccurrencesOfString:@"_normal" withString:@"_bigger"]];
    [self.userIcon sd_setImageWithURL:userImageURL];
    
    self.nameLabel.text = tweet.user.name;
    self.usernameLabel.text = [@"@" stringByAppendingString:tweet.user.screenName];
}

- (void)setupTextFromTweet:(STCTweet *)tweet {
    NSString *tweetText;
    if ([self hasTweetPhoto:tweet]) {
        // remove media URL from tweet
        NSUInteger mediaURLIndex = [tweet.text rangeOfString:@"http" options:NSBackwardsSearch].location;
        tweetText = [tweet.text substringToIndex:mediaURLIndex];
    } else {
        tweetText = tweet.text;
    }
    
    self.tweetTextView.textContainerInset = UIEdgeInsetsZero;
    self.tweetTextView.text = tweetText;
}

- (void)setupMediaFromTweet:(STCTweet *)tweet {
    if ([self hasTweetPhoto:tweet]) {
        self.mediaImage.hidden = NO;
        
        NSURL *mediaURL = [NSURL URLWithString:[[tweet.mediaList[0] httpsMediaURL] stringByAppendingString:@":large"]];
        [self.mediaImage sd_setImageWithURL:mediaURL placeholderImage:[UIImage imageNamed:@"image_placeholder_photo"]];
    } else {
        self.mediaImage.hidden = YES;
    }
}

- (BOOL)hasTweetPhoto:(STCTweet *)tweet {
    return tweet.mediaList > 0 && [[tweet.mediaList[0] mediaType] isEqualToString:@"photo"];
}

@end
