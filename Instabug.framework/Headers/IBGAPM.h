//
//  IBGAPM.h
//  InstabugAPM
//
//  Created by Yousef Hamza on 4/9/20.
//  Copyright © 2020 Moataz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IBGTrace;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(APM)
@interface IBGAPM : NSObject

/**
@brief Acts as master switch for APM.
 
@discussion It’s disabled by default. When disabled, you will not be able to create IBGTrace objects, and app launch traces will not be captured
*/
@property (class, atomic, assign) BOOL enabled;

/**
@brief Acts as master switch for APM.
 
@discussion It’s disabled by default. When disabled, you will not be able to create IBGTrace objects, and app launch traces will not be captured
*/
@property (class, atomic, assign) BOOL appLaunchEnabled;

/**
@brief Start a custom trace.

@discussion Starts a custom trace with speicified name, you can start multiple traces with the same name simultaneously.
 Name of the trace is maximum 150 characters, extra is trimmed. Leading and trailing white spaces are ignored.
 If APM features is not enabled or "name" is empty string this API will return nil.
 This API is thread safe.

@param name name of the custom trace
*/
+ (IBGTrace *_Nullable)startTraceWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
