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
    // Add your app token below. You can find the token at https://instabug.com/app/sdk/
    [Instabug startWithToken:<#app token#> invocationEvent:IBGInvocationEventShake];
    return YES;
}

@end
