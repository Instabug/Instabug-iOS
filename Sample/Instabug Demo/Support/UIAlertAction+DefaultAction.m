//
//  UIAlertAction+DefaultAction.m
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//

#import "UIAlertAction+DefaultAction.h"

@implementation UIAlertAction (DefaultAction)

+ (instancetype)ibg_actionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
    UIAlertAction *action = [UIAlertAction actionWithTitle:title
                                                     style:UIAlertActionStyleDefault
                                                   handler:handler];
    
    return action;
}

@end
