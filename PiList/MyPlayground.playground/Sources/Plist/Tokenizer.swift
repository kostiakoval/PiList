//
//  Tokenizer.swift
//  PiList
//
//  Created by Kostiantyn Koval on 08/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//-

enum Error: ErrorType {
  case Error
}

struct Tokenizer {
  private static let openSign = "<"
  private static let closeSign = ">"

  static func openToken(x: String) -> String? {

    guard let
      open = x.rangeOf(openSign),
      close = x.rangeOf(closeSign, starFrom: open.endIndex) else { return nil }

    return x[open.startIndex..<close.endIndex]
  }

  //Open Token
  static func getRange(content: String, token: String) throws -> Range<String.Index> {
    let openToken = "<\(token)"

    guard let
      open = content.rangeOf(openToken),
      close = content.rangeOf(closeSign, starFrom: open.endIndex) else { throw Error.Error }

    return open.startIndex..<close.endIndex
  }

  static func getString(content: String, token: String) throws -> String {
    let range = try getRange(content, token: token)
    return content[range]
  }

  static func get(content: String, token: String) throws -> (content: String, range: Range<String.Index>) {
    let range = try getRange(content, token: token)
    return (content[range], range)
  }
}
