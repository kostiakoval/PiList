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
  private struct Key {
    private static let openSign = "<"
    private static let closeSign = ">"
    private static let openClosingToken = "</"
  }

//MARK:- Open Token
  static func openToken(x: String) -> String? {
    return find(x, open: Key.openSign, close: Key.closeSign)
  }

  static func openTokenRange(x: String, token: String) throws -> Range<String.Index> {
    guard let range = findRange(x, open: "<\(token)", close: Key.closeSign) else { throw Error.Error }
    return range
  }

  static func openToken(content: String, token: String) throws -> (content: String, range: Range<String.Index>) {
    let range = try openTokenRange(content, token: token)
    return (content[range], range)
  }

//MARK:- Close Token

  static func closeToken(x: String) -> String? {
    return find(x, open: Key.openClosingToken, close: Key.closeSign)
  }

  static func closeTokenRange(x: String, token: String) throws -> Range<String.Index> {
    guard let range = findRange(x, open: "</\(token)", close: Key.closeSign) else { throw Error.Error }
    return range
  }

  static func closeToken(content: String, token: String) throws -> (content: String, range: Range<String.Index>) {
    let range = try closeTokenRange(content, token: token)
    return (content[range], range)
  }
}

//MARK: - Private
private extension Tokenizer {

  static func find(x: String, open: String, close: String) -> String? {
    let range = findRange(x, open: open, close: close)
    return range.map { x[$0] }
  }

  static func findRange(x: String, open: String, close: String) ->  Range<String.Index>? {

    guard let
      openRange = x.rangeOf(open),
      closeRange = x.rangeOf(close, starFrom: openRange.endIndex) else { return nil }

    return openRange.startIndex..<closeRange.endIndex
  }
}




