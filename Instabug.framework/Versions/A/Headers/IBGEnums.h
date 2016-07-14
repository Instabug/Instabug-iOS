//
//  IBGEnums.h
//  IBGSDK
//
//  Created by Instabug on 7/21/14.
//  Copyright (c) 2014 Instabug. All rights reserved.
//

//===========================================================================================================================================
//  Enums
//===========================================================================================================================================
/**
 *  The event used to invoke the feedback form
 */
typedef NS_ENUM(NSInteger, IBGInvocationEvent) {
    //  No event will be registered to show the feedback form, you'll need to code your own and call the method showFeedbackForm
    IBGInvocationEventNone,
    //  Shaking the device while in any screen to show the feedback form
    IBGInvocationEventShake,
    //  Taking a screenshot using the Home+Lock buttons while in any screen to show the feedback form, substituted with IBGInvocationEventShake on iOS 6.1.3 and earlier
    IBGInvocationEventScreenshot,
    //  Swiping two fingers left while in any screen to show the feedback form
    IBGInvocationEventTwoFingersSwipeLeft,
    //  Swiping one finger left from the right edge of the screen to show the feedback form, substituted with IBGInvocationEventTwoFingersSwipeLeft on iOS 6.1.3 and earlier
    IBGInvocationEventRightEdgePan,
    //  Shows a floating button on top of all views, when pressed it takes a screenshot
    IBGInvocationEventFloatingButton
};

/**
 *  The color theme of the different UI elements
 */
typedef NS_ENUM(NSInteger, IBGColorTheme) {
    IBGColorThemeLight,
    IBGColorThemeDark
};

/**
 *  The mode used upon invocating the SDK
 */
typedef NS_ENUM(NSInteger, IBGInvocationMode) {
    IBGInvocationModeNA,
    IBGInvocationModeBugReporter,
    IBGInvocationModeFeedbackSender
};

/**
 *  Type of feedback to be submit
 */
typedef NS_ENUM(NSInteger, IBGFeedbackType) {
    IBGFeedbackTypeBug,
    IBGFeedbackTypeFeedback,
    IBGFeedbackTypeCrash
};

/**
 *  State of Issue after SDK dismiss
 */
typedef NS_ENUM(NSInteger, IBGIssueState) {
    // Issue is submitted
    IBGIssueSubmitted,
    // Issue is cancelled
    IBGIssueCancelled,
    // Issue is in progress, adding extra screenshot
    IBGIssueInProgress
};

/**
 *  The supported locales
 */
typedef NS_ENUM(NSInteger, IBGLocale) {
    IBGLocaleArabic,
    IBGLocaleChineseSimplified,
    IBGLocaleChineseTraditional,
    IBGLocaleCzech,
    IBGLocaleDanish,
    IBGLocaleEnglish,
    IBGLocaleFrench,
    IBGLocaleGerman,
    IBGLocaleItalian,
    IBGLocaleJapanese,
    IBGLocaleKorean,
    IBGLocalePolish,
    IBGLocalePortugueseBrazil,
    IBGLocaleRussian,
    IBGLocaleSpanish,
    IBGLocaleSwedish,
    IBGLocaleTurkish
};
//===========================================================================================================================================
