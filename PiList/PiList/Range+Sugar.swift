//
//  Range+Sugar.swift
//  PiList
//
//  Created by Kostiantyn Koval on 05/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

extension Range {

  var length: Element.Distance {
    return startIndex.distanceTo(endIndex)
  }
}
