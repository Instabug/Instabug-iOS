Pod::Spec.new do |s|
  s.name         = "Instabug"
  s.version      = "11.9.1"
  s.summary      = "Bug reporting for mobile apps. Learn more at http://instabug.com"
  s.homepage     = "http://instabug.com"
  s.license      = { :type => 'Commercial', :file => 'LICENSE.md' }
  s.author       = { "Instabug" => "contactus@instabug.com" }
  s.ios.platform = '11.0'
  s.tvos.platform = '11.0'
  s.source       = { :http => 'https://github.com/Instabug/Instabug-iOS/releases/download/11.9.1/Instabug-XCFramework.zip' }
  s.library      = 'z'
  s.frameworks   = 'AVFoundation', 'CoreGraphics', 'CoreMotion', 'SystemConfiguration', 'CoreTelephony', 'UIKit', 'CoreMedia', 'CoreVideo', 'CoreData'
  s.xcconfig     =  { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Instabug/"' }
  s.requires_arc = true
  s.ios.source_files = 'Instabug.xcframework/ios-arm64/Instabug.framework/Headers/*.{h}'
  s.tvos.source_files = 'Instabug.xcframework/tvos-arm64/Instabug.framework/Headers/*.{h}'
  s.vendored_frameworks = 'Instabug.xcframework'
end
