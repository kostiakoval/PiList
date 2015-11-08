//
//  TokenizerTest.swift
//  PiList
//
//  Created by Kostiantyn Koval on 08/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import XCTest

class TokenizerTest: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testOpenToken() {

    let token = Tokenizer.openToken("<plist></plist>")
    XCTAssertEqual(token!, "<plist>")

    let token1 = Tokenizer.openToken("Some Text <plist>")
    XCTAssertEqual(token1!, "<plist>")

    let token2 = Tokenizer.openToken("Some Text plist>")
    XCTAssertNil(token2)

    let token3 = Tokenizer.openToken("<plist><dic>")
    XCTAssertEqual(token3!, "<plist>")

//FIXME: - Not working
//    let token4 = Tokenizer.openToken("</plist><dic>")
//    XCTAssertEqual(token4!, "<dic>")
  }

}
