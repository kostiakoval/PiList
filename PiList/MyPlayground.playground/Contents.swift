//: Playground - noun: a place where people can play

struct PListParser {

  static func parse(content: String) -> PList {
    let plist = PList(version: 1.0, content: content)
    return plist
  }
}


struct PList {
  let version: Double
  let content: String
}


struct Tokenizer {
  let content: String

  func get(token: String) -> String? {

    let open = "<\(token)"
    let close = ">"

    let range = content.rangeOf(open)
    let closeRange = content.rangeOf(close)
    let a = content[range!]


    return a
  }
}


// MARK: - String
extension String {

  func rangeOf(x: String) -> Range<Index>? {
    return characters.rangeOf(x.characters)
  }
}

extension String.CharacterView {

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

var str = "<plist lt version=\"1.0\" pl la>"

let r = str.rangeOf("lt")
str[r!]

let r1 = str.rangeOf("la")
str[r1!]

let r2 = str.rangeOf("laasga")

let r3 = str.rangeOf("pl")
str[r3!]

let r4 = "".rangeOf("lt")





