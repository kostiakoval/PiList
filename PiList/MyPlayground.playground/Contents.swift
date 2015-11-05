//: Playground - noun: a place where people can play

import Foundation
// ---- //
extension String {

  func splitByLines() -> [String] {
    return characters.split("\n").map(String.init)
  }

  var lines: [String] {
    return splitByLines()
  }
}

let str = "a\nb\nc"
str.lines

"One line text".lines


//struct PListParser {
//
//  static func parse(content: String) -> PList {
//    let plist = PList(version: 1.0, content: content)
//    return plist
//  }
//}
//
//
//struct PList {
//  let version: Double
//  let content: String
//}
//
//
//struct Tokenizer {
//  let content: String
//
//  func get(token: String) -> String? {
//
//    let open = "<\(token)"
//    let close = ">"
//
//    let range = content.rangeOf(open)
//    let closeRange = content.rangeOf(close)
//    let a = content[range!]
//
//
//    return a
//  }
//}
//
//
//
