Pod::Spec.new do |s|
  s.name         = "Instabug"
  s.version      = "13.4.1"
  s.summary      = "Bug reporting for mobile apps. Learn more at http://instabug.com"
  s.homepage     = "http://instabug.com"
  s.license      = { :type => 'Commercial', :file => 'LICENSE.md' }
  s.author       = { "Instabug" => "contactus@instabug.com" }
  s.ios.deployment_target = '11.0'
  s.tvos.deployment_target = '11.0'
  s.source       = { :http => 'https://github.com/Instabug/Instabug-iOS/releases/download/13.4.1/Instabug-XCFramework.zip' }
  s.library      = 'z'
  s.xcconfig     =  { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Instabug/"' }
  s.requires_arc = true
  s.ios.source_files = 'Instabug.xcframework/ios-arm64/Instabug.framework/Headers/*.{h}'
  s.tvos.source_files = 'Instabug.xcframework/tvos-arm64/Instabug.framework/Headers/*.{h}'
  s.vendored_frameworks = 'Instabug.xcframework'
end
