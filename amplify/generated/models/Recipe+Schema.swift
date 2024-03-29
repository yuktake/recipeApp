// swiftlint:disable all
import Amplify
import Foundation

extension Recipe {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case user
    case type
    case title
    case calorie
    case protein
    case fat
    case carbo
    case state
    case materials
    case contents
    case reviews
    case favNum
    case reviewNum
    case createdAt
    case updatedAt
    case delFlg
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let recipe = Recipe.keys
    
    model.pluralName = "Recipes"
    
    model.attributes(
      .index(fields: ["type", "protein"], name: "recipesByProtein"),
      .index(fields: ["type", "fat"], name: "recipesByFat"),
      .index(fields: ["type", "carbo"], name: "recipesByCarbo"),
      .index(fields: ["type", "favNum"], name: "recipesByFav"),
      .index(fields: ["type", "reviewNum"], name: "recipesByReview"),
      .index(fields: ["type", "createdAt"], name: "recipesByDate")
    )
    
    model.fields(
      .id(),
      .field(recipe.user, is: .required, ofType: .string),
      .field(recipe.type, is: .required, ofType: .string),
      .field(recipe.title, is: .required, ofType: .string),
      .field(recipe.calorie, is: .required, ofType: .int),
      .field(recipe.protein, is: .required, ofType: .double),
      .field(recipe.fat, is: .required, ofType: .double),
      .field(recipe.carbo, is: .required, ofType: .double),
      .field(recipe.state, is: .required, ofType: .int),
      .field(recipe.materials, is: .required, ofType: .string),
      .hasMany(recipe.contents, is: .optional, ofType: Procedure.self, associatedWith: Procedure.keys.recipe),
      .hasMany(recipe.reviews, is: .optional, ofType: Review.self, associatedWith: Review.keys.recipe),
      .field(recipe.favNum, is: .required, ofType: .int),
      .field(recipe.reviewNum, is: .required, ofType: .int),
      .field(recipe.createdAt, is: .optional, ofType: .string),
      .field(recipe.updatedAt, is: .optional, ofType: .string),
      .field(recipe.delFlg, is: .required, ofType: .int)
    )
    }
}