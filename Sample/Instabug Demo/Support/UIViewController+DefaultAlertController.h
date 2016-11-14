//
//  UIViewController+DefaultAlertController.h
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DefaultAlertController)

- (void)ibg_showAlertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                                 actions:(NSArray<UIAlertAction *> *)actions;

@end
