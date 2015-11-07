//
//  String+Sugar.swift
//  PiList
//
//  Created by Kostiantyn Koval on 05/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

public extension String {

  func rangeOf(x: String) -> Range<Index>? {
    return characters.rangeOf(x.characters)
  }

  public func rangeOf(x: String, starFrom: Index) -> Range<Index>? {
    return characters.rangeOf(x.characters, offset: startIndex.distanceTo(starFrom))
  }

  public func rangeOf(x: String, endAt: Index) -> Range<Index>? {
    let search = characters.prefixUpTo(endAt)
    return search.rangeOf(x.characters)
  }

  public func rangeOf(x: String, inRange: Range<Index>) -> Range<Index>? {
    return characters.rangeOf(x.characters)
  }

  //MARK: -
  public func contains(x: String) -> Bool {
    return rangeOf(x) != nil
  }

  func splitByLines() -> [String] {
    return characters.split("\n").map(String.init)
  }

  var lines: [String] {
    return splitByLines()
  }
}

public extension String.CharacterView {

  func rangeOf(x: String.CharacterView, var offset: Int = 0) -> Range<Index>? {

    guard let first = x.first else { return nil }
    var search = self.suffixFrom(startIndex.advancedBy(offset))

    while !search.isEmpty {

      guard let firtIndex = search.indexOf(first) else { return nil }

      offset += search.startIndex.distanceTo(firtIndex)
      search = search.suffixFrom(firtIndex)

      if search.startsWith(x) {
        let start = startIndex.advancedBy(offset)
        return start..<start.advancedBy(x.count)
      }

      offset++
      search = search.dropFirst()
    }
    return nil
  }
}


let s = "Hello Word"
s.rangeOf("Hello")
s.rangeOf("Word")

s.rangeOf("Hello", endAt: s.endIndex)
s.rangeOf("Hello", endAt: s.startIndex)

let i = s.startIndex.advancedBy(5)
s.rangeOf("Hello", endAt: i)
s.rangeOf("Word", endAt: i)
s.rangeOf("Word", endAt: s.endIndex)