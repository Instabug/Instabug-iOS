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
typedef enum IBGInvocationEvent {
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
} IBGInvocationEvent;

/**
 *  The capture source for capturing the screenshot
 */
typedef enum IBGCaptureSource {
    IBGCaptureSourceUIKit,
    IBGCaptureSourceOpenGL
} IBGCaptureSource;

/**
 *  The color theme of the different UI elements
 */
typedef enum IBGColorTheme {
    IBGColorThemeBlack,
    IBGColorThemeGrey,
    IBGColorThemeOrange,
    IBGColorThemeRed,
    IBGColorThemeNavy,
    IBGColorThemeGreen,
    IBGColorThemeCyan,
    IBGColorThemeBlue
} IBGColorTheme;

/**
 *  The mode used upon invocating the SDK
 */
typedef enum IBGInvocationMode {
    IBGInvocationModeNA,
    IBGInvocationModeBugReporter,
    IBGInvocationModeFeedbackSender
} IBGInvocationMode;

/**
 *  The supported locales
 */
typedef enum IBGLocale {
    IBGLocaleArabic,
    IBGLocaleChineseSimplified,
    IBGLocaleChineseTraditional,
    IBGLocaleEnglish,
    IBGLocaleFinnish,
    IBGLocaleFrench,
    IBGLocaleGerman,
    IBGLocaleItalian,
    IBGLocaleJapanese,
    IBGLocaleKorean,
    IBGLocalePolish,
    IBGLocalePortuguese,
    IBGLocalePortugueseBrazil,
    IBGLocaleRussian,
    IBGLocaleSlovenian,
    IBGLocaleSpanish,
    IBGLocaleSwedish,
    IBGLocaleTurkish
} IBGLocale;
//===========================================================================================================================================
