//
//  STCTimelineTableViewController.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 14.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <TwitterKit/TwitterKit.h>

#import "STCTweet.h"

#import "STCTwitterService.h"
#import "STCCoreDataService.h"

#import "STCTimelineTableViewController.h"
#import "STCTimelineCell.h"

@interface STCTimelineTableViewController () <STCTwitterServiceDelegate>

@property (strong, nonatomic) NSMutableArray<STCTweet *> *tweetsList;

@end

@implementation STCTimelineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     self.clearsSelectionOnViewWillAppear = NO;
    [self setupTableView];
    
    [self.twitterService loadTweetsWithCompletionBlock:^(NSArray *tweets, NSError *error) {
        if (tweets.count > 0) {
            self.tweetsList = [tweets mutableCopy];
//            for (STCTimelineTweet *tweet in tweets) {
//                if (tweet.urlList.count) {
//                    STCUrlEntity *url = tweet.urlList[0];
//                    NSManagedObjectContext *privateContext = self.coreDataService.privateManagedOnjectContext;
//                    [url mergeWithContext:privateContext];
//                    [self.coreDataService saveContext:privateContext];
//                }
//            }
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetsList.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 300.;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    STCTimelineCell *cell = (STCTimelineCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([STCTimelineCell class]) forIndexPath:indexPath];
    [cell setupWithTimelineTweet:self.tweetsList[indexPath.row]];
    [cell layoutIfNeeded];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if (indexPath.row == self.tweetsList.count - 1) {
        NSUInteger maxID = [self.tweetsList[indexPath.row] tweetId] - 1;
        [self.twitterService loadTweetsFrom:maxID count:10 withCompletionBlock:^(NSArray<STCTweet *> *tweets, NSError *error) {
            if (tweets.count > 0) {
                [self.tweetsList addObjectsFromArray:tweets];
                [self.tableView reloadData];
            } else if (error) {
                NSLog(@"Error when load tweets: %@", error);
            }
        }];
    }
}


#pragma mark - Private methods

/**
 *  Setups tableView for automatic row height
 */
- (void)setupTableView {
    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - STCNetworkServiceDelegate

- (void)twitterService:(STCTwitterService *)twitterService didLoadTimeLineTweets:(NSArray<STCTweet *> *)tweets {
    if (tweets.count > 0) {
        self.tweetsList = [tweets mutableCopy];
        [self.tableView reloadData];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
