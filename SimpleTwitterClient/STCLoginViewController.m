//
//  ViewController.m
//  SimpleTwitterClient
//
//  Created by Andrey Bondarenko on 11.03.16.
//  Copyright © 2016 Rus Wizards Group. All rights reserved.
//

#import <TwitterKit/TwitterKit.h>

#import "STCLoginViewController.h"
#import "STCTwitterService.h"

@interface STCLoginViewController ()

@property (weak, nonatomic) IBOutlet TWTRLogInButton *loginButton;

@end

@implementation STCLoginViewController

# pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginButton.hidden = YES;
    
}

- (void)viewDidAppear:(BOOL)animated {
    if ([self.twitterServiceInstance isUserLoggedIn]) {
        [self performSelector:@selector(performTimeLine) withObject:nil afterDelay:1.];
    } else {
        NSLog(@"Unauthorized user");
        self.loginButton.hidden = NO;
    }
}

#pragma mark - Actions

- (IBAction)loginButtonPressed:(id)sender {
    [self.twitterServiceInstance.twitterInstance logInWithCompletion:^
     (TWTRSession *session, NSError *error) {
         if (session) {
             [self performSegueWithIdentifier:@"SCTHomeSegue" sender:self];
         } else {
             NSLog(@"Error: %@", error.localizedDescription);
         }
     }];
}

#pragma mark - 

- (void)performTimeLine {
    [self performSegueWithIdentifier:@"SCTHomeSegue" sender:self];
}

@end
