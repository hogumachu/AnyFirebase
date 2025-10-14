import Foundation

public protocol Pluggable {
  func willCall(_ target: any Callable)
  func didCall(_ target: any Callable, result: CallableResult)
  func didCatch(_ target: any Callable, error: Error)
}

extension Pluggable {
  public func willCall(_ target: any Callable) {}
  public func didCall(_ target: any Callable, result: CallableResult) {}
  public func didCatch(_ target: any Callable, error: Error) {}
}

public protocol PluginCompatible {
  var plugins: [Pluggable] { get }
  
  func willCall(_ target: any Callable)
  func didCall(_ target: any Callable, result: CallableResult)
  func didCatch(_ target: any Callable, error: Error)
}

extension PluginCompatible {
  public func willCall(_ target: any Callable) {
    plugins.forEach {
      $0.willCall(target)
    }
  }
  
  public func didCall(_ target: any Callable, result: CallableResult) {
    plugins.forEach {
      $0.didCall(target, result: result)
    }
  }
  
  public func didCatch(_ target: any Callable, error: Error) {
    plugins.forEach {
      $0.didCatch(target, error: error)
    }
  }
}
