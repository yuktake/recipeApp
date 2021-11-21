// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "75d834a7c788d047599978171c90b447"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Recipe.self)
    ModelRegistry.register(modelType: Procedure.self)
    ModelRegistry.register(modelType: Review.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Fav.self)
  }
}