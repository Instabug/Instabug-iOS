/*
 File:       Instabug/Instabug.h

 Contains:   API for using Instabug's SDK.

 Copyright:  (c) 2014 by Instabug, Inc., all rights reserved.

 Version:    2.0
 */

//===========================================================================================================================================
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum IBGInvocationEvent : NSUInteger IBGInvocationEvent;
typedef enum IBGCaptureSource : NSUInteger IBGCaptureSource;
typedef enum IBGColorTheme : NSUInteger IBGColorTheme;
typedef enum IBGLocale : NSUInteger IBGLocale;
//===========================================================================================================================================

@interface Instabug : NSObject

//===========================================================================================================================================
//  The main SDK method that does all the magic. This is the only method that SHOULD be called.
//  Should be called at the end of the method application:didFinishLaunchingWithOptions:
//===========================================================================================================================================
/**
 *  Starts the SDK
 *  @param token           The token that identifies the app, you can find it on your dashboard
 *  @param captureSource   The capture source (UIKit or OpenGL)
 *  @param invocationEvent The event that invocates the feedback form
 */
+ (void)startWithToken:(NSString *)token captureSource:(IBGCaptureSource)captureSource invocationEvent:(IBGInvocationEvent)invocationEvent;
//===========================================================================================================================================

//===========================================================================================================================================
//  SDK pro features
//===========================================================================================================================================
/**
 *  Sets the user data that's attached with each bug report sent. Maximum size of the string is 1000 characters
 *  @param userData
 */
+ (void)setUserData:(NSString *)userData;

/**
 *  Attaches a new copy of this file with each bug report sent with a maximum size of 1 MB. Calling this method several times overrides the file to be attached. The file has to be stored locally at the location provided
 *  @param fileLocation
 */
+ (void)attachFileAtLocation:(NSString *)fileLocation;

/**
 *  Sets the block of code that gets executed just before sending the bug report. Warning: This code block is executed on the main thread, so it might block the UI
 *  @param preSendingBlock
 */
+ (void)setPreSendingBlock:(void (^)())preSendingBlock;

/**
 *  Shows the feedback form instantly, with or without a screenshot
 *  @param withScreenshotAnnotation
 */
+ (void)showFeedbackFormWithScreenshotAnnotation:(BOOL)withScreenshotAnnotation;

/**
 *  Shows the feedback form instantly, with or without a prompt asking users to annotate a screenshot or not
 *  @param withPrompt
 */
+ (void)showFeedbackFormWithPrompt:(BOOL)withPrompt;

/**
 *  Shows the feedback form instantly with default preferences
 */
+ (void)showFeedbackForm;
//===========================================================================================================================================

//===========================================================================================================================================
//  Sets the SDK parameters
//===========================================================================================================================================
/**
 *  Sets the event that invocates the feedback form
 *  Default is set by startWithToken:captureSource:invocationEvent:
 *  @param invocationEvent
 */
+ (void)setInvocationEvent:(IBGInvocationEvent)invocationEvent;

/**
 *  Sets the locale used to display the strings in the correct language
 *  Default is fetched from the device locale
 *  @param locale
 */
+ (void)setLocale:(IBGLocale)locale;

/**
 *  Sets whether to track the user location or not
 *  Default = YES
 *  @param isTrackingLocation
 */
+ (void)setIsTrackingLocation:(BOOL)isTrackingLocation;

/**
 *  Sets whether to track the user's steps while using the app or not
 *  Default = YES
 *  @param isTrackingUserSteps
 */
+ (void)setIsTrackingUserSteps:(BOOL)isTrackingUserSteps;

/**
 *  Set whether to show a prompt before showing the feedback form or not
 *  Default = YES
 *  @param willShowPrompt
 */
+ (void)setWillShowPrompt:(BOOL)willShowPrompt;

/**
 *  Set whether to show a screenshot to be annotated or not
 *  Default = YES
 *  @param willShowScreenshotAnnotation
 */
+ (void)setWillShowScreenshotAnnotation:(BOOL)willShowScreenshotAnnotation;

/**
 *  Sets the default value of whether to ask the user for an email or not
 *  Default = YES
 *  @param willShowEmailField
 */
+ (void)setWillShowEmailField:(BOOL)willShowEmailField;

/**
 *  Sets the value of whether the email field is required or not
 *  Default = YES
 *  @param emailIsRequired
 */
+ (void)setEmailIsRequired:(BOOL)emailIsRequired;

/**
 *  Sets whether the comment field is required or not
 *  Default = NO
 *  @param commentIsRequired
 */
+ (void)setCommentIsRequired:(BOOL)commentIsRequired;

/**
 *  Sets the default value of the email field
 *  Default = @""
 *  @param defaultEmail
 */
+ (void)setDefaultEmail:(NSString *)defaultEmail;

/**
 *  Sets the placeholder text of the email field
 *  Default = @"Enter your email..."
 *  @param emailPlaceholder
 */
+ (void)setEmailPlaceholder:(NSString *)emailPlaceholder;

/**
 *  Sets the placeholder text of the comment field
 *  Default = @"Enter your feedback..."
 *  @param commentPlaceholder
 */
+ (void)setCommentPlaceholder:(NSString *)commentPlaceholder;

/**
 *  Sets the default value of the tutorial alert, that gets shown on launching the first bug report
 *  Default = YES
 *  @param willShowTutorialAlert
 */
+ (void)setWillShowTutorialAlert:(BOOL)willShowTutorialAlert;

/**
 *  Sets the default value of the start alert, that gets shown on launching the app
 *  Default = YES
 *  @param willShowStartAlert
 */
+ (void)setWillShowStartAlert:(BOOL)willShowStartAlert;

/**
 *  Sets the default value of the feedback sent alert, that gets shown after sending a feedback
 *  Default = YES
 *  @param willShowFeedbackSentAlert
 */
+ (void)setWillShowFeedbackSentAlert:(BOOL)willShowFeedbackSentAlert;

/**
 *  Sets the threshold value of the shake gesture on iPhone/iPod Touch
 *  Default = 2.5
 *  @param iPhoneShakingThreshold
 */
+ (void)setiPhoneShakingThreshold:(double)iPhoneShakingThreshold;

/**
 *  Sets the threshold value of the shake gesture on iPad
 *  Default = 0.6
 *  @param iPadShakingThreshold
 */
+ (void)setiPadShakingThreshold:(double)iPadShakingThreshold;
//===========================================================================================================================================

//===========================================================================================================================================
//  Sets the design customizations
//===========================================================================================================================================
/**
 *  Sets the color theme of the whole SDK UI, you can use is instead of the other design customization methods
 *  @param colorTheme
 */
+ (void)setColorTheme:(IBGColorTheme)colorTheme;

/**
 *  Sets the header background color
 *  @param color
 */
+ (void)setHeaderColor:(UIColor *)color;

/**
 *  Sets the header font color
 *  @param color
 */
+ (void)setHeaderFontColor:(UIColor *)color;

/**
 *  Sets the buttons background color
 *  @param color
 */
+ (void)setButtonsColor:(UIColor *)color;

/**
 *  Sets the buttons font color
 *  @param color
 */
+ (void)setButtonsFontColor:(UIColor *)color;

/**
 *  Sets the background color of the text area
 *  @param color
 */
+ (void)setTextBackgroundColor:(UIColor *)color;

/**
 *  Sets the email, comment and footer font color
 *  @param color
 */
+ (void)setTextFontColor:(UIColor *)color;

/**
 *  Sets the fore color of the floating button, if the floating button is selected
 *  @param color
 */
+ (void)setFloatingButtonForeColor:(UIColor *)color;

/**
 *  Sets the back color of the floating button, if the floating button is selected
 *  @param color
 */
+ (void)setFloatingButtonBackColor:(UIColor *)color;
//===========================================================================================================================================
@end

//===========================================================================================================================================
//  Enums
//===========================================================================================================================================
/**
 *  The event used to invoke the feedback form
 */
enum IBGInvocationEvent : NSUInteger {
    //  No event will be registered to show the feedback form, you'll need to code your own and call the method showFeedbackForm
    IBGInvocationEventNone = 0,
    //  Shaking the device while in any screen to show the feedback form
    IBGInvocationEventShake = 1 << 0,
    //  Taking a screenshot using the Home+Lock buttons while in any screen to show the feedback form, substituted with IBGInvocationEventShake on iOS 6.1.3 and earlier
    IBGInvocationEventScreenshot = 1 << 1,
    //  Swiping two fingers left while in any screen to show the feedback form
    IBGInvocationEventTwoFingersSwipeLeft = 1 << 2,
    //  Swiping one finger left from the right edge of the screen to show the feedback form, substituted with IBGInvocationEventTwoFingersSwipeLeft on iOS 6.1.3 and earlier
    IBGInvocationEventRightEdgePan = 1 << 3,
    //  Shows a floating button on top of all views, when pressed it takes a screenshot
    IBGInvocationEventFloatingButton = 1 << 4
};

/**
 *  The capture source for capturing the screenshot
 */
enum IBGCaptureSource : NSUInteger {
    IBGCaptureSourceUIKit = 1 << 0,
    IBGCaptureSourceOpenGL = 1 << 1
};

/**
 *  The color theme of the different UI elements
 */
enum IBGColorTheme : NSUInteger {
    IBGColorThemeBlack = 1 << 0,
    IBGColorThemeGrey = 1 << 1,
    IBGColorThemeOrange = 1 << 2,
    IBGColorThemeRed = 1 << 3,
    IBGColorThemeNavy = 1 << 4,
    IBGColorThemeGreen = 1 << 5,
    IBGColorThemeCyan = 1 << 6,
    IBGColorThemeBlue = 1 << 7
};

/**
 *  The supported locales
 */
enum IBGLocale : NSUInteger {
    IBGLocaleArabic = 1 << 0,
    IBGLocaleChineseSimplified = 1 << 1,
    IBGLocaleChineseTraditional = 1 << 2,
    IBGLocaleEnglish = 1 << 3,
    IBGLocaleFrench = 1 << 4,
    IBGLocaleGerman = 1 << 5,
    IBGLocaleItalian = 1 << 6,
    IBGLocaleJapanese = 1 << 7,
    IBGLocaleKorean = 1 << 8,
    IBGLocalePortuguese = 1 << 9,
    IBGLocalePortugueseBrazil = 1 << 10,
    IBGLocaleRussian = 1 << 11,
    IBGLocaleSpanish = 1 << 12,
    IBGLocaleTurkish = 1 << 13
};
//===========================================================================================================================================
