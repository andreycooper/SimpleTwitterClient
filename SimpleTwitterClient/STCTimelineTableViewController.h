//
//  STCTimelineTableViewController.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 14.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STCTwitterService;
@class STCCoreDataService;

@interface STCTimelineTableViewController : UIViewController

@property (strong, nonatomic) STCTwitterService *twitterService;
@property (strong, nonatomic) STCCoreDataService *coreDataService;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
