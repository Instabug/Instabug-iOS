/*
 File:       Instabug/Instabug.h

 Contains:   API for using Instabug's SDK.

 Copyright:  (c) 2014 by Instabug, Inc., all rights reserved.

 Version:    4.1.7
 */

//===========================================================================================================================================
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IBGEnums.h"
//===========================================================================================================================================

/**
 *  This is the API for using Instabug's SDK, for more details about the SDK integration, please visit http://instabug.com/sdk-integration
 */
@interface Instabug : NSObject

//===========================================================================================================================================
/** @name SDK Initialization */
//===========================================================================================================================================
/**
 *  Starts the SDK
 *
 *  This is the main SDK method that does all the magic. This is the only method that SHOULD be called.
 *  Should be called at the end of the method application:didFinishLaunchingWithOptions:
 *  
 *  @param token           The token that identifies the app, you can find it on your dashboard
 *  @param captureSource   The capture source (UIKit or OpenGL)
 *  @param invocationEvent The event that invocates the feedback form
 */
+ (void)startWithToken:(NSString *)token captureSource:(IBGCaptureSource)captureSource invocationEvent:(IBGInvocationEvent)invocationEvent;
//===========================================================================================================================================

//===========================================================================================================================================
/** @name SDK Pro Features */
//===========================================================================================================================================
/**
 *  Adds custom logs that will be sent with each report
 *
 *  @param format format
 *  @param ...    ...
 */
void IBGLog(NSString *format, ...);

/**
 *  Sets the user data that's attached with each bug report sent. Maximum size of the string is 1000 characters
 *  @param userData userData
 */
+ (void)setUserData:(NSString *)userData;

/**
 *  Attaches a new copy of this file with each bug report sent with a maximum size of 1 MB. Calling this method several times overrides the file to be attached. The file has to be stored locally at the location provided
 *  @param fileLocation fileLocation
 */
+ (void)attachFileAtLocation:(NSString *)fileLocation;

/**
 *  Sets the block of code that gets executed just before sending the bug report. Warning: This code block is executed on the main thread, so it might block the UI
 *  @param preSendingBlock preSendingBlock
 */
+ (void)setPreSendingBlock:(void (^)())preSendingBlock;

/**
 *  Shows the form with the prompt asking whether to report a bug or send feedback
 */
+ (void)invoke;

/**
 *  Shows the bug reporter form with the screenshot to be annotated or add text
 */
+ (void)invokeBugReporter;

/**
 *  Shows the feedback sender form with only the text area
 */
+ (void)invokeFeedbackSender;

/**
 *  Shows the email composer view to send feedback
 */
+ (void)invokeFeedbackSenderViaEmail;

/**
 *  Manually reports a bug without showing any UI elements
 *  @param comment comment(optional)
 *  @param email email(optional)
 *  @param screenshot screenshot(optional)
 */
+ (void)reportBugWithComment:(NSString *)comment email:(NSString *)email screenshot:(UIImage *)screenshot;

/**
 *  Manually send a feedback without showing any UI elements
 *  @param comment comment(optional)
 *  @param email email(optional)
 *  @param screenshot screenshot(optional)
 */
+ (void)sendFeedbackWithComment:(NSString *)comment email:(NSString *)email screenshot:(UIImage *)screenshot;

/**
 *  Manually reports an exception
 *  @param exception exception(required)
 */
+ (void)reportException:(NSException *)exception;

//===========================================================================================================================================

//===========================================================================================================================================
/** @name SDK Functions Customization */
//===========================================================================================================================================
/**
 *  Sets the event that invocates the feedback form
 *
 *  Default is set by startWithToken:captureSource:invocationEvent:
 *  @param invocationEvent invocationEvent
 */
+ (void)setInvocationEvent:(IBGInvocationEvent)invocationEvent;

/**
 *  Sets whether to track the crashes in the app or not
 *
 *  Default = YES
 *  @param isTrackingCrashes isTrackingCrashes
 */
+ (void)setIsTrackingCrashes:(BOOL)isTrackingCrashes;

/**
 *  Sets whether to track the user's steps while using the app or not
 *
 *  Default = YES
 *  @param isTrackingUserSteps isTrackingUserSteps
 */
+ (void)setIsTrackingUserSteps:(BOOL)isTrackingUserSteps;

/**
 *  Sets whether to send the crash report immediately on crash or not. When set to NO, the crash report is sent on the next app launch.
 *
 *  Default = NO
 *  @param sendCrashReportsImmediately sendCrashReportsImmediately
 */
+ (void)setWillSendCrashReportsImmediately:(BOOL)sendCrashReportsImmediately;

/**
 *  Sets the default value of the email field
 *
 *  Default = @""
 *  @param defaultEmail defaultEmail
 */
+ (void)setDefaultEmail:(NSString *)defaultEmail;
//===========================================================================================================================================

//===========================================================================================================================================
/** @name SDK Experience Customization */
//===========================================================================================================================================
/**
 *  Sets the default SDK mode upon invocation
 *
 *  Default = IBGInvocationModeNA
 *  @param invocationMode invocationMode
 */
+ (void)setDefaultInvocationMode:(IBGInvocationMode)invocationMode;

/**
 *  Sets whether to attach a screenshot to crash reports or not
 *
 *  Default = NO
 *  @param willAttachCrashScreenshot willAttachCrashScreenshot
 */
+ (void)setWillAttachCrashScreenshot:(BOOL)willAttachCrashScreenshot;

/**
 *  Sets whether to show a screenshot to be annotated or not
 *
 *  Default = YES for bug reports, NO for feedback reports
 *  @param willShowScreenshotAnnotation willShowScreenshotAnnotation
 */
+ (void)setWillShowScreenshotAnnotation:(BOOL)willShowScreenshotAnnotation;

/**
 *  Sets the default value of whether to ask the user for an email or not
 *
 *  Default = YES
 *  @param willShowEmailField willShowEmailField
 */
+ (void)setWillShowEmailField:(BOOL)willShowEmailField;

/**
 *  Sets the value of whether the email field is required or not
 *
 *  Default = YES
 *  @param emailIsRequired emailIsRequired
 */
+ (void)setEmailIsRequired:(BOOL)emailIsRequired;

/**
 *  Sets whether the comment field is required or not
 *
 *  Default = NO
 *  @param commentIsRequired commentIsRequired
 */
+ (void)setCommentIsRequired:(BOOL)commentIsRequired;

/**
 *  Sets the default value of the tutorial alert, that gets shown on launching the first bug report
 *
 *  Default = YES
 *  @param willShowTutorialAlert willShowTutorialAlert
 */
+ (void)setWillShowTutorialAlert:(BOOL)willShowTutorialAlert;

/**
 *  Sets the default value of the start alert, that gets shown on launching the app
 *
 *  Default = YES
 *  @param willShowStartAlert willShowStartAlert
 */
+ (void)setWillShowStartAlert:(BOOL)willShowStartAlert;

/**
 *  Sets the default value of the feedback sent alert, that gets shown after sending a feedback
 *
 *  Default = YES
 *  @param willShowFeedbackSentAlert willShowFeedbackSentAlert
 */
+ (void)setWillShowFeedbackSentAlert:(BOOL)willShowFeedbackSentAlert;

/**
 *  Sets the default offset of the floating button from the top of the screen. Different orientations are already handled
 *
 *  Default = 50
 *  @param floatingButtonOffsetFromTop floatingButtonOffsetFromTop
 */
+ (void)setFloatingButtonOffsetFromTop:(double)floatingButtonOffsetFromTop;

/**
 *  Sets the default edge at which the floating button will be shown. Use CGRectMaxXEdge(right) or CGRectMinXEdge(left). Different orientations are already handled
 *
 *  Default = CGRectMaxXEdge
 *  @param floatingButtonEdge floatingButtonEdge
 */
+ (void)setFloatingButtonEdge:(CGRectEdge)floatingButtonEdge;

/**
 *  Sets the threshold value of the shake gesture on iPhone/iPod Touch
 *
 *  Default = 2.5
 *  @param iPhoneShakingThreshold iPhoneShakingThreshold
 */
+ (void)setiPhoneShakingThreshold:(double)iPhoneShakingThreshold;

/**
 *  Sets the threshold value of the shake gesture on iPad
 *
 *  Default = 0.6
 *  @param iPadShakingThreshold iPadShakingThreshold
 */
+ (void)setiPadShakingThreshold:(double)iPadShakingThreshold;

/**
 *  Sets the default value of whether to vibrate on invocation or not
 *
 *  Default = YES
 *  @param willVibrateOnInvocation willVibrateOnInvocation
 */
+ (void)setWillVibrateOnInvocation:(BOOL)willVibrateOnInvocation;
//===========================================================================================================================================

//===========================================================================================================================================
/** @name SDK Design Customization */
//===========================================================================================================================================
/**
 *  Sets the color theme of the whole SDK UI, you can use is instead of the other design customization methods
 *
 *  @param colorTheme colorTheme
 */
+ (void)setColorTheme:(IBGColorTheme)colorTheme;

/**
 *  Sets the header background color
 *
 *  @param color color
 */
+ (void)setHeaderColor:(UIColor *)color;

/**
 *  Sets the header font color
 *
 *  @param color color
 */
+ (void)setHeaderFontColor:(UIColor *)color;

/**
 *  Sets the buttons background color
 *
 *  @param color color
 */
+ (void)setButtonsColor:(UIColor *)color;

/**
 *  Sets the buttons font color
 *
 *  @param color color
 */
+ (void)setButtonsFontColor:(UIColor *)color;

/**
 *  Sets the background color of the text area
 *
 *  @param color color
 */
+ (void)setTextBackgroundColor:(UIColor *)color;

/**
 *  Sets the email, comment and footer font color
 *
 *  @param color color
 */
+ (void)setTextFontColor:(UIColor *)color;

/**
 *  Sets the fore color of the floating button, if the floating button is selected
 *
 *  @param color color
 */
+ (void)setFloatingButtonForeColor:(UIColor *)color;

/**
 *  Sets the back color of the floating button, if the floating button is selected
 *
 *  @param color color
 */
+ (void)setFloatingButtonBackColor:(UIColor *)color;

/**
 *  Sets the background color of the cancel button and the text color of the other buttons that are shown in the action sheet
 *
 *  @param color color
 */
+ (void)setPromptPrimaryColor:(UIColor *)color;

/**
 *  Sets the text color of the cancel button and the background color of the other buttons that are shown in the action sheet
 *
 *  @param color color
 */
+ (void)setPromptSecondaryColor:(UIColor *)color;
//===========================================================================================================================================

//===========================================================================================================================================
/** @name SDK Strings Customization */
//===========================================================================================================================================
/**
 *  Sets the locale used to display the strings in the correct language
 *
 *  Default is fetched from the device locale
 *  @param locale locale
 */
+ (void)setLocale:(IBGLocale)locale;

/**
 *  Sets the text displayed in the header and the action sheet representing bug reports
 *
 *  Default = @"Report a bug"
 *  @param bugHeaderText bugHeaderText
 */
+ (void)setBugHeaderText:(NSString *)bugHeaderText;

/**
 *  Sets the text displayed in the header and the action sheet representing feedback reports
 *
 *  Default = @"Send Feedback"
 *  @param feedbackHeaderText feedbackHeaderText
 */
+ (void)setFeedbackHeaderText:(NSString *)feedbackHeaderText;

/**
 *  Sets the placeholder text of the email field
 *
 *  Default = @"Enter your email..."
 *  @param emailPlaceholder emailPlaceholder
 */
+ (void)setEmailPlaceholder:(NSString *)emailPlaceholder;

/**
 *  Sets the placeholder text of the comment field
 *
 *  Default = @"Enter your feedback..."
 *  @param commentPlaceholder commentPlaceholder
 */
+ (void)setCommentPlaceholder:(NSString *)commentPlaceholder;

/**
 *  Sets the text displayed in the alert shown on startup
 *
 *  Default = @"Shake to send feedback"
 *  @param startAlertText startAlertText
 */
+ (void)setStartAlertText:(NSString *)startAlertText;

/**
 *  Sets the text displayed in the alert shown on sending the first report
 *
 *  Default = @"Draw on screenshot then add text"
 *  @param tutorialAlertText tutorialAlertText
 */
+ (void)setTutorialAlertText:(NSString *)tutorialAlertText;

/**
 *  Sets the title displayed in the alert shown after sending reports
 *
 *  Default = @"Feedback Sent"
 *  @param feedbackSentAlertTitle feedbackSentAlertTitle
 */
+ (void)setFeedbackSentAlertTitle:(NSString *)feedbackSentAlertTitle;

/**
 *  Sets the text displayed in the alert shown after sending reports
 *
 *  Default = @"Thank you for helping us improve <App Name>!"
 *  @param feedbackSentAlertText feedbackSentAlertText
 */
+ (void)setFeedbackSentAlertText:(NSString *)feedbackSentAlertText;

/**
 *  Sets the title displayed in the alert shown when an invalid email is entered, and the email field is required
 *
 *  Default = @"Invalid Email"
 *  @param invalidEmailAlertTitle invalidEmailAlertTitle
 */
+ (void)setInvalidEmailAlertTitle:(NSString *)invalidEmailAlertTitle;

/**
 *  Sets the text displayed in the alert shown when an invalid email is entered, and the email field is required
 *
 *  Default = @"Please enter a valid email"
 *  @param invalidEmailAlertText invalidEmailAlertText
 */
+ (void)setInvalidEmailAlertText:(NSString *)invalidEmailAlertText;

/**
 *  Sets the title displayed in the alert shown when no comment is entered, and the comment field is required
 *
 *  Default = @"Invalid Comment"
 *  @param invalidCommentAlertTitle invalidCommentAlertTitle
 */
+ (void)setInvalidCommentAlertTitle:(NSString *)invalidCommentAlertTitle;

/**
 *  Sets the text displayed in the alert shown when no comment is entered, and the comment field is required
 *
 *  Default = @"Please enter a valid comment"
 *  @param invalidCommentAlertText invalidCommentAlertText
 */
+ (void)setInvalidCommentAlertText:(NSString *)invalidCommentAlertText;

/**
 *  Sets the text of the OK button that dismisses alerts
 *
 *  Default = @"OK"
 *  @param okButtonText okButtonText
 */
+ (void)setOkButtonText:(NSString *)okButtonText;

/**
 *  Sets the text of the submit button that sends reports
 *
 *  Default = @"Send"
 *  @param submitButtonText submitButtonText
 */
+ (void)setSubmitButtonText:(NSString *)submitButtonText;

/**
 *  Sets the text of the cancel button that dismisses sending reports
 *
 *  Default = @"Cancel"
 *  @param cancelButtonText cancelButtonText
 */
+ (void)setCancelButtonText:(NSString *)cancelButtonText;
//===========================================================================================================================================
@end
