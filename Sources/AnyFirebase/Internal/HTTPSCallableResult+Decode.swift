import FirebaseFunctions
import Foundation

extension HTTPSCallableResult {
  func tryMap<T>(
    _ type: T.Type,
    decoder: JSONDecoder
  ) throws -> T where T: Decodable {
    return try decoder.decode(T.self, from: self)
  }
}

extension JSONDecoder {
  func decode<T>(
    _ type: T.Type,
    from result: HTTPSCallableResult
  ) throws -> T where T: Decodable {
    return try decode(
      type,
      from: try JSONSerialization.data(
        withJSONObject: result.data
      )
    )
  }
}
