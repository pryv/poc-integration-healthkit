source 'https://github.com/pryv/lib-swift.git'
source 'https://github.com/CocoaPods/Specs.git'

project 'HealthKitBridge.xcodeproj'
target 'HealthKitBridge' do
  use_frameworks!
  pod 'PryvSwiftKit', :git => 'https://github.com/pryv/lib-swift.git', :branch => 'master'
end

target 'HealthKitBridgeTests' do
    use_frameworks!
    pod 'PryvSwiftKit', :git => 'https://github.com/pryv/lib-swift.git', :branch => 'master'
    pod 'HealthKitBridge', :path => './'
end
