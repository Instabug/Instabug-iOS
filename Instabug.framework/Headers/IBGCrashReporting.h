/*
 File:       Instabug/IBGCrashReporting.h
 
 Contains:   API for using Instabug's SDK.
 
 Copyright:  (c) 2013-2019 by Instabug, Inc., all rights reserved.
 
 Version:    10.1
 */

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(CrashReporting)
@interface IBGCrashReporting : NSObject

@property (class, atomic, assign) BOOL enabled;

/**
 @brief Enable/Disable out of memory crash reporting.
 
 Out of memory crash reporting is enabled by default. OOM will be disabled if crash reporting is disabled.
 */
@property (class, atomic, assign) BOOL OOMEnabled;

/**
 @brief Report an exception manually.
 
 @param exception Exception to be reported.
 */
+ (void)reportException:(NSException *)exception;

/**
 @brief Report an error manually.
 
 @param error error to be reported.
 */
+ (void)reportError:(NSError *)error;

@end
