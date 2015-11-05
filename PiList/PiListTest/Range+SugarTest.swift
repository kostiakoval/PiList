//
//  Range+SugarTest.swift
//  PiList
//
//  Created by Kostiantyn Koval on 05/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import XCTest

class RangeTest: XCTestCase {

  func testLength() {
    let r0 = (0...0).length
    XCTAssertEqual(r0, 1)

    let r1 = (0...1).length
    XCTAssertEqual(r1, 2)

    let r10 = (4...13).length
    XCTAssertEqual(r10, 10)
  }
}
