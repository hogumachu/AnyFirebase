import Foundation

public protocol Callable {
  var name: String { get }
  associatedtype Response
}

extension Callable {
  public typealias Response = Void
}
