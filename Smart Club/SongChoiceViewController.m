//
//  SongChoiceViewController.m
//  Smart Club
//
//  Created by Meg Grasse on 5/24/16.
//  Copyright © 2016 Meg Grasse. All rights reserved.
//

#import "SongChoiceViewController.h"

#import "AppDelegate.h"
#import <EstimoteSDK/EstimoteSDK.h>

@interface SongChoiceViewController () <ESTBeaconManagerDelegate>

@property (nonatomic) AppDelegate *appDelegate;

@end

@implementation SongChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)voteThumbsUp:(UIButton *)sender {
    [_appDelegate sendDataTo:@"upvote"];
 }

- (IBAction)voteThumbsDown:(UIButton *)sender {
    [_appDelegate sendDataTo:@"downvote"];
}

@end
