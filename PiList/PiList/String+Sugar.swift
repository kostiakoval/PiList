//
//  String+Sugar.swift
//  PiList
//
//  Created by Kostiantyn Koval on 05/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation


// MARK: - String
public extension String {

  func rangeOf(x: String) -> Range<Index>? {
    return characters.rangeOf(x.characters)
  }
}

public extension String.CharacterView {

  func rangeOf(x: String.CharacterView) -> Range<Index>? {

    guard let first = x.first else { return nil }
    var offset = 0
    var search = self

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