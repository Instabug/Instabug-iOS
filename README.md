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

3. Make sure your project links to the following system frameworks. You can add these under your project's Build Phases tab, under Link Binary With Libraries.
	* AVFoundation.framework
	* CoreGraphics.framework
	* CoreMotion.framework
	* CoreTelephony.framework
	* SystemConfiguration.framework
	* UIKit.framework

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
	Instabug.startWithToken("{{app_token}}", invocationEvent: IBGInvocationEvent.Shake)
	```
	```objective-c
	// Objective-C
	[Instabug startWithToken:@"{{app_token}}" invocationEvent:IBGInvocationEventShake];
	```
	Make sure to replace `{{app_token}}` with your application token. Find it [here](https://instabug.com/app/sdk/).
	
## More

You can also check out our [API Reference](https://instabug.com/public/ios-api-reference/Classes/Instabug.html) for more detailed information about our SDK.
