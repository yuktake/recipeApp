// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var type: String
  public var name: String
  public var displayName: String
  public var email: String
  public var description: String?
  public var favNum: Int
  public var reviewNum: Int
  public var createdAt: String?
  public var updatedAt: String?
  
  public init(id: String = UUID().uuidString,
      type: String,
      name: String,
      displayName: String,
      email: String,
      description: String? = nil,
      favNum: Int,
      reviewNum: Int,
      createdAt: String? = nil,
      updatedAt: String? = nil) {
      self.id = id
      self.type = type
      self.name = name
      self.displayName = displayName
      self.email = email
      self.description = description
      self.favNum = favNum
      self.reviewNum = reviewNum
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}