//
//  UtilsTests.swift
//  HealthKitBridgeTests
//
//  Created by Sara Alemanno on 22.07.20.
//  Copyright © 2020 Pryv. All rights reserved.
//

import XCTest
@testable import HealthKitBridge

class UtilsTests: XCTestCase {

    func testLowercased() {
        let str = "TESTSTRING"
        let res = str.lowercasedFirstLetter()
        XCTAssertEqual(res, "tESTSTRING")
    }

}
