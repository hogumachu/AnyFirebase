import FirebaseFunctions
import Foundation

public struct FunctionsProvider<Target: Callable>: FunctionsProviding, PluginCompatible {
  public let functions: Functions
  public let plugins: [any Pluggable]
  
  public init(
    functions: Functions = Functions.functions(),
    plugins: [any Pluggable] = []
  ) {
    self.functions = functions
    self.plugins = plugins
  }
}

extension FunctionsProvider {
  public func request<T>(
    _ target: Target,
    type: T.Type,
    decoder: JSONDecoder = .init()
  ) async throws -> T where T: Decodable {
    return try await request(target)
      .tryMap(T.self, decoder: decoder)
  }
}
