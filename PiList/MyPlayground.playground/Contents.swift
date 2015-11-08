
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

enum Error: ErrorType {
  case Error
  case InvalidVersion
}


let array = Bundle.plist("Array")!
let p = try! PListParser.parse(array)
p.version
print(p.content)

















