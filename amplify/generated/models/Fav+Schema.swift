// swiftlint:disable all
import Amplify
import Foundation

extension Fav {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case userID
    case recipeID
    case type
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let fav = Fav.keys
    
    model.pluralName = "Favs"
    
    model.attributes(
      .index(fields: ["type", "createdAt"], name: "favsByDate")
    )
    
    model.fields(
      .id(),
      .field(fav.userID, is: .required, ofType: .string),
      .field(fav.recipeID, is: .required, ofType: .string),
      .field(fav.type, is: .required, ofType: .string),
      .field(fav.createdAt, is: .optional, ofType: .string),
      .field(fav.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}