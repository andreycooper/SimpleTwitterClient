//
//  ViewController.h
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 11.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STCTwitterService;

@interface STCLoginViewController : UIViewController

@property (strong, nonatomic) STCTwitterService *twitterServiceInstance;

@end

