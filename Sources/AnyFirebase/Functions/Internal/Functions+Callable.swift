import FirebaseFunctions
import Foundation

extension Functions {
  func call<T>(
    request: T
  ) async throws -> CallableResult where T: Callable {
    let result = try await httpsCallable(request.name)
      .call()
    return .init(result)
  }
}
