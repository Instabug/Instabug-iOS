//
//  UIViewController+Instabug.h
//  InstabugUtilities
//
//  Created by Yousef Hamza on 11/13/18.
//  Copyright © 2018 Moataz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Instabug)

@property (nonatomic, strong) UIViewController *ibg_currentChildViewController;

@property (nonatomic, assign) BOOL ibg_isFinalChildViewController;

@end

NS_ASSUME_NONNULL_END
