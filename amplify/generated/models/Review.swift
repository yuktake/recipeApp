// swiftlint:disable all
import Amplify
import Foundation

public struct Review: Model {
  public let id: String
  public var user: String
  public var content: String
  public var image: String
  public var recipe: Recipe?
  public var createdAt: String?
  public var updatedAt: String?
  
  public init(id: String = UUID().uuidString,
      user: String,
      content: String,
      image: String,
      recipe: Recipe? = nil,
      createdAt: String? = nil,
      updatedAt: String? = nil) {
      self.id = id
      self.user = user
      self.content = content
      self.image = image
      self.recipe = recipe
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}