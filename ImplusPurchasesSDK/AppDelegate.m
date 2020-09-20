//
//  AppDelegate.m
//  ImplusPurchasesSDK
//
//  Created by Vilius Padleckis on 2020-09-16.
//  Copyright © 2020 Implus.co. All rights reserved.
//

#import "AppDelegate.h"
@import ImplusPurchases;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[IMPurchase shared] enableLog: true];
    [[IMPurchase shared] configure:@"eyJhbGciOiJSUzI1NiIsImtpZCI6ImFoYzZ6c3I5azIiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiIwNzEwMzAyNy1mNGYzLTQwM2QtYjBkOC1hNzJhMzkwZTFjNDUiLCJpYXQiOjE1OTkzOTk2OTYsImlzcyI6ImFwcGZsb3cuYWkiLCJzdWIiOiJjMTI3YTEzYy1hZDg2LTQxNjEtYmUwMy0wODkwZmY5MmVjMDciLCJ0eXBlIjoiYXBwIn0.xX0OT2SyJSbRmg4FHKRpmncDJhWQ5bmSsvZZgbdBpM-0z1w2mndwnI3qIcKJTKjf9MtlX16QdVdVgkIWNqb3HSGaSaVQnmhy51ncKl7TUjy9_l5adFo_0FulFGa2Ik2n6abpKr4s_APdb3Qatkcox7Jxmb4Us71cOcWmn7epRgGhIZqrLrnINSOTJlRMgIcIGr8TIWe1ZuT3Bim4pLZgnx5shqYvhn_F-kD4y71-PbX5-WfEFA1tZ5QV5aM25JmXNxyy2RczeB2Y2-1cWmMXwcrY89Xw33XOzhKIw-mdgcLSOQi0R3N8K5bCWLHcw0VAycU0iJwcJXcIEUUs8Vm3jw"];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
