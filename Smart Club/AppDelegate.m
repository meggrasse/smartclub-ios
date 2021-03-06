//
//  AppDelegate.m
//  Smart Club
//
//  Created by Meg Grasse on 5/17/16.
//  Copyright © 2016 Meg Grasse. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.beaconManager = [ESTBeaconManager new];
    self.beaconManager.delegate = self;
    [self.beaconManager requestAlwaysAuthorization];
    
    // Tracking lemons
    [self.beaconManager startMonitoringForRegion:[[CLBeaconRegion alloc]
                                                  initWithProximityUUID:[[NSUUID alloc]
                                                                         initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"]
                                                  major:16208 minor:60667 identifier:@"4ae37781e64e1168a5caee181d544b36"]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - ESTBeaconManagerDelegate

- (void)beaconManager:(id)manager didEnterRegion:(CLBeaconRegion *)region {
    [self sendDataTo:@"upvote"];
    NSLog(@"upvote");
}

- (void)beaconManager:(id)manager didExitRegion:(CLBeaconRegion *)region {
    [self sendDataTo:@"downvote"];
    NSLog(@"downvote");
}

- (void)sendDataTo:(NSString *)endpoint {
    NSString *url = [@"https://smartclub.herokuapp.com/" stringByAppendingString:endpoint];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    [NSURLSession.sharedSession dataTaskWithRequest:request];
}

@end
