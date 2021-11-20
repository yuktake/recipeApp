// swiftlint:disable all
import Amplify
import Foundation

public struct Fav: Model {
  public let id: String
  public var userID: String
  public var recipeID: String
  public var type: String
  public var createdAt: String?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      userID: String,
      recipeID: String,
      type: String,
      createdAt: String? = nil) {
    self.init(id: id,
      userID: userID,
      recipeID: recipeID,
      type: type,
      createdAt: createdAt,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      userID: String,
      recipeID: String,
      type: String,
      createdAt: String? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.userID = userID
      self.recipeID = recipeID
      self.type = type
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}