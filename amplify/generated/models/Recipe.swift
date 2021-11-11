// swiftlint:disable all
import Amplify
import Foundation

public struct Recipe: Model {
  public let id: String
  public var user: String
  public var type: String
  public var title: String
  public var protein: Double
  public var fat: Double
  public var carbo: Double
  public var state: Int
  public var materials: String
  public var contents: List<Procedure>?
  public var image: String
  public var reviews: List<Review>?
  public var favNum: Int
  public var createdAt: String?
  public var updatedAt: String?
  public var delFlg: Int
  
  public init(id: String = UUID().uuidString,
      user: String,
      type: String,
      title: String,
      protein: Double,
      fat: Double,
      carbo: Double,
      state: Int,
      materials: String,
      contents: List<Procedure> = [],
      image: String,
      reviews: List<Review>? = [],
      favNum: Int,
      createdAt: String? = nil,
      updatedAt: String? = nil,
      delFlg: Int) {
      self.id = id
      self.user = user
      self.type = type
      self.title = title
      self.protein = protein
      self.fat = fat
      self.carbo = carbo
      self.state = state
      self.materials = materials
      self.contents = contents
      self.image = image
      self.reviews = reviews
      self.favNum = favNum
      self.createdAt = createdAt
      self.updatedAt = updatedAt
      self.delFlg = delFlg
  }
}