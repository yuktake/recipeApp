// swiftlint:disable all
import Amplify
import Foundation

public struct Fav: Model {
  public let id: String
  public var userID: String
  public var recipeID: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      userID: String,
      recipeID: String) {
    self.init(id: id,
      userID: userID,
      recipeID: recipeID,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      userID: String,
      recipeID: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.userID = userID
      self.recipeID = recipeID
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}