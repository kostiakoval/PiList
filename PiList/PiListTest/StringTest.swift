//
//  PiListTest.swift
//  PiListTest
//
//  Created by Kostiantyn Koval on 05/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import XCTest

class StringTest: XCTestCase {

  let str = "Hello World"

  var helloRange: Range<String.Index>!
  var worldRange: Range<String.Index>!
  var fullStringRange: Range<String.Index>!

  override func setUp() {
    super.setUp()
    helloRange = str.startIndex...str.startIndex.advancedBy(4)
    worldRange = str.startIndex.advancedBy(6)..<str.endIndex
    fullStringRange = str.startIndex..<str.endIndex
  }

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
    
    let r = str.rangeOf("World", starFrom: str.startIndex.successor())
    XCTAssertEqual(r, worldRange)
  }

  func testRangeOfFromNotFound() {
    let r1 = str.rangeOf("Hello", starFrom: str.startIndex.successor())
    XCTAssertNil(r1)

    let r2 = str.rangeOf("Word", starFrom: str.startIndex.advancedBy(7))
    XCTAssertNil(r2)
  }

//MARK: - rangeOf: endAt:

  func testRangeOfEndAt () {
    let r0 = str.rangeOf("Hello", endAt: str.startIndex)
    XCTAssertNil(r0)

    let r1 = str.rangeOf("Hello", endAt: str.startIndex.advancedBy(6))
    XCTAssertEqual(r1, helloRange)

    let r2 = str.rangeOf("Hello", endAt: str.endIndex)
    XCTAssertEqual(r2, helloRange)

    let i = str.startIndex.advancedBy(5)
    let r3 = str.rangeOf("Hello", endAt: i)
    XCTAssertEqual(r3, helloRange)

    let r4 = str.rangeOf("World", endAt: i)
    XCTAssertNil(r4)

    let r5 = str.rangeOf("World", endAt: str.endIndex)
    XCTAssertEqual(r5, worldRange)
  }

//MARK: -RangeOf inRange

  func testRangeOfInRange() {

    let r = str.rangeOf("Hello", inRange: fullStringRange)
    XCTAssertEqual(r, helloRange)

    let range1 = str.startIndex.successor()..<str.endIndex
    let r1 = str.rangeOf("Hello", inRange: range1)
    XCTAssertNil(r1)

    let range2 = str.startIndex.advancedBy(5)..<str.endIndex
    let r2 = str.rangeOf("World", inRange: range2)
    XCTAssertEqual(r2, worldRange)

    let range3 = str.startIndex.advancedBy(5)..<str.endIndex.predecessor()
    let r3 = str.rangeOf("Word", inRange: range3)
    XCTAssertNil(r3)
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

// Trim  

  func testTrim() {
    XCTAssertEqual(str.trim("H"), "ello World")
    XCTAssertEqual("AsomeA".trim("A"), "some")
    XCTAssertEqual(" some ".trim(" "), "some")
    XCTAssertEqual("some text some text some".trim("some"), " text some text ")
  }

  
  
}
