//
//  main.swift
//  PiList
//
//  Created by Kostiantyn Koval on 02/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation

print("Hello PiList")

func handleArray(content: [AnyObject]) {
  print(content)
}

func handleDictionary(content: [String : AnyObject]) {
  print(content)

//  let keys = content.keys
//  print(keys)

  let values = content.values
//  print(values)

  for val in values {

    print("val: \(val) type: \(val.dynamicType)")
    switch val {

    case is [AnyObject]: print("Array")
    case is [String : AnyObject]: print("Dictionary")

    case is String: print("String")
    case is NSDate: print("Date")
    case is NSData: print("Data")

    case is Double: print("Double")
    case is Int: print("Int")

    case is Bool: print("Bool")

      default: print("default")
//    case val as Bool: print("Bool")
//    case val as Bool: print("Bool")
    }
  }
}


//MARK:- Main

let arguments = Process.arguments
print(arguments)
print(arguments.count)

if arguments.count == 1 {
  print("Invalid arguemtns list. You must pass a Plist file path")
  exit(0)
}


let arg0 = "/Users/konstantin/My_Projects/MyPods/PiList/PiList"
let arg1 = "Resource/Dictionary.plist"

//let arg0 = arguments[0]
//let arg1 = arguments[1]

let rootPath = NSURL(fileURLWithPath: arg0)
let filePath = rootPath.URLByAppendingPathComponent(arg1)

print(rootPath)
print(filePath)

guard let data = NSData(contentsOfURL: filePath) else { exit(0) }
let doc = try? AEXMLDocument(xmlData: data)
print(doc?.xmlString)


if let plist = NSDictionary(contentsOfURL: filePath) {
  print(plist)
  handleDictionary(plist as! [String : AnyObject])
} else if let plist = NSArray(contentsOfURL: filePath) {
  print("handle Array")
  handleArray(plist as [AnyObject])
  //
} else {
  print("Can't read \(arguments[1]) .plist file")
  exit(0)
}


