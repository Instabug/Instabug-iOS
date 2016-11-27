![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Instabug.svg)
![Twitter](https://img.shields.io/badge/twitter-@Instabug-blue.svg)

Bug Reporting and In-App Chat for Mobile Apps

For more info, visit [Instabug.com](https://www.instabug.com).

## Installation

### CocoaPods

To integrate Instabug into your Xcode project using [CocoaPods](https://cocoapods.org), add it to your `Podfile`:

```ruby
pod 'Instabug'
```

Then, run the following command:

```bash
$ pod install
```

### Manually

1. [Download the Instabug SDK](https://s3.amazonaws.com/instabug-pro/sdk_releases/Instabug.zip)

2. Extract it then drag & drop the Instabug.framework and Instabug.bundle files to your project, and make sure that the "Copy items if needed" checkbox is checked.

### Dynamic Framework

[Instabug Dynamic Framework](https://github.com/Instabug/Instabug-iOS/tree/dynamic_framework)

## Usage

1. Import Instabug framework header in your app delegate

    ```swift
    // Swift
    import Instabug
    ```
    
    ```objective-c
    // Objective-C
    #import <Instabug/Instabug.h>
    ```

2. Add the following to your app delegate's application:didFinishLaunchingWithOptions: method.
	
	```swift
	// Swift
	Instabug.start(withToken: <#app token#>, invocationEvent: .shake)
	```
	```objective-c
	// Objective-C
	[Instabug startWithToken:<#app token#> invocationEvent:IBGInvocationEventShake];
	```
	Make sure to replace `app_token` with your application token. Find it [here](https://instabug.com/app/sdk/).

## Notes
Instabug needs access to the microphone and photo library. Starting from iOS 10, apps that don’t provide a usage description for those 2 permissions would be rejected when submitted to the App Store.

For your app not to be rejected, you’ll need to add the following 2 keys to your app’s info.plist file with text explaining to the user why those permissions are needed:

* `NSMicrophoneUsageDescription`
* `NSPhotoLibraryUsageDescription`

If your app doesn’t already access the microphone or photo library, we recommend using a usage description like:

* "`<app name>` needs access to the microphone to be able to attach voice notes."
* "`<app name>` needs access to your photo library for you to be able to attach images."

**The permission alert for accessing the microphone/photo library will NOT appear unless users attempt to attach a voice note/photo while using Instabug.**
	
## More

You can also check out our [API Reference](https://instabug.com/public/ios-api-reference/Classes/Instabug.html) for more detailed information about our SDK.
