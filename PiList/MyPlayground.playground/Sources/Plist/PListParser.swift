//
//  PListParser.swift
//  PiList
//
//  Created by Kostiantyn Koval on 03/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

public struct PListParser {

  public static func parse(content: String) throws -> PList {
    let data = try plistData(content)
    return PList(version: data.version, content: data.content)
  }
}

//MARK:- Private
private extension PListParser {

  static func version(plist: String) throws -> Double  {
    guard let v = plist.rangeOf("version=\"") else { throw Error.Error }

    let r = v.endIndex..<plist.endIndex.advancedBy(-2)
    let version = plist.substringWithRange(r)

    guard let plistVersion = Double(version) else { throw Error.Error }
    return plistVersion
  }

  static func plistData(x: String) throws -> (version: Double, content: String) {
    let openToken = try Tokenizer.get(x, token: "plist")
    let closeToken = try Tokenizer.get(x, token: "/plist")

    let v = try version(openToken.content)

    let range = openToken.range.endIndex..<closeToken.range.startIndex
    return (v, x[range])
  }
}
