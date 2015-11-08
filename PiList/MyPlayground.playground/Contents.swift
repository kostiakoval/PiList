
let arrayPlist = Bundle.plist("Test")!
let p = try! PListParser.parse(arrayPlist)
p.version
p.content

try! PListParser.getElement(p.content)


















