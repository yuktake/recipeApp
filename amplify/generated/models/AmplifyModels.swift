// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "79a8bf7ae32a919d6cb9488a684b6ce7"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Recipe.self)
    ModelRegistry.register(modelType: Procedure.self)
    ModelRegistry.register(modelType: Review.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Fav.self)
  }
}