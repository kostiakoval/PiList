import Foundation

public class Bundle {

  public static func plist(x: String) -> String? {
    let path = NSBundle.mainBundle().bundleURL.URLByAppendingPathComponent("\(x).plist")
    return try? String(contentsOfURL: path)
  }

}
