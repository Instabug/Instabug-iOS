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
    // Add your app token below. You can get the token from https://instabug.com/applications/instabug-ios/sdk/
    [Instabug startWithToken:<#Instabug token#> invocationEvent:IBGInvocationEventShake];
    return YES;
}

@end
