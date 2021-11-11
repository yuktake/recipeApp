// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var name: String
  public var displayName: String
  public var email: String
  public var description: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      displayName: String,
      email: String,
      description: String? = nil) {
    self.init(id: id,
      name: name,
      displayName: displayName,
      email: email,
      description: description,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      displayName: String,
      email: String,
      description: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.displayName = displayName
      self.email = email
      self.description = description
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}