//
//  UIViewController+DefaultAlertController.m
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//

#import "UIViewController+DefaultAlertController.h"

@implementation UIViewController (DefaultAlertController)

- (void)ibg_showAlertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                                 actions:(NSArray<UIAlertAction *> *)actions {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (UIAlertAction *action in actions) {
        [alertController addAction:action];
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
