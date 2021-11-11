// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "cd6b1201a6a6a079cfdfd2c1506337bd"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Recipe.self)
    ModelRegistry.register(modelType: Procedure.self)
    ModelRegistry.register(modelType: Review.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Fav.self)
  }
}