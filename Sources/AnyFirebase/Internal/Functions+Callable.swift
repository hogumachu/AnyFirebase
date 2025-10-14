import FirebaseFunctions
import Foundation

extension Functions {
  func call<T>(
    request: T
  ) async throws -> HTTPSCallableResult where T: Callable {
    return try await httpsCallable(request.name)
      .call()
  }
  
  func call<T>(
    request: T,
    decoder: JSONDecoder
  ) async throws -> T.Response where T: Callable, T.Response: Decodable {
    return try await call(request: request)
      .tryMap(T.Response.self, decoder: decoder)
  }
}
