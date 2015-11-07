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

//MARK: - rangeOf: endAt:

  func testRangeOfEndAt () {
    let str = "Hello Word"

    let r0 = str.rangeOf("Hello", endAt: str.startIndex)
    XCTAssertNil(r0)

    let r1 = str.rangeOf("Hello", endAt: str.startIndex.advancedBy(6))
    XCTAssertNotNil(r1)

    let range = str.startIndex...str.startIndex.advancedBy(4)
    let r2 = str.rangeOf("Hello", endAt: str.endIndex)
    XCTAssertEqual(r2, range)

    let i = str.startIndex.advancedBy(5)
    let r3 = str.rangeOf("Hello", endAt: i)
    XCTAssertEqual(r3, range)

    let r4 = str.rangeOf("Word", endAt: i)
    XCTAssertNil(r4)

    let range1 = str.startIndex.advancedBy(6)..<str.startIndex.advancedBy(10)
    let r5 = str.rangeOf("Word", endAt: str.endIndex)
    XCTAssertEqual(r5, range1)
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
