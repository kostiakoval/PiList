//
//  Helpers.swift
//  PiList
//
//  Created by Kostiantyn Koval on 08/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation

class Bundle {

  static func plist(x: String) -> String? {
    let path = NSBundle.mainBundle().bundleURL.URLByAppendingPathComponent("\(x).plist")
    return try? String(contentsOfURL: path)
  }
}
