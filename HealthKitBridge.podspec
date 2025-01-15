Pod::Spec.new do |s|
  s.name             = 'HealthKitBridge'
  s.version          = '0.1.1'
  s.summary          = 'Pryv bridge for iOS HealthKit'

  s.description      = <<-DESC
  An SDK to translate data from HealthKit to Pryv.io streams and vice-versa. 
                       DESC

  s.homepage         = 'https://github.com/pryv/ios-healthkit-bridge'
  s.license      = { :type => 'Revised BSD license', :file => 'LICENSE' }
  s.authors      = { 'Pryv SA (Switzerland)' => 'http://pryv.com' }
  s.source           = { :git => 'https://github.com/pryv/ios-healthkit-bridge.git', :branch => "master" }

  s.ios.deployment_target = '10.0'

  s.source_files = 'HealthKitBridge/**/*'
  s.exclude_files = "HealthKitBridge/*.plist"
  
  s.dependency 'PryvSwiftKit'
end
