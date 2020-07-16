//
//  PryvStreamTests.swift
//  HealthKitBridgeTests
//
//  Created by Sara Alemanno on 09.07.20.
//  Copyright © 2020 Pryv. All rights reserved.
//

import XCTest
import HealthKit
@testable import HealthKitBridge

class PryvStreamTests: XCTestCase {

    func testWeight() {
        let pryvStream = PryvStream(streamId: "bodyMass", type: "mass/kg")
        let sample = pryvStream.healthKitSample(from: 80)
        
        let date = Date()
        let weight = HKObjectType.quantityType(forIdentifier: .bodyMass)!
        let quantity = HKQuantity(unit: HKUnit.gramUnit(with: .kilo), doubleValue: 80)
        let expectedSample = HKQuantitySample(type: weight, quantity: quantity, start: date, end: date)
        
        let value = (sample as? HKQuantitySample)?.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
        let expectedValue = expectedSample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
        
        XCTAssertEqual(value, expectedValue)
    }

    func testHeight() {
        let pryvStream = PryvStream(streamId: "height", type: "length/cm")
        let sample = pryvStream.healthKitSample(from: 180)
        
        let date = Date()
        let height = HKObjectType.quantityType(forIdentifier: .height)!
        let quantity = HKQuantity(unit: HKUnit.meterUnit(with: .centi), doubleValue: 180)
        let expectedSample = HKQuantitySample(type: height, quantity: quantity, start: date, end: date)
        
        let value = (sample as? HKQuantitySample)?.quantity.doubleValue(for: HKUnit.meterUnit(with: .centi))
        let expectedValue = expectedSample.quantity.doubleValue(for: HKUnit.meterUnit(with: .centi))
        
        XCTAssertEqual(value, expectedValue)
    }

}
