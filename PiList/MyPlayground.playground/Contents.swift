
struct PList {
  let version: Double
  let content: String

  let rootElement: ContainerType

  init(version: Double, content: String) {
    self.version = version
    self.content = content

    //FIXME:
    rootElement = .Array
  }
}

enum ContainerType: String {
  case Dictionary = "dict"
  case Array = "array"
}

enum ValueType: String {
  // Bool
  case BoolTrue = "true"
  case BoolFalse = "false"

  case Data = "data"
  case Date = "date"
  case String = "string"

  //Number
  case Int = "integer"
  case Double = "real"
}

struct Tokenizer {
  private static let closeToken = ">"

  static func get(content: String, token: String) -> String? {
    let openToken = "<\(token)"

    guard let
      open = content.rangeOf(openToken),
      close = content.rangeOf(closeToken) else { return nil }

    open
    close
//    let tokenRange = open.startIndex..<close.startIndex
    let a = content[open]
    return a
  }
}

struct PListParser {

  static func parse(content: String) -> PList {

    // Get <plist> tag and content
    plistData(content)

    let plist = PList(version: 1.0, content: content)
    return plist
  }

  static func plistData(content: String) -> (version: Double, content: String) {
    let plistToken = Tokenizer.get(content, token: "plist")
    return (0, "")
  }
}

let array = Bundle.plist("Array")!
PListParser.parse(array)











