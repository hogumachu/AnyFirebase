import FirebaseFunctions
import Foundation

public struct FunctionsProvider<Target: Callable>: FunctionsProviding, PluginCompatible {
  public let functions: Functions
  public let plugins: [any Pluggable]
  public let decoder: JSONDecoder
  
  public init(
    functions: Functions = Functions.functions(),
    plugins: [any Pluggable] = [],
    decoder: JSONDecoder = .init()
  ) {
    self.functions = functions
    self.plugins = plugins
    self.decoder = decoder
  }
}
