//
//  PiListTest.swift
//  PiListTest
//
//  Created by Kostiantyn Koval on 05/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import XCTest

class StringTest: XCTestCase {


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

//MARK: - RangeOf

  func testRangeOfFrom() {
    let str = "Hello Word"

    let r = str.rangeOf("Word")
    let r1 = str.rangeOf("Word", starFrom: str.startIndex.successor())
    XCTAssertTrue(r1 != nil)
    XCTAssertEqual(r, r1)
  }

  func testRangeOfFromNotFound() {
    let str = "Hello Word"
    let r1 = str.rangeOf("Hello", starFrom: str.startIndex.successor())
    XCTAssertTrue(r1 == nil)

    let r2 = str.rangeOf("Word", starFrom: str.startIndex.advancedBy(7))
    XCTAssertTrue(r2 == nil)
  }

//MARK: - Contains

  func testContains() {
    XCTAssertTrue("Hello Word".contains("Hello Word"))
    XCTAssertTrue("Hello Word".contains("Hello"))
    XCTAssertTrue("Hello Word".contains("Word"))

    XCTAssertFalse("Hello Word".contains("1"))
    XCTAssertFalse("Hello Word".contains("H1"))
  }

// Lines

  func testSplitByLines() {
    let text = "One\n" + "Two\n" + "Line 3"
    XCTAssertEqual(text.lines.count, 3)
    XCTAssertEqual(text.lines, ["One", "Two", "Line 3"])

    XCTAssertEqual("One line text".lines, ["One line text"])
  }


  
}
