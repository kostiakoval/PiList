//
//  PiListTest.swift
//  PiListTest
//
//  Created by Kostiantyn Koval on 05/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import XCTest

class PiListTest: XCTestCase {


  func testEmptyString() {
    XCTAssertTrue("".rangeOf("") == nil)
    XCTAssertTrue("".rangeOf("A") == nil)

  }

  func testSimpleRange() {
    let s = "AB"
    XCTAssertTrue(s.rangeOf("AB") != nil)
    XCTAssertTrue(s.rangeOf("A")  != nil)
    XCTAssertTrue(s.rangeOf("B")  != nil)

    XCTAssertTrue(s.rangeOf("C") == nil)
    XCTAssertTrue(s.rangeOf("") == nil)
  }

  func testComplexRange() {
    let s = "AB CD"
    XCTAssertTrue(s.rangeOf("AB CD") != nil)
    XCTAssertTrue(s.rangeOf("AB C")  != nil)
    XCTAssertTrue(s.rangeOf("CD")    != nil)
    XCTAssertTrue(s.rangeOf("C")     != nil)

    XCTAssertTrue(s.rangeOf("F")  == nil)
    XCTAssertTrue(s.rangeOf("")  == nil)
  }

  func testRangeDuplicates() {
    let s = "AB CD AB ABC"
    guard let abRange = s.rangeOf("AB") else {
      XCTAssert(false); return
    }

    XCTAssertEqual(s.startIndex.distanceTo(abRange.startIndex), 0)
    XCTAssertEqual(abRange.length, 2)
  }

  func testRangeWithSpace() {
    let s = "AB CD AB ABC"
    guard let abRange = s.rangeOf(" AB") else {
      XCTAssert(false); return
    }

    XCTAssertEqual(s.startIndex.distanceTo(abRange.startIndex), 5)
    XCTAssertEqual(abRange.length, 3)
  }

  func testRangeLast() {
    let s = "AB CD AB ABC"
    guard let abRange = s.rangeOf("ABC") else {
      XCTAssert(false); return
    }

    XCTAssertEqual(s.startIndex.distanceTo(abRange.startIndex), 9)
    XCTAssertEqual(abRange.length, 3)
  }

  
}
