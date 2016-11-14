//
//  UIAlertAction+DefaultAction.h
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertAction (DefaultAction)

+ (instancetype)ibg_actionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;

@end
