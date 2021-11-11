// swiftlint:disable all
import Amplify
import Foundation

extension Procedure {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case order
    case content
    case image
    case recipe
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let procedure = Procedure.keys
    
    model.pluralName = "Procedures"
    
    model.attributes(
      .index(fields: ["recipeID", "order"], name: "byProcedure")
    )
    
    model.fields(
      .id(),
      .field(procedure.order, is: .required, ofType: .int),
      .field(procedure.content, is: .required, ofType: .string),
      .field(procedure.image, is: .optional, ofType: .string),
      .belongsTo(procedure.recipe, is: .optional, ofType: Recipe.self, targetName: "recipeID"),
      .field(procedure.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(procedure.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}