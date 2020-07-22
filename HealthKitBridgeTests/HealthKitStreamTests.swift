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

    func testDateOfBirth() {
        let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!
        let HKStream = HealthKitStream(type: dateOfBirth)
        
        let (parentId, streamId) = HKStream.pryvStreamId()
        XCTAssertEqual(parentId ?? "", "characteristic")
        XCTAssertEqual(streamId, "dateOfBirth")
        XCTAssertFalse(HKStream.needsBackgroundDelivery())
    }

    func testHeight() {
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

    func testStepCount() {
        let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount)!
        let HKStream = HealthKitStream(type: stepCount, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.count(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: stepCount, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["stepCount"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "count/steps")
    }

    func testPushCount() {
        let pushCount = HKObjectType.quantityType(forIdentifier: .pushCount)!
        let HKStream = HealthKitStream(type: pushCount, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.count(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: pushCount, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["pushCount"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "count/generic")
    }

    func testBasalEnergyBurned() {
        let basalEnergyBurned = HKObjectType.quantityType(forIdentifier: .basalEnergyBurned)!
        let HKStream = HealthKitStream(type: basalEnergyBurned, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: basalEnergyBurned, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["basalEnergyBurned"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "energy/kcal")
    }

    func testDistanceWalkingRunning() {
        let distanceWalkingRunning = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!
        let HKStream = HealthKitStream(type: distanceWalkingRunning, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.meter(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: distanceWalkingRunning, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["distanceWalkingRunning"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "length/m")
    }

    func testAppleExerciseTime() {
        let appleExerciseTime = HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!
        let HKStream = HealthKitStream(type: appleExerciseTime, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.minute(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: appleExerciseTime, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["appleExerciseTime"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "time/min")
    }

    func testBodyMass() {
        let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass)!
        let HKStream = HealthKitStream(type: bodyMass, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.gramUnit(with: .kilo), doubleValue: 180.0)
        let sample = HKQuantitySample(type: bodyMass, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["bodyMass"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "mass/kg")
    }

    func testBodyFatPercentage() {
        let bodyFatPercentage = HKObjectType.quantityType(forIdentifier: .bodyFatPercentage)!
        let HKStream = HealthKitStream(type: bodyFatPercentage, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.percent(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: bodyFatPercentage, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["bodyFatPercentage"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "ratio/percent")
    }

    func testBasalBodyTemperature() {
        let basalBodyTemperature = HKObjectType.quantityType(forIdentifier: .basalBodyTemperature)!
        let HKStream = HealthKitStream(type: basalBodyTemperature, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.degreeCelsius(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: basalBodyTemperature, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["basalBodyTemperature"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "temperature/c")
    }
    
    func testEnvironmentalAudioExposure() {
        let environmentalAudioExposure = HKObjectType.quantityType(forIdentifier: .environmentalAudioExposure)!
        let HKStream = HealthKitStream(type: environmentalAudioExposure, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.decibelAWeightedSoundPressureLevel(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: environmentalAudioExposure, quantity: quantity, start: date.addingTimeInterval(-60*60*24), end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["environmentalAudioExposure"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "pressure/db")
    }
    
    func testRestingHeartRate() {
        let restingHeartRate = HKObjectType.quantityType(forIdentifier: .restingHeartRate)!
        let HKStream = HealthKitStream(type: restingHeartRate, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.count().unitDivided(by: HKUnit.minute()), doubleValue: 180.0)
        let sample = HKQuantitySample(type: restingHeartRate, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["restingHeartRate"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "frequency/bpm")
    }
    
    func testHeartRateVariabilitySDNN() {
        let heartRateVariabilitySDNN = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!
        let HKStream = HealthKitStream(type: heartRateVariabilitySDNN, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.secondUnit(with: .milli), doubleValue: 180.0)
        let sample = HKQuantitySample(type: heartRateVariabilitySDNN, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["heartRateVariabilitySDNN"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "time/ms")
    }
    
    func testBloodPressureSystolic() {
        let bloodPressureSystolic = HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic)!
        let HKStream = HealthKitStream(type: bloodPressureSystolic, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.millimeterOfMercury(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: bloodPressureSystolic, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["bloodPressureSystolic"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "pressure/mmhg")
    }
    
    func testRespiratoryRate() {
        let respiratoryRate = HKObjectType.quantityType(forIdentifier: .respiratoryRate)!
        let HKStream = HealthKitStream(type: respiratoryRate, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.count().unitDivided(by: HKUnit.minute()), doubleValue: 180.0)
        let sample = HKQuantitySample(type: respiratoryRate, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["respiratoryRate"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "frequency/brpm")
    }
    
    func testDietaryFatTotal() {
        let dietaryFatTotal = HKObjectType.quantityType(forIdentifier: .dietaryFatTotal)!
        let HKStream = HealthKitStream(type: dietaryFatTotal, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.gram(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: dietaryFatTotal, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["dietaryFatTotal"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "mass/g")
    }
    
    func testBloodGlucose() {
        let bloodGlucose = HKObjectType.quantityType(forIdentifier: .bloodGlucose)!
        let HKStream = HealthKitStream(type: bloodGlucose, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.moleUnit(withMolarMass: HKUnitMolarMassBloodGlucose).unitDivided(by: HKUnit.liter()), doubleValue: 180.0)
        let sample = HKQuantitySample(type: bloodGlucose, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["bloodGlucose"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "density/mmol-l")
    }
    
    func testElectrodermalActivity() {
        let electrodermalActivity = HKObjectType.quantityType(forIdentifier: .electrodermalActivity)!
        let HKStream = HealthKitStream(type: electrodermalActivity, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.siemenUnit(with: .micro), doubleValue: 180.0)
        let sample = HKQuantitySample(type: electrodermalActivity, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["electrodermalActivity"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "electrical-conductivity/us")
    }
    
    func testForcedVitalCapacity() {
        let forcedVitalCapacity = HKObjectType.quantityType(forIdentifier: .forcedVitalCapacity)!
        let HKStream = HealthKitStream(type: forcedVitalCapacity, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.liter(), doubleValue: 180.0)
        let sample = HKQuantitySample(type: forcedVitalCapacity, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["forcedVitalCapacity"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "volume/l")
    }
    
    func testVo2Max() {
        let vo2Max = HKObjectType.quantityType(forIdentifier: .vo2Max)!
        let HKStream = HealthKitStream(type: vo2Max, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.literUnit(with: .milli).unitDivided(by: HKUnit.gramUnit(with: .kilo).unitMultiplied(by: HKUnit.minute())), doubleValue: 180.0)
        let sample = HKQuantitySample(type: vo2Max, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["vO2Max"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "gas-consumption/mlpkgmin")
    }
    
    func testPeakExpiratoryFlowRate() {
        let peakExpiratoryFlowRate = HKObjectType.quantityType(forIdentifier: .peakExpiratoryFlowRate)!
        let HKStream = HealthKitStream(type: peakExpiratoryFlowRate, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let date = Date()
        let quantity = HKQuantity(unit: HKUnit.liter().unitDivided(by: HKUnit.minute()), doubleValue: 180.0)
        let sample = HKQuantitySample(type: peakExpiratoryFlowRate, quantity: quantity, start: date, end: date)
        let event = HKStream.pryvEvent(from: sample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["peakExpiratoryFlowRate"])
        XCTAssertEqual(event?["content"] as? Double, 180.0)
        XCTAssertEqual(event?["type"] as? String, "speed/lpm")
    }
    
    func testActivitySummary() {
        let activitySummary = HKActivitySummary()
        activitySummary.activeEnergyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: 300.0)
        activitySummary.activeEnergyBurnedGoal = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: 500.0)
        let HKStream = HealthKitStream(type: HKObjectType.activitySummaryType(), frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let event = HKStream.pryvEvent(activity: activitySummary).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["activity"])
        XCTAssertEqual(event?["type"] as? String, "activity/summary")
        
        let content = event?["content"] as? [String: Any]
        
        XCTAssertEqual(content?["activeEnergyBurned"] as? Double, 300.0)
        XCTAssertEqual(content?["activeEnergyBurnedGoal"] as? Double, 500.0)
    }
    
    func testAudiogramSampleType() {
        let sensitivityPoint = try? HKAudiogramSensitivityPoint(frequency: HKQuantity(unit: HKUnit.count().unitDivided(by: HKUnit.minute()), doubleValue: 5.0), leftEarSensitivity: HKQuantity(unit: HKUnit.decibelHearingLevel(), doubleValue: 20.0), rightEarSensitivity: HKQuantity(unit: HKUnit.decibelHearingLevel(), doubleValue: 20.0))
        let sensitivityPoints = sensitivityPoint == nil ? [HKAudiogramSensitivityPoint]() : [sensitivityPoint!]
        let audiogramSample = HKAudiogramSample(sensitivityPoints: sensitivityPoints, start: Date(), end: Date(), metadata: nil)
        let HKStream = HealthKitStream(type: HKObjectType.audiogramSampleType(), frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let event = HKStream.pryvEvent(from: audiogramSample).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["audiogram"])
        XCTAssertEqual(event?["type"] as? String, "audiogram/data")
        
        let content = event?["content"] as? [String: Any]
        let sensitivity = (content?["sensitivityPoints"] as? [[String: Any]])?.first
        
        XCTAssertEqual(sensitivity?["frequency"] as? Double, 5.0)
        XCTAssertEqual(sensitivity?["leftEarSensitivity"] as? Double, 20.0)
        XCTAssertEqual(sensitivity?["rightEarSensitivity"] as? Double, 20.0)
    }
    
    func testWorkout() {
        let workout = HKWorkout(activityType: .americanFootball, start: Date().addingTimeInterval(-60*60), end: Date())
        let HKStream = HealthKitStream(type: HKObjectType.workoutType(), frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let event = HKStream.pryvEvent(from: workout).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["workouts"])
        XCTAssertEqual(event?["type"] as? String, "activity/workout")
        
        let content = event?["content"] as? [String: Any?]
        let duration = content?["duration"] as? Double
        
        XCTAssertNotNil(duration)
        XCTAssertEqual(duration!, 60.0, accuracy: 0.0000001)
    }
    
    func testIntermenstrualBleeding() {
        let type = HKObjectType.categoryType(forIdentifier: .intermenstrualBleeding)!
        let bleeding = HKCategorySample(type: type, value: 0, start: Date(), end: Date())
        let HKStream = HealthKitStream(type: type, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let event = HKStream.pryvEvent(from: bleeding).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["intermenstrualBleeding"])
        XCTAssertEqual(event?["type"] as? String, "boolean/bool")
        
        let content = event?["content"] as? Bool
        XCTAssertNotNil(content)
        XCTAssertTrue(content!)
    }
    
    func testCervicalMucusQuality() {
        let type = HKObjectType.categoryType(forIdentifier: .cervicalMucusQuality)!
        let cervicalMucusQuality = HKCategorySample(type: type, value: 1, start: Date().addingTimeInterval(-60*60*24), end: Date())
        let HKStream = HealthKitStream(type: type, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let event = HKStream.pryvEvent(from: cervicalMucusQuality).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["cervicalMucusQuality"])
        XCTAssertEqual(event?["type"] as? String, "reproductive-health/mucusQuality")
        
        let content = event?["content"] as? String
        XCTAssertNotNil(content)
        XCTAssertEqual("dry", content!)
    }
    
    func testOvulationTestResult() {
        let type = HKObjectType.categoryType(forIdentifier: .ovulationTestResult)!
        let ovulationTestResult = HKCategorySample(type: type, value: 2, start: Date().addingTimeInterval(-60*60*24), end: Date())
        let HKStream = HealthKitStream(type: type, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let event = HKStream.pryvEvent(from: ovulationTestResult).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["ovulationTestResult"])
        XCTAssertEqual(event?["type"] as? String, "reproductive-health/ovulation")
        
        let content = event?["content"] as? String
        XCTAssertNotNil(content)
        XCTAssertEqual("luteinizingHormoneSurge", content!)
    }
    
    func testSleepAnalysis() {
        let type = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
        let sleepAnalysis = HKCategorySample(type: type, value: 2, start: Date().addingTimeInterval(-60*60*24), end: Date())
        let HKStream = HealthKitStream(type: type, frequency: .immediate)
       
        XCTAssertTrue(HKStream.needsBackgroundDelivery())
        
        let event = HKStream.pryvEvent(from: sleepAnalysis).params
        
        XCTAssertEqual(event?["streamIds"] as? [String], ["sleepAnalysis"])
        XCTAssertEqual(event?["type"] as? String, "sleep/analysis")
        
        let content = event?["content"] as? String
        XCTAssertNotNil(content)
        XCTAssertEqual("awake", content!)
    }
}
