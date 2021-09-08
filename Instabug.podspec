Pod::Spec.new do |s|
  s.name         = "Instabug"
  s.version      = "10.8.1"
  s.summary      = "Bug reporting for mobile apps. Learn more at http://instabug.com"
  s.homepage     = "http://instabug.com"
  s.license      = { :type => 'Commercial', :file => 'LICENSE.md' }
  s.author       = { "Instabug" => "contactus@instabug.com" }
  s.platform     = :ios, '10.0'
  s.source       = { :http => 'https://ios-releases.instabug.com/release/Instabug/10.8.1/archive.zip' }
  s.library      = 'z'
  s.frameworks   = 'AVFoundation', 'CoreGraphics', 'CoreMotion', 'SystemConfiguration', 'CoreTelephony', 'UIKit', 'CoreMedia', 'CoreVideo', 'CoreData'
  s.xcconfig     =  { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Instabug/"' }
  s.requires_arc = true
  s.source_files = 'Instabug.xcframework/ios-arm64_armv7/Instabug.framework/Headers/*.{h}'
  s.vendored_frameworks = 'Instabug.xcframework'
end
