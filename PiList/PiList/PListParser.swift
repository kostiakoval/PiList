//
//  PListParser.swift
//  PiList
//
//  Created by Kostiantyn Koval on 03/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

struct PListParser {

  static func parse(content: String) -> PList {
    let plist = PList(version: 1.0, content: content)
    return plist
  }
}

struct Tokenizer {
  let content: String

  func get(token: String) -> String? {
    content.enumerateLines { line, stop in
    }

    return ""
  }
}
