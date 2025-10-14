import FirebaseFunctions
import Foundation

public protocol FunctionsProviding {
  associatedtype Target: Callable
  
  var functions: Functions { get }
  var decoder: JSONDecoder { get }
  
  func request(_ target: Target) async throws -> Void
}

extension FunctionsProviding {
  public func request(_ target: Target) async throws -> Void {
    _ = try await functions.call(request: target)
  }
  
  public func request(
    _ target: Target
  ) async throws -> Target.Response where Target.Response: Decodable {
    return try await functions.call(request: target, decoder: decoder)
  }
}

// MARK: - FunctionsProviding+PluginCompatible

extension FunctionsProviding where Self: PluginCompatible {
  public func request(_ target: Target) async throws -> Void {
    willCall(target)
    do {
      let response = try await functions.call(request: target)
      didCall(target, data: response)
    } catch {
      didCatch(target, error: error)
      throw error
    }
  }
  
  public func request(
    _ target: Target
  ) async throws -> Target.Response where Target.Response: Decodable {
    willCall(target)
    do {
      let response = try await functions.call(request: target, decoder: decoder)
      didCall(target, data: response)
      return response
    } catch {
      didCatch(target, error: error)
      throw error
    }
  }
}
