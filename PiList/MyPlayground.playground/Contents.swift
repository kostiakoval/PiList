
struct PList {
  let version: Double
  let content: String
}


struct PListParser {

  static func parse(content: String) -> PList {
    
    let plist = PList(version: 1.0, content: content)
    return plist
  }
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



