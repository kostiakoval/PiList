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

  static func openToken(content: String, token: String) -> (content: String, range: Range<String.Index>)? {
    guard let range = openTokenRange(content, token: token) else { return nil }
    return (content[range], range)
  }

  static func openTokenName(x: String) -> String? {
    guard var characters = openToken(x)?.characters else { return nil }
    characters.removeFirst()
    characters.removeLast()

    return String(characters)
  }


//MARK:- Close Token

  static func closeToken(x: String) -> String? {
    return find(x, open: Key.openClosingToken, close: Key.closeSign)
  }

  static func closeToken(content: String, token: String) -> (content: String, range: Range<String.Index>)? {
    guard let range = closeTokenRange(content, token: token) else { return nil }
    return (content[range], range)
  }
}

//MARK: - Private
private extension Tokenizer {

  static func find(x: String, open: String, close: String) -> String? {
    let range = findRange(x, open: open, close: close)
    return range.map { x[$0] }
  }

  static func findRange(x: String, open: String, close: String) -> Range<String.Index>? {

    guard let
      openRange = x.rangeOf(open),
      closeRange = x.rangeOf(close, starFrom: openRange.endIndex) else { return nil }

    return openRange.startIndex..<closeRange.endIndex
  }

//MARK:- Open Token
  private static func openTokenRange(x: String, token: String) -> Range<String.Index>? {
    return findRange(x, open: "<\(token)", close: Key.closeSign)
  }

//MARK:- Close Token
  private static func closeTokenRange(x: String, token: String) -> Range<String.Index>? {
    return findRange(x, open: "</\(token)", close: Key.closeSign)
  }


}




