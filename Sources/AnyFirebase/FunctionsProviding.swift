import FirebaseFunctions
import Foundation

public protocol FunctionsProviding {
  associatedtype Target: Callable
  
  var functions: Functions { get }
  
  func request(_ target: Target) async throws -> CallableResult
}

extension FunctionsProviding {
  public func request(_ target: Target) async throws -> CallableResult {
    return try await functions.call(request: target)
  }
}

// MARK: - FunctionsProviding+PluginCompatible

extension FunctionsProviding where Self: PluginCompatible {
  public func request(_ target: Target) async throws -> CallableResult {
    willCall(target)
    do {
      let result = try await functions.call(request: target)
      didCall(target, result: result)
      return result
    } catch {
      didCatch(target, error: error)
      throw error
    }
  }
}
