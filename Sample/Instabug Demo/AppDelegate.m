//
//  AppDelegate.m
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//

#import "AppDelegate.h"
@import Instabug;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Add your app token below. You can find the token under the SDK tab in Instabug's dashboard.
    [Instabug startWithToken:<#Instabug token#> invocationEvent:IBGInvocationEventShake];
    return YES;
}

@end
