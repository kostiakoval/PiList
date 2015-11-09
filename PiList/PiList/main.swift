//
//  main.swift
//  PiList
//
//  Created by Kostiantyn Koval on 02/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation

print("Hello PiList")



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

//print(rootPath)
//print(filePath)


// PListParser:- XML
guard let pListContent = try? String(contentsOfURL: filePath) else { exit(0) }
do {

  let plist = try PListParser.parse(pListContent)
  plist.version
  plist.content

  print(try! PListParser.getElement(plist.content))


  print(plist)
} catch _ {
  print("error")
}



