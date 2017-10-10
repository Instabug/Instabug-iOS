//
//  ViewController.m
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+DefaultAlertController.h"
#import "UIAlertAction+DefaultAction.h"
@import Instabug;

@interface ViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.items = @[
                       @"Show Instabug",
                       @"Invocation event",
                       @"Change theme",
                       @"Invoke with different modes...",
                       @"Set primary color",
                       @"Show intro message",
                       @"Show unread messages count",
                       @"Crash me"
                       ];
    }
    
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellIdentifier"
                                                            forIndexPath:indexPath];
    
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [Instabug invoke];
    } else if (indexPath.row == 1) {
        [self showInvocationEventsActionSheet];
    } else if (indexPath.row == 2) {
        [self showThemesActionSheet];
    } else if (indexPath.row == 3) {
        [self showInvocationModesActionSheet];
    } else if (indexPath.row == 4) {
        [self showPrimaryColorSelectorActionSheet];
    } else if (indexPath.row == 5) {
        [Instabug showIntroMessage];
    } else if (indexPath.row == 6) {
        [self showUnreadMessagesCount];
    } else if (indexPath.row == 7) {
        [self crashMe];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Controller Methods

- (void)showInvocationEventsActionSheet {
    UIAlertAction *shakeAction = [UIAlertAction ibg_actionWithTitle:@"Shake"
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                [Instabug setInvocationEvent:IBGInvocationEventShake];
                                                            }];
    
    UIAlertAction *swipeAction = [UIAlertAction ibg_actionWithTitle:@"Swipe"
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                [Instabug setInvocationEvent:IBGInvocationEventTwoFingersSwipeLeft];
                                                            }];
    
    UIAlertAction *screenshotAction = [UIAlertAction ibg_actionWithTitle:@"Screenshot"
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                     [Instabug setInvocationEvent:IBGInvocationEventScreenshot];
                                                                 }];
    
    UIAlertAction *floatingButtonAction = [UIAlertAction ibg_actionWithTitle:@"Floating button"
                                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                                         [Instabug setInvocationEvent:IBGInvocationEventFloatingButton];
                                                                     }];
    
    [self ibg_showAlertControllerWithTitle:@"Invocation Event"
                                   message:@"Select an invocation event"
                                   actions:@[shakeAction, swipeAction, screenshotAction, floatingButtonAction]];
}

- (void)showThemesActionSheet {
    UIAlertAction *lightAction = [UIAlertAction ibg_actionWithTitle:@"Light"
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                [Instabug setColorTheme:IBGColorThemeLight];
                                                            }];
    
    UIAlertAction *darkAction = [UIAlertAction ibg_actionWithTitle:@"Dark"
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               [Instabug setColorTheme:IBGColorThemeDark];
                                                           }];
    
    [self ibg_showAlertControllerWithTitle:@"Theme"
                                   message:@"Select a theme"
                                   actions:@[lightAction, darkAction]];
}

- (void)showInvocationModesActionSheet {
    UIAlertAction *newBugAction = [UIAlertAction ibg_actionWithTitle:@"New bug"
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 [Instabug invokeWithInvocationMode:IBGInvocationModeNewBug];
                                                             }];
    
    UIAlertAction *newFeedbackAction = [UIAlertAction ibg_actionWithTitle:@"New feedback"
                                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                                      [Instabug invokeWithInvocationMode:IBGInvocationModeNewFeedback];
                                                                  }];
    
    UIAlertAction *newChatAction = [UIAlertAction ibg_actionWithTitle:@"New chat"
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  [Instabug invokeWithInvocationMode:IBGInvocationModeNewChat];
                                                              }];
    
    UIAlertAction *chatsListAction = [UIAlertAction ibg_actionWithTitle:@"Chats list"
                                                                handler:^(UIAlertAction * _Nonnull action) {
                                                                    [Instabug invokeWithInvocationMode:IBGInvocationModeChatsList];
                                                                }];
    
    [self ibg_showAlertControllerWithTitle:@"Invocation Events"
                                   message:@"Select an invocation event"
                                   actions:@[newBugAction, newFeedbackAction, newChatAction, chatsListAction]];
}

- (void)showPrimaryColorSelectorActionSheet {
    UIColor *redColor = [UIColor colorWithRed:250.0f/255.0f green:38.0f/255.0f blue:22.0f/255.0f alpha:1.0f];
    UIColor *greenColor = [UIColor colorWithRed:27.0f/255.0f green:128.0f/255.0f blue:18.0f/255.0f alpha:1.0f];
    UIColor *blueColor = [UIColor colorWithRed:51.0f/255.0f green:87.0f/255.0f blue:245.0f/255.0f alpha:1.0f];
    
    UIAlertAction *redAction = [UIAlertAction ibg_actionWithTitle:@"Red"
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              [Instabug setPrimaryColor:redColor];
                                                          }];
    
    UIAlertAction *greenAction = [UIAlertAction ibg_actionWithTitle:@"Green"
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                [Instabug setPrimaryColor:greenColor];
                                                            }];
    
    UIAlertAction *blueAction = [UIAlertAction ibg_actionWithTitle:@"Blue"
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               [Instabug setPrimaryColor:blueColor];
                                                           }];
    
    [self ibg_showAlertControllerWithTitle:@"Select Primary Color"
                                   message:@"Select a color to set as the primary color of the SDK"
                                   actions:@[redAction, greenAction, blueAction]];
}

- (void)showUnreadMessagesCount {
    NSInteger unreadMessagesCount = [Instabug getUnreadMessagesCount];
    NSString *unreadMessagesCountString = [NSString stringWithFormat:@"You have %ld unread message(s).", (long)unreadMessagesCount];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Unread Messages"
                                                                             message:unreadMessagesCountString
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okayAction = [UIAlertAction actionWithTitle:@"Okay"
                                                         style:UIAlertActionStyleDefault
                                                       handler:nil];
    [alertController addAction:okayAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)crashMe {
    [[[NSArray alloc] init] objectAtIndex:100];
}

@end
