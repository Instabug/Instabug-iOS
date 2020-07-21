//
//  IBGTrace.h
//  Instabug
//
//  Created by Yousef Hamza on 4/13/20.
//  Copyright © 2020 Moataz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Trace)
@interface IBGTrace : NSObject

/**
@brief Ends a custom trace.

@discussion If traces is not ended trace will be ignored.
*/
- (void)end;

/**
@brief Set custom attributes per trace.

@param value Trace attribute value.
@param key Trace attribute key.
*/
- (void)setAttributeWithKey:(NSString *)key value:(NSString *_Nullable)value;

- (instancetype)init __attribute__((unavailable("Init not available, use +[IBGTrace startWithName:] instead.")));

@end

NS_ASSUME_NONNULL_END
