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
  private static let closeToken = ">"

  //Open Token
  static func getRange(content: String, token: String) throws -> Range<String.Index> {
    let openToken = "<\(token)"

    guard let
      open = content.rangeOf(openToken),
      close = content.rangeOf(closeToken, starFrom: open.endIndex) else { throw Error.Error }

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
