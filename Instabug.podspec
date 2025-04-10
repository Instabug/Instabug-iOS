Pod::Spec.new do |s|
  s.name         = "Instabug"
  s.version      = "15.0.0"
  s.summary      = "Bug reporting for mobile apps. Learn more at http://instabug.com"
  s.homepage     = "http://instabug.com"
  s.license      = { :type => 'Commercial', :file => 'LICENSE.md' }
  s.author       = { "Instabug" => "contactus@instabug.com" }
  s.ios.deployment_target = '13.0'
  s.tvos.deployment_target = '13.0'
  s.source       = { :http => 'https://github.com/Instabug/Instabug-iOS/releases/download/15.0.0/Instabug-XCFramework.zip' }
  s.ios.source_files = 'InstabugSDK.xcframework/ios-arm64/InstabugSDK.framework/Headers/*.{h}'
  s.tvos.source_files = 'InstabugSDK.xcframework/tvos-arm64/InstabugSDK.framework/Headers/*.{h}'
  s.vendored_frameworks = 'InstabugSDK.xcframework'
  s.requires_arc = true
  s.library      = 'z'
  s.xcconfig     =  { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Instabug/"' }
end