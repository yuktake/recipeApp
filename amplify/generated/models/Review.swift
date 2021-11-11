// swiftlint:disable all
import Amplify
import Foundation

public struct Review: Model {
  public let id: String
  public var user: String
  public var content: String
  public var image: String?
  public var recipe: Recipe?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      user: String,
      content: String,
      image: String? = nil,
      recipe: Recipe? = nil) {
    self.init(id: id,
      user: user,
      content: content,
      image: image,
      recipe: recipe,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      user: String,
      content: String,
      image: String? = nil,
      recipe: Recipe? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.user = user
      self.content = content
      self.image = image
      self.recipe = recipe
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}