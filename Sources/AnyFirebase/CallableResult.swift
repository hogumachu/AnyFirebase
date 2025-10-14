import FirebaseFunctions
import Foundation

public struct CallableResult {
  public let data: Any
  
  public init(_ result: HTTPSCallableResult) {
    self.data = result.data
  }
}

// MARK: - Decode Helper

extension CallableResult {
  public func tryMap<T>(
    _ type: T.Type,
    decoder: JSONDecoder
  ) throws -> T where T: Decodable {
    return try decoder.decode(T.self, from: self)
  }
}

extension JSONDecoder {
  public func decode<T>(
    _ type: T.Type,
    from result: CallableResult
  ) throws -> T where T: Decodable {
    return try decode(
      type,
      from: try JSONSerialization.data(
        withJSONObject: result.data
      )
    )
  }
}
