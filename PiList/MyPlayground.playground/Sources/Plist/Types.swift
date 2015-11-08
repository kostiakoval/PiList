//
//  Types.swift
//  PiList
//
//  Created by Kostiantyn Koval on 08/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

public enum ContainerType: String {
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


public protocol Element {

  var name: String {get}
  var type: Any {get}
  var content: String {get}
  var children: [Element] {get}
}



