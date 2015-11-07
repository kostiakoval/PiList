
// MARK: - String
public extension String {

  public func rangeOf(x: String) -> Range<Index>? {
    return characters.rangeOf(x.characters)
  }

  public func contains(x: String) -> Bool {
    return rangeOf(x) != nil
  }

  public func splitByLines() -> [String] {
    return characters.split("\n").map(String.init)
  }

  public var lines: [String] {
    return splitByLines()
  }
}

public extension String.CharacterView {

  public func rangeOf(x: String.CharacterView) -> Range<Index>? {

    guard let first = x.first else { return nil }
    var offset = 0
    var search = self

    while !search.isEmpty {

      guard let firtIndex = search.indexOf(first) else { return nil }

      offset += search.startIndex.distanceTo(firtIndex)
      search = search.suffixFrom(firtIndex)

      if search.startsWith(x) {
        let start = startIndex.advancedBy(offset)
        return start..<start.advancedBy(x.count)
      }

      offset++
      search = search.dropFirst()
    }
    return nil
  }
  
}
