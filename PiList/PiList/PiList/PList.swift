
//
//  struct PList {   let version- Double   let content- String } .swift
//  PiList
//
//  Created by Kostiantyn Koval on 05/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

public struct PList {
  public let version: Double
  public let content: String

  public let rootElement: ContainerType

  public init(version: Double, content: String) {
    self.version = version
    self.content = content

    //FIXME:
    rootElement = .Array
  }
}

