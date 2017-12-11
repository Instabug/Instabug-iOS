Pod::Spec.new do |s|
  s.name         = "Instabug"
  s.version      = "7.4"
  s.summary      = "Bug reporting for mobile apps. Learn more at http://instabug.com"
  s.homepage     = "http://instabug.com"
  s.license      = { :type => 'Commercial', :file => 'LICENSE.md' }
  s.author       = { "Instabug" => "contactus@instabug.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/Instabug/Instabug-iOS.git", :tag => s.version.to_s }
  s.frameworks   = 'AVFoundation', 'CoreGraphics', 'CoreMotion', 'SystemConfiguration', 'CoreTelephony', 'UIKit', 'CoreMedia', 'CoreVideo', 'CoreData'
  s.xcconfig     =  { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Instabug/"' }
  s.requires_arc = true

  s.subspec 'Instabug' do |sp|
    sp.source_files = 'Instabug.framework/Headers/*.{h}'
    sp.vendored_frameworks = 'Instabug.framework'
    sp.preserve_paths =  'Instabug.framework/*'
    sp.dependency 'InstabugCore'
  end

  s.subspec 'InstabugCore' do |sp|
    sp.source_files = 'InstabugCore.framework/Headers/*.{h}'
    sp.vendored_frameworks = 'InstabugCore.framework'
    sp.preserve_paths =  'InstabugCore.framework/*'
    sp.resources = 'InstabugCore.framework/**/*.{sh,png,xib,strings,plist}'
  end
end