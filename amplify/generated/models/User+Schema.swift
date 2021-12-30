// swiftlint:disable all
import Amplify
import Foundation

extension User {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case type
    case name
    case displayName
    case email
    case description
    case favNum
    case reviewNum
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let user = User.keys
    
    model.pluralName = "Users"
    
    model.attributes(
      .index(fields: ["type", "favNum"], name: "usersByFav"),
      .index(fields: ["type", "reviewNum"], name: "usersByReview")
    )
    
    model.fields(
      .id(),
      .field(user.type, is: .required, ofType: .string),
      .field(user.name, is: .required, ofType: .string),
      .field(user.displayName, is: .required, ofType: .string),
      .field(user.email, is: .required, ofType: .string),
      .field(user.description, is: .optional, ofType: .string),
      .field(user.favNum, is: .required, ofType: .int),
      .field(user.reviewNum, is: .required, ofType: .int),
      .field(user.createdAt, is: .optional, ofType: .string),
      .field(user.updatedAt, is: .optional, ofType: .string)
    )
    }
}