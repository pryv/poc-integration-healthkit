# iOS HealthKit bridge for Pryv.io
![Pryv HealthKit bridge](https://github.com/pryv/bridge-ios-healthkit/workflows/Pryv%20HealthKit%20bridge/badge.svg) [![codecov](https://codecov.io/gh/pryv/bridge-ios-healthkit/branch/master/graph/badge.svg)](https://codecov.io/gh/pryv/bridge-ios-healthkit)

This Swift library completes the [lib-swift](https://github.com/pryv/lib-swift) by providing a bridge between HealthKit data samples and Pryv.io streams. 

## Example

You will find a sample iOS app at [https://github.com/pryv/app-swift-example](https://github.com/pryv/app-swift-example)

## Requirements

iOS 13.0 is required to use this library. 
If you do not have iOS 13.0, you can customize the library and remove HealthKit types not included in your iOS version. 

## Usage

### Table of contents
  
- [Import](#import)
- [Convert HealthKit sample to Pryv event](#convert-healthkit-sample-to-pryv-event)
- [Convert Pryv event to HealthKit sample](#convert-pryv-event-to-healthkit-sample)
- [Background delivery](#background-delivery)

### Import

To install it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/pryv/lib-swift.git'
source 'https://github.com/pryv/ios-healthkit-bridge.git'
source 'https://github.com/CocoaPods/Specs.git'
pod 'PryvApiSwiftKit', :git => 'https://github.com/pryv/ios-healthkit-bridge.git', :branch => 'master'
```
  
### Convert HealthKit sample to Pryv event
  
For [`HKCharacteristicType`](https://developer.apple.com/documentation/healthkit/hkcharacteristictype) samples, use `pryvEvent(of: HKHealthStore)` function: 
  
```swift
let healthKitStream = HealthKitStream(type: HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!)
let event = healthKitStream.pryvEvent(of: HKHealthStore()) 
// handle the event
```
  
For the rest of HealthKit [data types](https://developer.apple.com/documentation/healthkit/data_types), use `pryv(from: HKObjectType)` function: 
```swift
let healthKitStream = HealthKitStream(type: HKObjectType.quantityType(forIdentifier: .bodyMass)!, frequency: .immediate)
let event = healthKitStream.pryvEvent(from: sample) $
// handle the event
```
  
Note that the function `pryvEvent` does not create the event on Pryv.io backend. To do so, use [`lib-swift`](https://github.com/pryv/lib-swift): 
```swift
let apiCall: APICall = ["method": "events.create", "params": event]
connection.api(APICalls: [apiCall]).catch { error in
    // handle error
}
```
  
  **Note**: This library was implemented on July 2020. The data types in HealthKit may be updated and extended. You may want to add extensions to the library to convert the newly added data types to your prefered streams in Pryv.

### Convert Pryv event to HealthKit sample

``` swift
let pryvStream = PryvStream(streamId: "bodyMass", type: "mass/kg")
let sample = pryvStream.healthKitSample(from: 80)
// handle the sample, e.g. store it to HealthKit
```
  
  **Note**: This part of the library is partially implemented, containing only the `height` and `bodyMass` data types in HealthKit. The aim is to give an example on how to proceed to store a Pryv event to iOS Health app.

### Background delivery
  
For the HealthKit [data types](https://developer.apple.com/documentation/healthkit/data_types), excluding `HKCharacteristicType`, you can enable background delivery: 
  
```swift
let healthStore = HKHealthStore()
if HKHealthStore.isHealthDataAvailable() { 
    healthStore.requestAuthorization(toShare: toShare, read: read) { success, error in 
        // handle result
    }
    
    let healthKitStream = HealthKitStream(type: HKObjectType.quantityType(forIdentifier: .bodyMass)!, frequency: .immediate)

    if healthKitStream.needsBackgroundDelivery() {
        healthStore.enableBackgroundDelivery(for: stream.type, frequency: stream.frequency!, withCompletion: { succeeded, error in
            // handle result
        }
    }

    // add observer queries for the changes on HealthKit
}
```


