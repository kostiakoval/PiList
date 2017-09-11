//
//  Types.swift
//  PiList
//
//  Created by Kostiantyn Koval on 08/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

public enum ContainerTypeTag: String {
  case Dictionary = "dict"
  case Array = "array"

  static func make(x: String) -> ContainerElementType? {
    guard let type = ContainerTypeTag(rawValue: x) else { return nil }

    let children: [ElementType] = []
    let content = ""

    switch type {
      case Dictionary:
        return ContainerElement(name: "Dictionary", type: Dictionary.self, content: content, children: children)
      case Array:
        return ContainerElement(name: "Array", type: Array.self, content: content, children: children)
    }
  }
}

enum ValueTypeTag: String {
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

//MARK:- 

public protocol ElementType {
  var name: String { get }
  var type: Any { get }
  var content: String { get }
}

public protocol ContainerElementType: ElementType {
  var children: [ElementType] { get }
}

struct Element {
  let name: String
  let type: Any
  let content: String
}

struct ContainerElement: ContainerElementType {
  let name: String
  let type: Any
  let content: String

  let children: [ElementType]
}
