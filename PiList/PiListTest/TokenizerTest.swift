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

  func testOpenSpecificToken() {

    let token = Tokenizer.openToken("<plist></plist>", token:"plist")
    XCTAssertEqual(token!.content, "<plist>")

    let token1 = Tokenizer.openToken("Some Text <plist>", token:"plist")
    XCTAssertEqual(token1!.content, "<plist>")

    let token2 = Tokenizer.openToken("Some Text plist>", token:"plist")
    XCTAssertNil(token2)

    let token3 = Tokenizer.openToken("<plist><dic>", token:"dic")
    XCTAssertEqual(token3!.content, "<dic>")

    let token4 = Tokenizer.openToken("<plist> <dic/> <array> <integer>0</integer> </array>", token:"integer")
    XCTAssertEqual(token4!.content, "<integer>")

    let str = "<array> <true/> <true/> </array>"
    let token5 = Tokenizer.openToken(str, token:"true")
    XCTAssertEqual(token5!.content, "<true/>")

    let r = str.startIndex.advancedBy(8)...str.startIndex.advancedBy(14)
    XCTAssertEqual(token5!.range, r)
    XCTAssertEqual(str.substringFromIndex(token5!.range.endIndex), " <true/> </array>")
  }

  func testCloseToken() {

    let token = Tokenizer.closeToken("<plist></plist>")
    XCTAssertEqual(token!, "</plist>")

    let token2 = Tokenizer.closeToken("Some Text plist>")
    XCTAssertNil(token2)
  }

  func testCloseSpecificToken() {

    let token = Tokenizer.closeToken("<plist></plist>", token:"plist")
    XCTAssertEqual(token!.content, "</plist>")

    let token1 = Tokenizer.closeToken("Some Text </plist>", token:"plist")
    XCTAssertEqual(token1!.content, "</plist>")

    let token2 = Tokenizer.closeToken("Some Text plist>", token:"plist")
    XCTAssertNil(token2)

    let token3 = Tokenizer.closeToken("</plist></dic>", token:"dic")
    XCTAssertEqual(token3!.content, "</dic>")
  }
}
