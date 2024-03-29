// swiftlint:disable all
import Amplify
import Foundation

extension Review {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case user
    case content
    case image
    case recipe
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let review = Review.keys
    
    model.pluralName = "Reviews"
    
    model.attributes(
      .index(fields: ["recipeID", "createdAt"], name: "byReview")
    )
    
    model.fields(
      .id(),
      .field(review.user, is: .required, ofType: .string),
      .field(review.content, is: .required, ofType: .string),
      .field(review.image, is: .required, ofType: .string),
      .belongsTo(review.recipe, is: .optional, ofType: Recipe.self, targetName: "recipeID"),
      .field(review.createdAt, is: .optional, ofType: .string),
      .field(review.updatedAt, is: .optional, ofType: .string)
    )
    }
}