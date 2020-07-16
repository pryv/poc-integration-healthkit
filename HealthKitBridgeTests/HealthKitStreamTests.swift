//
//  HealthKitStreamTests.swift
//  HealthKitBridgeTests
//
//  Created by Sara Alemanno on 09.07.20.
//  Copyright © 2020 Pryv. All rights reserved.
//

import XCTest
import HealthKit
@testable import HealthKitBridge

@available(iOS 13.0, *)
class HealthKitStreamTests: XCTestCase {

    func testCharacteristicStream() {
        let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!
        let HKStream = HealthKitStream(type: dateOfBirth)
        
        XCTAssertFalse(HKStream.needsBackgroundDelivery())
    }

    func testQuantityStream() {
        let height = HKObjectType.quantityType(forIdentifier: .height)!
        let HKStream = HealthKitStream(type: height, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.meterUnit(with: .centi), doubleValue: 180)
        let sample = HKQuantitySample(type: height, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["height"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "length/cm")
    }

}
