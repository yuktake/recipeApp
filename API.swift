//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateRecipeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, image: String, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
    graphQLMap = ["id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "image": image, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var user: String {
    get {
      return graphQLMap["user"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }

  public var type: String {
    get {
      return graphQLMap["type"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var calorie: Int {
    get {
      return graphQLMap["calorie"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "calorie")
    }
  }

  public var protein: Double {
    get {
      return graphQLMap["protein"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "protein")
    }
  }

  public var fat: Double {
    get {
      return graphQLMap["fat"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fat")
    }
  }

  public var carbo: Double {
    get {
      return graphQLMap["carbo"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "carbo")
    }
  }

  public var state: Int {
    get {
      return graphQLMap["state"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "state")
    }
  }

  public var materials: String {
    get {
      return graphQLMap["materials"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "materials")
    }
  }

  public var image: String {
    get {
      return graphQLMap["image"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var favNum: Int {
    get {
      return graphQLMap["favNum"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "favNum")
    }
  }

  public var createdAt: String? {
    get {
      return graphQLMap["createdAt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: String? {
    get {
      return graphQLMap["updatedAt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public var delFlg: Int {
    get {
      return graphQLMap["delFlg"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "delFlg")
    }
  }
}

public struct ModelRecipeConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(user: ModelStringInput? = nil, type: ModelStringInput? = nil, title: ModelStringInput? = nil, calorie: ModelIntInput? = nil, protein: ModelFloatInput? = nil, fat: ModelFloatInput? = nil, carbo: ModelFloatInput? = nil, state: ModelIntInput? = nil, materials: ModelStringInput? = nil, image: ModelStringInput? = nil, favNum: ModelIntInput? = nil, createdAt: ModelStringInput? = nil, updatedAt: ModelStringInput? = nil, delFlg: ModelIntInput? = nil, and: [ModelRecipeConditionInput?]? = nil, or: [ModelRecipeConditionInput?]? = nil, not: ModelRecipeConditionInput? = nil) {
    graphQLMap = ["user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "image": image, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg, "and": and, "or": or, "not": not]
  }

  public var user: ModelStringInput? {
    get {
      return graphQLMap["user"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }

  public var type: ModelStringInput? {
    get {
      return graphQLMap["type"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var title: ModelStringInput? {
    get {
      return graphQLMap["title"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var calorie: ModelIntInput? {
    get {
      return graphQLMap["calorie"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "calorie")
    }
  }

  public var protein: ModelFloatInput? {
    get {
      return graphQLMap["protein"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "protein")
    }
  }

  public var fat: ModelFloatInput? {
    get {
      return graphQLMap["fat"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fat")
    }
  }

  public var carbo: ModelFloatInput? {
    get {
      return graphQLMap["carbo"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "carbo")
    }
  }

  public var state: ModelIntInput? {
    get {
      return graphQLMap["state"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "state")
    }
  }

  public var materials: ModelStringInput? {
    get {
      return graphQLMap["materials"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "materials")
    }
  }

  public var image: ModelStringInput? {
    get {
      return graphQLMap["image"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var favNum: ModelIntInput? {
    get {
      return graphQLMap["favNum"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "favNum")
    }
  }

  public var createdAt: ModelStringInput? {
    get {
      return graphQLMap["createdAt"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: ModelStringInput? {
    get {
      return graphQLMap["updatedAt"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public var delFlg: ModelIntInput? {
    get {
      return graphQLMap["delFlg"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "delFlg")
    }
  }

  public var and: [ModelRecipeConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelRecipeConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelRecipeConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelRecipeConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelRecipeConditionInput? {
    get {
      return graphQLMap["not"] as! ModelRecipeConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelStringInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public enum ModelAttributeTypes: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case binary
  case binarySet
  case bool
  case list
  case map
  case number
  case numberSet
  case string
  case stringSet
  case null
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "binary": self = .binary
      case "binarySet": self = .binarySet
      case "bool": self = .bool
      case "list": self = .list
      case "map": self = .map
      case "number": self = .number
      case "numberSet": self = .numberSet
      case "string": self = .string
      case "stringSet": self = .stringSet
      case "_null": self = .null
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .binary: return "binary"
      case .binarySet: return "binarySet"
      case .bool: return "bool"
      case .list: return "list"
      case .map: return "map"
      case .number: return "number"
      case .numberSet: return "numberSet"
      case .string: return "string"
      case .stringSet: return "stringSet"
      case .null: return "_null"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelAttributeTypes, rhs: ModelAttributeTypes) -> Bool {
    switch (lhs, rhs) {
      case (.binary, .binary): return true
      case (.binarySet, .binarySet): return true
      case (.bool, .bool): return true
      case (.list, .list): return true
      case (.map, .map): return true
      case (.number, .number): return true
      case (.numberSet, .numberSet): return true
      case (.string, .string): return true
      case (.stringSet, .stringSet): return true
      case (.null, .null): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelSizeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public struct ModelIntInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct ModelFloatInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Double? = nil, eq: Double? = nil, le: Double? = nil, lt: Double? = nil, ge: Double? = nil, gt: Double? = nil, between: [Double?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Double? {
    get {
      return graphQLMap["ne"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Double? {
    get {
      return graphQLMap["eq"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Double? {
    get {
      return graphQLMap["le"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Double? {
    get {
      return graphQLMap["lt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Double? {
    get {
      return graphQLMap["ge"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Double? {
    get {
      return graphQLMap["gt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Double?]? {
    get {
      return graphQLMap["between"] as! [Double?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct UpdateRecipeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, user: String? = nil, type: String? = nil, title: String? = nil, calorie: Int? = nil, protein: Double? = nil, fat: Double? = nil, carbo: Double? = nil, state: Int? = nil, materials: String? = nil, image: String? = nil, favNum: Int? = nil, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int? = nil) {
    graphQLMap = ["id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "image": image, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var user: String? {
    get {
      return graphQLMap["user"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }

  public var type: String? {
    get {
      return graphQLMap["type"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var title: String? {
    get {
      return graphQLMap["title"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var calorie: Int? {
    get {
      return graphQLMap["calorie"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "calorie")
    }
  }

  public var protein: Double? {
    get {
      return graphQLMap["protein"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "protein")
    }
  }

  public var fat: Double? {
    get {
      return graphQLMap["fat"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fat")
    }
  }

  public var carbo: Double? {
    get {
      return graphQLMap["carbo"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "carbo")
    }
  }

  public var state: Int? {
    get {
      return graphQLMap["state"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "state")
    }
  }

  public var materials: String? {
    get {
      return graphQLMap["materials"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "materials")
    }
  }

  public var image: String? {
    get {
      return graphQLMap["image"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var favNum: Int? {
    get {
      return graphQLMap["favNum"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "favNum")
    }
  }

  public var createdAt: String? {
    get {
      return graphQLMap["createdAt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: String? {
    get {
      return graphQLMap["updatedAt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public var delFlg: Int? {
    get {
      return graphQLMap["delFlg"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "delFlg")
    }
  }
}

public struct DeleteRecipeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateProcedureInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, recipeId: GraphQLID, order: Int, content: String, image: String? = nil) {
    graphQLMap = ["id": id, "recipeID": recipeId, "order": order, "content": content, "image": image]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var recipeId: GraphQLID {
    get {
      return graphQLMap["recipeID"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var order: Int {
    get {
      return graphQLMap["order"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "order")
    }
  }

  public var content: String {
    get {
      return graphQLMap["content"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var image: String? {
    get {
      return graphQLMap["image"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }
}

public struct ModelProcedureConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(recipeId: ModelIDInput? = nil, order: ModelIntInput? = nil, content: ModelStringInput? = nil, image: ModelStringInput? = nil, and: [ModelProcedureConditionInput?]? = nil, or: [ModelProcedureConditionInput?]? = nil, not: ModelProcedureConditionInput? = nil) {
    graphQLMap = ["recipeID": recipeId, "order": order, "content": content, "image": image, "and": and, "or": or, "not": not]
  }

  public var recipeId: ModelIDInput? {
    get {
      return graphQLMap["recipeID"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var order: ModelIntInput? {
    get {
      return graphQLMap["order"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "order")
    }
  }

  public var content: ModelStringInput? {
    get {
      return graphQLMap["content"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var image: ModelStringInput? {
    get {
      return graphQLMap["image"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var and: [ModelProcedureConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelProcedureConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelProcedureConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelProcedureConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelProcedureConditionInput? {
    get {
      return graphQLMap["not"] as! ModelProcedureConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public struct UpdateProcedureInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, recipeId: GraphQLID? = nil, order: Int? = nil, content: String? = nil, image: String? = nil) {
    graphQLMap = ["id": id, "recipeID": recipeId, "order": order, "content": content, "image": image]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var recipeId: GraphQLID? {
    get {
      return graphQLMap["recipeID"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var order: Int? {
    get {
      return graphQLMap["order"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "order")
    }
  }

  public var content: String? {
    get {
      return graphQLMap["content"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var image: String? {
    get {
      return graphQLMap["image"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }
}

public struct DeleteProcedureInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateReviewInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, user: String, recipeId: GraphQLID, content: String, image: String? = nil) {
    graphQLMap = ["id": id, "user": user, "recipeID": recipeId, "content": content, "image": image]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var user: String {
    get {
      return graphQLMap["user"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }

  public var recipeId: GraphQLID {
    get {
      return graphQLMap["recipeID"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var content: String {
    get {
      return graphQLMap["content"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var image: String? {
    get {
      return graphQLMap["image"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }
}

public struct ModelReviewConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(user: ModelStringInput? = nil, recipeId: ModelIDInput? = nil, content: ModelStringInput? = nil, image: ModelStringInput? = nil, and: [ModelReviewConditionInput?]? = nil, or: [ModelReviewConditionInput?]? = nil, not: ModelReviewConditionInput? = nil) {
    graphQLMap = ["user": user, "recipeID": recipeId, "content": content, "image": image, "and": and, "or": or, "not": not]
  }

  public var user: ModelStringInput? {
    get {
      return graphQLMap["user"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }

  public var recipeId: ModelIDInput? {
    get {
      return graphQLMap["recipeID"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var content: ModelStringInput? {
    get {
      return graphQLMap["content"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var image: ModelStringInput? {
    get {
      return graphQLMap["image"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var and: [ModelReviewConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelReviewConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelReviewConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelReviewConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelReviewConditionInput? {
    get {
      return graphQLMap["not"] as! ModelReviewConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct UpdateReviewInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, user: String? = nil, recipeId: GraphQLID? = nil, content: String? = nil, image: String? = nil) {
    graphQLMap = ["id": id, "user": user, "recipeID": recipeId, "content": content, "image": image]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var user: String? {
    get {
      return graphQLMap["user"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }

  public var recipeId: GraphQLID? {
    get {
      return graphQLMap["recipeID"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var content: String? {
    get {
      return graphQLMap["content"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var image: String? {
    get {
      return graphQLMap["image"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }
}

public struct DeleteReviewInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, name: String, displayName: String, email: String, description: String? = nil) {
    graphQLMap = ["id": id, "name": name, "displayName": displayName, "email": email, "description": description]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var displayName: String {
    get {
      return graphQLMap["displayName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "displayName")
    }
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }
}

public struct ModelUserConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(name: ModelStringInput? = nil, displayName: ModelStringInput? = nil, email: ModelStringInput? = nil, description: ModelStringInput? = nil, and: [ModelUserConditionInput?]? = nil, or: [ModelUserConditionInput?]? = nil, not: ModelUserConditionInput? = nil) {
    graphQLMap = ["name": name, "displayName": displayName, "email": email, "description": description, "and": and, "or": or, "not": not]
  }

  public var name: ModelStringInput? {
    get {
      return graphQLMap["name"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var displayName: ModelStringInput? {
    get {
      return graphQLMap["displayName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "displayName")
    }
  }

  public var email: ModelStringInput? {
    get {
      return graphQLMap["email"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var description: ModelStringInput? {
    get {
      return graphQLMap["description"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var and: [ModelUserConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserConditionInput? {
    get {
      return graphQLMap["not"] as! ModelUserConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct UpdateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, name: String? = nil, displayName: String? = nil, email: String? = nil, description: String? = nil) {
    graphQLMap = ["id": id, "name": name, "displayName": displayName, "email": email, "description": description]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var displayName: String? {
    get {
      return graphQLMap["displayName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "displayName")
    }
  }

  public var email: String? {
    get {
      return graphQLMap["email"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }
}

public struct DeleteUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateFavInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, userId: String, recipeId: String, type: String, createdAt: String? = nil) {
    graphQLMap = ["id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var userId: String {
    get {
      return graphQLMap["userID"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userID")
    }
  }

  public var recipeId: String {
    get {
      return graphQLMap["recipeID"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var type: String {
    get {
      return graphQLMap["type"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var createdAt: String? {
    get {
      return graphQLMap["createdAt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }
}

public struct ModelFavConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(userId: ModelStringInput? = nil, recipeId: ModelStringInput? = nil, type: ModelStringInput? = nil, createdAt: ModelStringInput? = nil, and: [ModelFavConditionInput?]? = nil, or: [ModelFavConditionInput?]? = nil, not: ModelFavConditionInput? = nil) {
    graphQLMap = ["userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "and": and, "or": or, "not": not]
  }

  public var userId: ModelStringInput? {
    get {
      return graphQLMap["userID"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userID")
    }
  }

  public var recipeId: ModelStringInput? {
    get {
      return graphQLMap["recipeID"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var type: ModelStringInput? {
    get {
      return graphQLMap["type"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var createdAt: ModelStringInput? {
    get {
      return graphQLMap["createdAt"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var and: [ModelFavConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelFavConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelFavConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelFavConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelFavConditionInput? {
    get {
      return graphQLMap["not"] as! ModelFavConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct UpdateFavInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, userId: String? = nil, recipeId: String? = nil, type: String? = nil, createdAt: String? = nil) {
    graphQLMap = ["id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var userId: String? {
    get {
      return graphQLMap["userID"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userID")
    }
  }

  public var recipeId: String? {
    get {
      return graphQLMap["recipeID"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var type: String? {
    get {
      return graphQLMap["type"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var createdAt: String? {
    get {
      return graphQLMap["createdAt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }
}

public struct DeleteFavInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ModelRecipeFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, user: ModelStringInput? = nil, type: ModelStringInput? = nil, title: ModelStringInput? = nil, calorie: ModelIntInput? = nil, protein: ModelFloatInput? = nil, fat: ModelFloatInput? = nil, carbo: ModelFloatInput? = nil, state: ModelIntInput? = nil, materials: ModelStringInput? = nil, image: ModelStringInput? = nil, favNum: ModelIntInput? = nil, createdAt: ModelStringInput? = nil, updatedAt: ModelStringInput? = nil, delFlg: ModelIntInput? = nil, and: [ModelRecipeFilterInput?]? = nil, or: [ModelRecipeFilterInput?]? = nil, not: ModelRecipeFilterInput? = nil) {
    graphQLMap = ["id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "image": image, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var user: ModelStringInput? {
    get {
      return graphQLMap["user"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }

  public var type: ModelStringInput? {
    get {
      return graphQLMap["type"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var title: ModelStringInput? {
    get {
      return graphQLMap["title"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var calorie: ModelIntInput? {
    get {
      return graphQLMap["calorie"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "calorie")
    }
  }

  public var protein: ModelFloatInput? {
    get {
      return graphQLMap["protein"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "protein")
    }
  }

  public var fat: ModelFloatInput? {
    get {
      return graphQLMap["fat"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fat")
    }
  }

  public var carbo: ModelFloatInput? {
    get {
      return graphQLMap["carbo"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "carbo")
    }
  }

  public var state: ModelIntInput? {
    get {
      return graphQLMap["state"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "state")
    }
  }

  public var materials: ModelStringInput? {
    get {
      return graphQLMap["materials"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "materials")
    }
  }

  public var image: ModelStringInput? {
    get {
      return graphQLMap["image"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var favNum: ModelIntInput? {
    get {
      return graphQLMap["favNum"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "favNum")
    }
  }

  public var createdAt: ModelStringInput? {
    get {
      return graphQLMap["createdAt"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: ModelStringInput? {
    get {
      return graphQLMap["updatedAt"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public var delFlg: ModelIntInput? {
    get {
      return graphQLMap["delFlg"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "delFlg")
    }
  }

  public var and: [ModelRecipeFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelRecipeFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelRecipeFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelRecipeFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelRecipeFilterInput? {
    get {
      return graphQLMap["not"] as! ModelRecipeFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelProcedureFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, recipeId: ModelIDInput? = nil, order: ModelIntInput? = nil, content: ModelStringInput? = nil, image: ModelStringInput? = nil, and: [ModelProcedureFilterInput?]? = nil, or: [ModelProcedureFilterInput?]? = nil, not: ModelProcedureFilterInput? = nil) {
    graphQLMap = ["id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var recipeId: ModelIDInput? {
    get {
      return graphQLMap["recipeID"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var order: ModelIntInput? {
    get {
      return graphQLMap["order"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "order")
    }
  }

  public var content: ModelStringInput? {
    get {
      return graphQLMap["content"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var image: ModelStringInput? {
    get {
      return graphQLMap["image"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var and: [ModelProcedureFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelProcedureFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelProcedureFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelProcedureFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelProcedureFilterInput? {
    get {
      return graphQLMap["not"] as! ModelProcedureFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelReviewFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, user: ModelStringInput? = nil, recipeId: ModelIDInput? = nil, content: ModelStringInput? = nil, image: ModelStringInput? = nil, and: [ModelReviewFilterInput?]? = nil, or: [ModelReviewFilterInput?]? = nil, not: ModelReviewFilterInput? = nil) {
    graphQLMap = ["id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var user: ModelStringInput? {
    get {
      return graphQLMap["user"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "user")
    }
  }

  public var recipeId: ModelIDInput? {
    get {
      return graphQLMap["recipeID"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var content: ModelStringInput? {
    get {
      return graphQLMap["content"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var image: ModelStringInput? {
    get {
      return graphQLMap["image"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var and: [ModelReviewFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelReviewFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelReviewFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelReviewFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelReviewFilterInput? {
    get {
      return graphQLMap["not"] as! ModelReviewFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelUserFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, name: ModelStringInput? = nil, displayName: ModelStringInput? = nil, email: ModelStringInput? = nil, description: ModelStringInput? = nil, and: [ModelUserFilterInput?]? = nil, or: [ModelUserFilterInput?]? = nil, not: ModelUserFilterInput? = nil) {
    graphQLMap = ["id": id, "name": name, "displayName": displayName, "email": email, "description": description, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: ModelStringInput? {
    get {
      return graphQLMap["name"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var displayName: ModelStringInput? {
    get {
      return graphQLMap["displayName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "displayName")
    }
  }

  public var email: ModelStringInput? {
    get {
      return graphQLMap["email"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var description: ModelStringInput? {
    get {
      return graphQLMap["description"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var and: [ModelUserFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserFilterInput? {
    get {
      return graphQLMap["not"] as! ModelUserFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelFavFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, userId: ModelStringInput? = nil, recipeId: ModelStringInput? = nil, type: ModelStringInput? = nil, createdAt: ModelStringInput? = nil, and: [ModelFavFilterInput?]? = nil, or: [ModelFavFilterInput?]? = nil, not: ModelFavFilterInput? = nil) {
    graphQLMap = ["id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var userId: ModelStringInput? {
    get {
      return graphQLMap["userID"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userID")
    }
  }

  public var recipeId: ModelStringInput? {
    get {
      return graphQLMap["recipeID"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipeID")
    }
  }

  public var type: ModelStringInput? {
    get {
      return graphQLMap["type"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var createdAt: ModelStringInput? {
    get {
      return graphQLMap["createdAt"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var and: [ModelFavFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelFavFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelFavFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelFavFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelFavFilterInput? {
    get {
      return graphQLMap["not"] as! ModelFavFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelFloatKeyConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(eq: Double? = nil, le: Double? = nil, lt: Double? = nil, ge: Double? = nil, gt: Double? = nil, between: [Double?]? = nil) {
    graphQLMap = ["eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var eq: Double? {
    get {
      return graphQLMap["eq"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Double? {
    get {
      return graphQLMap["le"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Double? {
    get {
      return graphQLMap["lt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Double? {
    get {
      return graphQLMap["ge"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Double? {
    get {
      return graphQLMap["gt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Double?]? {
    get {
      return graphQLMap["between"] as! [Double?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public enum ModelSortDirection: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case asc
  case desc
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ASC": self = .asc
      case "DESC": self = .desc
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .asc: return "ASC"
      case .desc: return "DESC"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelSortDirection, rhs: ModelSortDirection) -> Bool {
    switch (lhs, rhs) {
      case (.asc, .asc): return true
      case (.desc, .desc): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelStringKeyConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, between: [String?]? = nil, beginsWith: String? = nil) {
    graphQLMap = ["eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "beginsWith": beginsWith]
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct ModelIntKeyConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public final class CreateRecipeMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateRecipe($input: CreateRecipeInput!, $condition: ModelRecipeConditionInput) {\n  createRecipe(input: $input, condition: $condition) {\n    __typename\n    id\n    user\n    type\n    title\n    calorie\n    protein\n    fat\n    carbo\n    state\n    materials\n    contents {\n      __typename\n      items {\n        __typename\n        id\n        recipeID\n        order\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    image\n    reviews {\n      __typename\n      items {\n        __typename\n        id\n        user\n        recipeID\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    favNum\n    createdAt\n    updatedAt\n    delFlg\n  }\n}"

  public var input: CreateRecipeInput
  public var condition: ModelRecipeConditionInput?

  public init(input: CreateRecipeInput, condition: ModelRecipeConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createRecipe", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateRecipe.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createRecipe: CreateRecipe? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createRecipe": createRecipe.flatMap { $0.snapshot }])
    }

    public var createRecipe: CreateRecipe? {
      get {
        return (snapshot["createRecipe"] as? Snapshot).flatMap { CreateRecipe(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createRecipe")
      }
    }

    public struct CreateRecipe: GraphQLSelectionSet {
      public static let possibleTypes = ["Recipe"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
        GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
        GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
        GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(Int.self))),
        GraphQLField("materials", type: .nonNull(.scalar(String.self))),
        GraphQLField("contents", type: .object(Content.selections)),
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
        GraphQLField("reviews", type: .object(Review.selections)),
        GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
        self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var calorie: Int {
        get {
          return snapshot["calorie"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "calorie")
        }
      }

      public var protein: Double {
        get {
          return snapshot["protein"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "protein")
        }
      }

      public var fat: Double {
        get {
          return snapshot["fat"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fat")
        }
      }

      public var carbo: Double {
        get {
          return snapshot["carbo"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "carbo")
        }
      }

      public var state: Int {
        get {
          return snapshot["state"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var materials: String {
        get {
          return snapshot["materials"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "materials")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "contents")
        }
      }

      public var image: String {
        get {
          return snapshot["image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var reviews: Review? {
        get {
          return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
        }
      }

      public var favNum: Int {
        get {
          return snapshot["favNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "favNum")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return snapshot["updatedAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var delFlg: Int {
        get {
          return snapshot["delFlg"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "delFlg")
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelProcedureConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelProcedureConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Procedure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("order", type: .nonNull(.scalar(Int.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var order: Int {
            get {
              return snapshot["order"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "order")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }

      public struct Review: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelReviewConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelReviewConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Review"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }
    }
  }
}

public final class UpdateRecipeMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateRecipe($input: UpdateRecipeInput!, $condition: ModelRecipeConditionInput) {\n  updateRecipe(input: $input, condition: $condition) {\n    __typename\n    id\n    user\n    type\n    title\n    calorie\n    protein\n    fat\n    carbo\n    state\n    materials\n    contents {\n      __typename\n      items {\n        __typename\n        id\n        recipeID\n        order\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    image\n    reviews {\n      __typename\n      items {\n        __typename\n        id\n        user\n        recipeID\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    favNum\n    createdAt\n    updatedAt\n    delFlg\n  }\n}"

  public var input: UpdateRecipeInput
  public var condition: ModelRecipeConditionInput?

  public init(input: UpdateRecipeInput, condition: ModelRecipeConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateRecipe", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateRecipe.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateRecipe: UpdateRecipe? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateRecipe": updateRecipe.flatMap { $0.snapshot }])
    }

    public var updateRecipe: UpdateRecipe? {
      get {
        return (snapshot["updateRecipe"] as? Snapshot).flatMap { UpdateRecipe(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateRecipe")
      }
    }

    public struct UpdateRecipe: GraphQLSelectionSet {
      public static let possibleTypes = ["Recipe"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
        GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
        GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
        GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(Int.self))),
        GraphQLField("materials", type: .nonNull(.scalar(String.self))),
        GraphQLField("contents", type: .object(Content.selections)),
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
        GraphQLField("reviews", type: .object(Review.selections)),
        GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
        self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var calorie: Int {
        get {
          return snapshot["calorie"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "calorie")
        }
      }

      public var protein: Double {
        get {
          return snapshot["protein"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "protein")
        }
      }

      public var fat: Double {
        get {
          return snapshot["fat"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fat")
        }
      }

      public var carbo: Double {
        get {
          return snapshot["carbo"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "carbo")
        }
      }

      public var state: Int {
        get {
          return snapshot["state"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var materials: String {
        get {
          return snapshot["materials"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "materials")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "contents")
        }
      }

      public var image: String {
        get {
          return snapshot["image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var reviews: Review? {
        get {
          return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
        }
      }

      public var favNum: Int {
        get {
          return snapshot["favNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "favNum")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return snapshot["updatedAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var delFlg: Int {
        get {
          return snapshot["delFlg"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "delFlg")
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelProcedureConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelProcedureConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Procedure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("order", type: .nonNull(.scalar(Int.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var order: Int {
            get {
              return snapshot["order"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "order")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }

      public struct Review: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelReviewConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelReviewConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Review"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }
    }
  }
}

public final class DeleteRecipeMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteRecipe($input: DeleteRecipeInput!, $condition: ModelRecipeConditionInput) {\n  deleteRecipe(input: $input, condition: $condition) {\n    __typename\n    id\n    user\n    type\n    title\n    calorie\n    protein\n    fat\n    carbo\n    state\n    materials\n    contents {\n      __typename\n      items {\n        __typename\n        id\n        recipeID\n        order\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    image\n    reviews {\n      __typename\n      items {\n        __typename\n        id\n        user\n        recipeID\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    favNum\n    createdAt\n    updatedAt\n    delFlg\n  }\n}"

  public var input: DeleteRecipeInput
  public var condition: ModelRecipeConditionInput?

  public init(input: DeleteRecipeInput, condition: ModelRecipeConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteRecipe", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteRecipe.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteRecipe: DeleteRecipe? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteRecipe": deleteRecipe.flatMap { $0.snapshot }])
    }

    public var deleteRecipe: DeleteRecipe? {
      get {
        return (snapshot["deleteRecipe"] as? Snapshot).flatMap { DeleteRecipe(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteRecipe")
      }
    }

    public struct DeleteRecipe: GraphQLSelectionSet {
      public static let possibleTypes = ["Recipe"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
        GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
        GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
        GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(Int.self))),
        GraphQLField("materials", type: .nonNull(.scalar(String.self))),
        GraphQLField("contents", type: .object(Content.selections)),
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
        GraphQLField("reviews", type: .object(Review.selections)),
        GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
        self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var calorie: Int {
        get {
          return snapshot["calorie"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "calorie")
        }
      }

      public var protein: Double {
        get {
          return snapshot["protein"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "protein")
        }
      }

      public var fat: Double {
        get {
          return snapshot["fat"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fat")
        }
      }

      public var carbo: Double {
        get {
          return snapshot["carbo"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "carbo")
        }
      }

      public var state: Int {
        get {
          return snapshot["state"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var materials: String {
        get {
          return snapshot["materials"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "materials")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "contents")
        }
      }

      public var image: String {
        get {
          return snapshot["image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var reviews: Review? {
        get {
          return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
        }
      }

      public var favNum: Int {
        get {
          return snapshot["favNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "favNum")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return snapshot["updatedAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var delFlg: Int {
        get {
          return snapshot["delFlg"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "delFlg")
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelProcedureConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelProcedureConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Procedure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("order", type: .nonNull(.scalar(Int.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var order: Int {
            get {
              return snapshot["order"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "order")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }

      public struct Review: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelReviewConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelReviewConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Review"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }
    }
  }
}

public final class CreateProcedureMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateProcedure($input: CreateProcedureInput!, $condition: ModelProcedureConditionInput) {\n  createProcedure(input: $input, condition: $condition) {\n    __typename\n    id\n    recipeID\n    order\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public var input: CreateProcedureInput
  public var condition: ModelProcedureConditionInput?

  public init(input: CreateProcedureInput, condition: ModelProcedureConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createProcedure", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateProcedure.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createProcedure: CreateProcedure? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createProcedure": createProcedure.flatMap { $0.snapshot }])
    }

    public var createProcedure: CreateProcedure? {
      get {
        return (snapshot["createProcedure"] as? Snapshot).flatMap { CreateProcedure(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createProcedure")
      }
    }

    public struct CreateProcedure: GraphQLSelectionSet {
      public static let possibleTypes = ["Procedure"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("order", type: .nonNull(.scalar(Int.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var order: Int {
        get {
          return snapshot["order"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "order")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class UpdateProcedureMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateProcedure($input: UpdateProcedureInput!, $condition: ModelProcedureConditionInput) {\n  updateProcedure(input: $input, condition: $condition) {\n    __typename\n    id\n    recipeID\n    order\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public var input: UpdateProcedureInput
  public var condition: ModelProcedureConditionInput?

  public init(input: UpdateProcedureInput, condition: ModelProcedureConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateProcedure", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateProcedure.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateProcedure: UpdateProcedure? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateProcedure": updateProcedure.flatMap { $0.snapshot }])
    }

    public var updateProcedure: UpdateProcedure? {
      get {
        return (snapshot["updateProcedure"] as? Snapshot).flatMap { UpdateProcedure(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateProcedure")
      }
    }

    public struct UpdateProcedure: GraphQLSelectionSet {
      public static let possibleTypes = ["Procedure"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("order", type: .nonNull(.scalar(Int.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var order: Int {
        get {
          return snapshot["order"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "order")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class DeleteProcedureMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteProcedure($input: DeleteProcedureInput!, $condition: ModelProcedureConditionInput) {\n  deleteProcedure(input: $input, condition: $condition) {\n    __typename\n    id\n    recipeID\n    order\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public var input: DeleteProcedureInput
  public var condition: ModelProcedureConditionInput?

  public init(input: DeleteProcedureInput, condition: ModelProcedureConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteProcedure", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteProcedure.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteProcedure: DeleteProcedure? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteProcedure": deleteProcedure.flatMap { $0.snapshot }])
    }

    public var deleteProcedure: DeleteProcedure? {
      get {
        return (snapshot["deleteProcedure"] as? Snapshot).flatMap { DeleteProcedure(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteProcedure")
      }
    }

    public struct DeleteProcedure: GraphQLSelectionSet {
      public static let possibleTypes = ["Procedure"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("order", type: .nonNull(.scalar(Int.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var order: Int {
        get {
          return snapshot["order"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "order")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class CreateReviewMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateReview($input: CreateReviewInput!, $condition: ModelReviewConditionInput) {\n  createReview(input: $input, condition: $condition) {\n    __typename\n    id\n    user\n    recipeID\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public var input: CreateReviewInput
  public var condition: ModelReviewConditionInput?

  public init(input: CreateReviewInput, condition: ModelReviewConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createReview", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createReview: CreateReview? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createReview": createReview.flatMap { $0.snapshot }])
    }

    public var createReview: CreateReview? {
      get {
        return (snapshot["createReview"] as? Snapshot).flatMap { CreateReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createReview")
      }
    }

    public struct CreateReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class UpdateReviewMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateReview($input: UpdateReviewInput!, $condition: ModelReviewConditionInput) {\n  updateReview(input: $input, condition: $condition) {\n    __typename\n    id\n    user\n    recipeID\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public var input: UpdateReviewInput
  public var condition: ModelReviewConditionInput?

  public init(input: UpdateReviewInput, condition: ModelReviewConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateReview", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateReview: UpdateReview? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateReview": updateReview.flatMap { $0.snapshot }])
    }

    public var updateReview: UpdateReview? {
      get {
        return (snapshot["updateReview"] as? Snapshot).flatMap { UpdateReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateReview")
      }
    }

    public struct UpdateReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class DeleteReviewMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteReview($input: DeleteReviewInput!, $condition: ModelReviewConditionInput) {\n  deleteReview(input: $input, condition: $condition) {\n    __typename\n    id\n    user\n    recipeID\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public var input: DeleteReviewInput
  public var condition: ModelReviewConditionInput?

  public init(input: DeleteReviewInput, condition: ModelReviewConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteReview", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteReview: DeleteReview? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteReview": deleteReview.flatMap { $0.snapshot }])
    }

    public var deleteReview: DeleteReview? {
      get {
        return (snapshot["deleteReview"] as? Snapshot).flatMap { DeleteReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteReview")
      }
    }

    public struct DeleteReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUser($input: CreateUserInput!, $condition: ModelUserConditionInput) {\n  createUser(input: $input, condition: $condition) {\n    __typename\n    id\n    name\n    displayName\n    email\n    description\n    createdAt\n    updatedAt\n  }\n}"

  public var input: CreateUserInput
  public var condition: ModelUserConditionInput?

  public init(input: CreateUserInput, condition: ModelUserConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUser: CreateUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUser": createUser.flatMap { $0.snapshot }])
    }

    public var createUser: CreateUser? {
      get {
        return (snapshot["createUser"] as? Snapshot).flatMap { CreateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, displayName: String, email: String, description: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "displayName": displayName, "email": email, "description": description, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var displayName: String {
        get {
          return snapshot["displayName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "displayName")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class UpdateUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUser($input: UpdateUserInput!, $condition: ModelUserConditionInput) {\n  updateUser(input: $input, condition: $condition) {\n    __typename\n    id\n    name\n    displayName\n    email\n    description\n    createdAt\n    updatedAt\n  }\n}"

  public var input: UpdateUserInput
  public var condition: ModelUserConditionInput?

  public init(input: UpdateUserInput, condition: ModelUserConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUser: UpdateUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUser": updateUser.flatMap { $0.snapshot }])
    }

    public var updateUser: UpdateUser? {
      get {
        return (snapshot["updateUser"] as? Snapshot).flatMap { UpdateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, displayName: String, email: String, description: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "displayName": displayName, "email": email, "description": description, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var displayName: String {
        get {
          return snapshot["displayName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "displayName")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class DeleteUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUser($input: DeleteUserInput!, $condition: ModelUserConditionInput) {\n  deleteUser(input: $input, condition: $condition) {\n    __typename\n    id\n    name\n    displayName\n    email\n    description\n    createdAt\n    updatedAt\n  }\n}"

  public var input: DeleteUserInput
  public var condition: ModelUserConditionInput?

  public init(input: DeleteUserInput, condition: ModelUserConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUser", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUser: DeleteUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUser": deleteUser.flatMap { $0.snapshot }])
    }

    public var deleteUser: DeleteUser? {
      get {
        return (snapshot["deleteUser"] as? Snapshot).flatMap { DeleteUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUser")
      }
    }

    public struct DeleteUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, displayName: String, email: String, description: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "displayName": displayName, "email": email, "description": description, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var displayName: String {
        get {
          return snapshot["displayName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "displayName")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class CreateFavMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateFav($input: CreateFavInput!, $condition: ModelFavConditionInput) {\n  createFav(input: $input, condition: $condition) {\n    __typename\n    id\n    userID\n    recipeID\n    type\n    createdAt\n    updatedAt\n  }\n}"

  public var input: CreateFavInput
  public var condition: ModelFavConditionInput?

  public init(input: CreateFavInput, condition: ModelFavConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createFav", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateFav.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createFav: CreateFav? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createFav": createFav.flatMap { $0.snapshot }])
    }

    public var createFav: CreateFav? {
      get {
        return (snapshot["createFav"] as? Snapshot).flatMap { CreateFav(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createFav")
      }
    }

    public struct CreateFav: GraphQLSelectionSet {
      public static let possibleTypes = ["Fav"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userID", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, recipeId: String, type: String, createdAt: String? = nil, updatedAt: String) {
        self.init(snapshot: ["__typename": "Fav", "id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userID")
        }
      }

      public var recipeId: String {
        get {
          return snapshot["recipeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class UpdateFavMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateFav($input: UpdateFavInput!, $condition: ModelFavConditionInput) {\n  updateFav(input: $input, condition: $condition) {\n    __typename\n    id\n    userID\n    recipeID\n    type\n    createdAt\n    updatedAt\n  }\n}"

  public var input: UpdateFavInput
  public var condition: ModelFavConditionInput?

  public init(input: UpdateFavInput, condition: ModelFavConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateFav", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateFav.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateFav: UpdateFav? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateFav": updateFav.flatMap { $0.snapshot }])
    }

    public var updateFav: UpdateFav? {
      get {
        return (snapshot["updateFav"] as? Snapshot).flatMap { UpdateFav(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateFav")
      }
    }

    public struct UpdateFav: GraphQLSelectionSet {
      public static let possibleTypes = ["Fav"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userID", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, recipeId: String, type: String, createdAt: String? = nil, updatedAt: String) {
        self.init(snapshot: ["__typename": "Fav", "id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userID")
        }
      }

      public var recipeId: String {
        get {
          return snapshot["recipeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class DeleteFavMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteFav($input: DeleteFavInput!, $condition: ModelFavConditionInput) {\n  deleteFav(input: $input, condition: $condition) {\n    __typename\n    id\n    userID\n    recipeID\n    type\n    createdAt\n    updatedAt\n  }\n}"

  public var input: DeleteFavInput
  public var condition: ModelFavConditionInput?

  public init(input: DeleteFavInput, condition: ModelFavConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteFav", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteFav.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteFav: DeleteFav? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteFav": deleteFav.flatMap { $0.snapshot }])
    }

    public var deleteFav: DeleteFav? {
      get {
        return (snapshot["deleteFav"] as? Snapshot).flatMap { DeleteFav(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteFav")
      }
    }

    public struct DeleteFav: GraphQLSelectionSet {
      public static let possibleTypes = ["Fav"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userID", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, recipeId: String, type: String, createdAt: String? = nil, updatedAt: String) {
        self.init(snapshot: ["__typename": "Fav", "id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userID")
        }
      }

      public var recipeId: String {
        get {
          return snapshot["recipeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class GetRecipeQuery: GraphQLQuery {
  public static let operationString =
    "query GetRecipe($id: ID!) {\n  getRecipe(id: $id) {\n    __typename\n    id\n    user\n    type\n    title\n    calorie\n    protein\n    fat\n    carbo\n    state\n    materials\n    contents {\n      __typename\n      items {\n        __typename\n        id\n        recipeID\n        order\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    image\n    reviews {\n      __typename\n      items {\n        __typename\n        id\n        user\n        recipeID\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    favNum\n    createdAt\n    updatedAt\n    delFlg\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getRecipe", arguments: ["id": GraphQLVariable("id")], type: .object(GetRecipe.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getRecipe: GetRecipe? = nil) {
      self.init(snapshot: ["__typename": "Query", "getRecipe": getRecipe.flatMap { $0.snapshot }])
    }

    public var getRecipe: GetRecipe? {
      get {
        return (snapshot["getRecipe"] as? Snapshot).flatMap { GetRecipe(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getRecipe")
      }
    }

    public struct GetRecipe: GraphQLSelectionSet {
      public static let possibleTypes = ["Recipe"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
        GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
        GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
        GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(Int.self))),
        GraphQLField("materials", type: .nonNull(.scalar(String.self))),
        GraphQLField("contents", type: .object(Content.selections)),
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
        GraphQLField("reviews", type: .object(Review.selections)),
        GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
        self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var calorie: Int {
        get {
          return snapshot["calorie"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "calorie")
        }
      }

      public var protein: Double {
        get {
          return snapshot["protein"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "protein")
        }
      }

      public var fat: Double {
        get {
          return snapshot["fat"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fat")
        }
      }

      public var carbo: Double {
        get {
          return snapshot["carbo"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "carbo")
        }
      }

      public var state: Int {
        get {
          return snapshot["state"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var materials: String {
        get {
          return snapshot["materials"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "materials")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "contents")
        }
      }

      public var image: String {
        get {
          return snapshot["image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var reviews: Review? {
        get {
          return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
        }
      }

      public var favNum: Int {
        get {
          return snapshot["favNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "favNum")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return snapshot["updatedAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var delFlg: Int {
        get {
          return snapshot["delFlg"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "delFlg")
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelProcedureConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelProcedureConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Procedure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("order", type: .nonNull(.scalar(Int.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var order: Int {
            get {
              return snapshot["order"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "order")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }

      public struct Review: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelReviewConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelReviewConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Review"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }
    }
  }
}

public final class ListRecipesQuery: GraphQLQuery {
  public static let operationString =
    "query ListRecipes($filter: ModelRecipeFilterInput, $limit: Int, $nextToken: String) {\n  listRecipes(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    nextToken\n  }\n}"

  public var filter: ModelRecipeFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelRecipeFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listRecipes", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListRecipe.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listRecipes: ListRecipe? = nil) {
      self.init(snapshot: ["__typename": "Query", "listRecipes": listRecipes.flatMap { $0.snapshot }])
    }

    public var listRecipes: ListRecipe? {
      get {
        return (snapshot["listRecipes"] as? Snapshot).flatMap { ListRecipe(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listRecipes")
      }
    }

    public struct ListRecipe: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelRecipeConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelRecipeConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class GetProcedureQuery: GraphQLQuery {
  public static let operationString =
    "query GetProcedure($id: ID!) {\n  getProcedure(id: $id) {\n    __typename\n    id\n    recipeID\n    order\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getProcedure", arguments: ["id": GraphQLVariable("id")], type: .object(GetProcedure.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getProcedure: GetProcedure? = nil) {
      self.init(snapshot: ["__typename": "Query", "getProcedure": getProcedure.flatMap { $0.snapshot }])
    }

    public var getProcedure: GetProcedure? {
      get {
        return (snapshot["getProcedure"] as? Snapshot).flatMap { GetProcedure(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getProcedure")
      }
    }

    public struct GetProcedure: GraphQLSelectionSet {
      public static let possibleTypes = ["Procedure"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("order", type: .nonNull(.scalar(Int.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var order: Int {
        get {
          return snapshot["order"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "order")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class ListProceduresQuery: GraphQLQuery {
  public static let operationString =
    "query ListProcedures($filter: ModelProcedureFilterInput, $limit: Int, $nextToken: String) {\n  listProcedures(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      recipeID\n      order\n      content\n      image\n      recipe {\n        __typename\n        id\n        user\n        type\n        title\n        calorie\n        protein\n        fat\n        carbo\n        state\n        materials\n        image\n        favNum\n        createdAt\n        updatedAt\n        delFlg\n      }\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var filter: ModelProcedureFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelProcedureFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listProcedures", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListProcedure.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listProcedures: ListProcedure? = nil) {
      self.init(snapshot: ["__typename": "Query", "listProcedures": listProcedures.flatMap { $0.snapshot }])
    }

    public var listProcedures: ListProcedure? {
      get {
        return (snapshot["listProcedures"] as? Snapshot).flatMap { ListProcedure(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listProcedures")
      }
    }

    public struct ListProcedure: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelProcedureConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelProcedureConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Procedure"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("order", type: .nonNull(.scalar(Int.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("recipe", type: .object(Recipe.selections)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
          self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var recipeId: GraphQLID {
          get {
            return snapshot["recipeID"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "recipeID")
          }
        }

        public var order: Int {
          get {
            return snapshot["order"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "order")
          }
        }

        public var content: String {
          get {
            return snapshot["content"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var image: String? {
          get {
            return snapshot["image"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var recipe: Recipe? {
          get {
            return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public struct Recipe: GraphQLSelectionSet {
          public static let possibleTypes = ["Recipe"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
            GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
            GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
            GraphQLField("state", type: .nonNull(.scalar(Int.self))),
            GraphQLField("materials", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .nonNull(.scalar(String.self))),
            GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, image: String, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
            self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "image": image, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var type: String {
            get {
              return snapshot["type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "type")
            }
          }

          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var calorie: Int {
            get {
              return snapshot["calorie"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "calorie")
            }
          }

          public var protein: Double {
            get {
              return snapshot["protein"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "protein")
            }
          }

          public var fat: Double {
            get {
              return snapshot["fat"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "fat")
            }
          }

          public var carbo: Double {
            get {
              return snapshot["carbo"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "carbo")
            }
          }

          public var state: Int {
            get {
              return snapshot["state"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          public var materials: String {
            get {
              return snapshot["materials"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "materials")
            }
          }

          public var image: String {
            get {
              return snapshot["image"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var favNum: Int {
            get {
              return snapshot["favNum"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "favNum")
            }
          }

          public var createdAt: String? {
            get {
              return snapshot["createdAt"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String? {
            get {
              return snapshot["updatedAt"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }

          public var delFlg: Int {
            get {
              return snapshot["delFlg"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "delFlg")
            }
          }
        }
      }
    }
  }
}

public final class GetReviewQuery: GraphQLQuery {
  public static let operationString =
    "query GetReview($id: ID!) {\n  getReview(id: $id) {\n    __typename\n    id\n    user\n    recipeID\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getReview", arguments: ["id": GraphQLVariable("id")], type: .object(GetReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getReview: GetReview? = nil) {
      self.init(snapshot: ["__typename": "Query", "getReview": getReview.flatMap { $0.snapshot }])
    }

    public var getReview: GetReview? {
      get {
        return (snapshot["getReview"] as? Snapshot).flatMap { GetReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getReview")
      }
    }

    public struct GetReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class ListReviewsQuery: GraphQLQuery {
  public static let operationString =
    "query ListReviews($filter: ModelReviewFilterInput, $limit: Int, $nextToken: String) {\n  listReviews(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      user\n      recipeID\n      content\n      image\n      recipe {\n        __typename\n        id\n        user\n        type\n        title\n        calorie\n        protein\n        fat\n        carbo\n        state\n        materials\n        image\n        favNum\n        createdAt\n        updatedAt\n        delFlg\n      }\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var filter: ModelReviewFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelReviewFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listReviews", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listReviews: ListReview? = nil) {
      self.init(snapshot: ["__typename": "Query", "listReviews": listReviews.flatMap { $0.snapshot }])
    }

    public var listReviews: ListReview? {
      get {
        return (snapshot["listReviews"] as? Snapshot).flatMap { ListReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listReviews")
      }
    }

    public struct ListReview: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelReviewConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelReviewConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Review"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("recipe", type: .object(Recipe.selections)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
          self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var recipeId: GraphQLID {
          get {
            return snapshot["recipeID"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "recipeID")
          }
        }

        public var content: String {
          get {
            return snapshot["content"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var image: String? {
          get {
            return snapshot["image"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var recipe: Recipe? {
          get {
            return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public struct Recipe: GraphQLSelectionSet {
          public static let possibleTypes = ["Recipe"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
            GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
            GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
            GraphQLField("state", type: .nonNull(.scalar(Int.self))),
            GraphQLField("materials", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .nonNull(.scalar(String.self))),
            GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, image: String, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
            self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "image": image, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var type: String {
            get {
              return snapshot["type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "type")
            }
          }

          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var calorie: Int {
            get {
              return snapshot["calorie"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "calorie")
            }
          }

          public var protein: Double {
            get {
              return snapshot["protein"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "protein")
            }
          }

          public var fat: Double {
            get {
              return snapshot["fat"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "fat")
            }
          }

          public var carbo: Double {
            get {
              return snapshot["carbo"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "carbo")
            }
          }

          public var state: Int {
            get {
              return snapshot["state"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          public var materials: String {
            get {
              return snapshot["materials"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "materials")
            }
          }

          public var image: String {
            get {
              return snapshot["image"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var favNum: Int {
            get {
              return snapshot["favNum"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "favNum")
            }
          }

          public var createdAt: String? {
            get {
              return snapshot["createdAt"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String? {
            get {
              return snapshot["updatedAt"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }

          public var delFlg: Int {
            get {
              return snapshot["delFlg"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "delFlg")
            }
          }
        }
      }
    }
  }
}

public final class GetUserQuery: GraphQLQuery {
  public static let operationString =
    "query GetUser($id: ID!) {\n  getUser(id: $id) {\n    __typename\n    id\n    name\n    displayName\n    email\n    description\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUser", arguments: ["id": GraphQLVariable("id")], type: .object(GetUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUser: GetUser? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUser": getUser.flatMap { $0.snapshot }])
    }

    public var getUser: GetUser? {
      get {
        return (snapshot["getUser"] as? Snapshot).flatMap { GetUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUser")
      }
    }

    public struct GetUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, displayName: String, email: String, description: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "displayName": displayName, "email": email, "description": description, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var displayName: String {
        get {
          return snapshot["displayName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "displayName")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class ListUsersQuery: GraphQLQuery {
  public static let operationString =
    "query ListUsers($filter: ModelUserFilterInput, $limit: Int, $nextToken: String) {\n  listUsers(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      name\n      displayName\n      email\n      description\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var filter: ModelUserFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelUserFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listUsers", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listUsers: ListUser? = nil) {
      self.init(snapshot: ["__typename": "Query", "listUsers": listUsers.flatMap { $0.snapshot }])
    }

    public var listUsers: ListUser? {
      get {
        return (snapshot["listUsers"] as? Snapshot).flatMap { ListUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listUsers")
      }
    }

    public struct ListUser: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelUserConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, displayName: String, email: String, description: String? = nil, createdAt: String, updatedAt: String) {
          self.init(snapshot: ["__typename": "User", "id": id, "name": name, "displayName": displayName, "email": email, "description": description, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var displayName: String {
          get {
            return snapshot["displayName"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "displayName")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var description: String? {
          get {
            return snapshot["description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "description")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }
    }
  }
}

public final class GetFavQuery: GraphQLQuery {
  public static let operationString =
    "query GetFav($id: ID!) {\n  getFav(id: $id) {\n    __typename\n    id\n    userID\n    recipeID\n    type\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getFav", arguments: ["id": GraphQLVariable("id")], type: .object(GetFav.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getFav: GetFav? = nil) {
      self.init(snapshot: ["__typename": "Query", "getFav": getFav.flatMap { $0.snapshot }])
    }

    public var getFav: GetFav? {
      get {
        return (snapshot["getFav"] as? Snapshot).flatMap { GetFav(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getFav")
      }
    }

    public struct GetFav: GraphQLSelectionSet {
      public static let possibleTypes = ["Fav"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userID", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, recipeId: String, type: String, createdAt: String? = nil, updatedAt: String) {
        self.init(snapshot: ["__typename": "Fav", "id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userID")
        }
      }

      public var recipeId: String {
        get {
          return snapshot["recipeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class ListFavsQuery: GraphQLQuery {
  public static let operationString =
    "query ListFavs($filter: ModelFavFilterInput, $limit: Int, $nextToken: String) {\n  listFavs(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      userID\n      recipeID\n      type\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var filter: ModelFavFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelFavFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listFavs", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListFav.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listFavs: ListFav? = nil) {
      self.init(snapshot: ["__typename": "Query", "listFavs": listFavs.flatMap { $0.snapshot }])
    }

    public var listFavs: ListFav? {
      get {
        return (snapshot["listFavs"] as? Snapshot).flatMap { ListFav(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listFavs")
      }
    }

    public struct ListFav: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelFavConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelFavConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Fav"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("userID", type: .nonNull(.scalar(String.self))),
          GraphQLField("recipeID", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, userId: String, recipeId: String, type: String, createdAt: String? = nil, updatedAt: String) {
          self.init(snapshot: ["__typename": "Fav", "id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var userId: String {
          get {
            return snapshot["userID"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "userID")
          }
        }

        public var recipeId: String {
          get {
            return snapshot["recipeID"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "recipeID")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }
    }
  }
}

public final class RecipesByProteinQuery: GraphQLQuery {
  public static let operationString =
    "query RecipesByProtein($type: String, $protein: ModelFloatKeyConditionInput, $sortDirection: ModelSortDirection, $filter: ModelRecipeFilterInput, $limit: Int, $nextToken: String) {\n  recipesByProtein(type: $type, protein: $protein, sortDirection: $sortDirection, filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    nextToken\n  }\n}"

  public var type: String?
  public var protein: ModelFloatKeyConditionInput?
  public var sortDirection: ModelSortDirection?
  public var filter: ModelRecipeFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(type: String? = nil, protein: ModelFloatKeyConditionInput? = nil, sortDirection: ModelSortDirection? = nil, filter: ModelRecipeFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.type = type
    self.protein = protein
    self.sortDirection = sortDirection
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["type": type, "protein": protein, "sortDirection": sortDirection, "filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("recipesByProtein", arguments: ["type": GraphQLVariable("type"), "protein": GraphQLVariable("protein"), "sortDirection": GraphQLVariable("sortDirection"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(RecipesByProtein.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(recipesByProtein: RecipesByProtein? = nil) {
      self.init(snapshot: ["__typename": "Query", "recipesByProtein": recipesByProtein.flatMap { $0.snapshot }])
    }

    public var recipesByProtein: RecipesByProtein? {
      get {
        return (snapshot["recipesByProtein"] as? Snapshot).flatMap { RecipesByProtein(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "recipesByProtein")
      }
    }

    public struct RecipesByProtein: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelRecipeConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelRecipeConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class RecipesByFatQuery: GraphQLQuery {
  public static let operationString =
    "query RecipesByFat($type: String, $fat: ModelFloatKeyConditionInput, $sortDirection: ModelSortDirection, $filter: ModelRecipeFilterInput, $limit: Int, $nextToken: String) {\n  recipesByFat(type: $type, fat: $fat, sortDirection: $sortDirection, filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    nextToken\n  }\n}"

  public var type: String?
  public var fat: ModelFloatKeyConditionInput?
  public var sortDirection: ModelSortDirection?
  public var filter: ModelRecipeFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(type: String? = nil, fat: ModelFloatKeyConditionInput? = nil, sortDirection: ModelSortDirection? = nil, filter: ModelRecipeFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.type = type
    self.fat = fat
    self.sortDirection = sortDirection
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["type": type, "fat": fat, "sortDirection": sortDirection, "filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("recipesByFat", arguments: ["type": GraphQLVariable("type"), "fat": GraphQLVariable("fat"), "sortDirection": GraphQLVariable("sortDirection"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(RecipesByFat.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(recipesByFat: RecipesByFat? = nil) {
      self.init(snapshot: ["__typename": "Query", "recipesByFat": recipesByFat.flatMap { $0.snapshot }])
    }

    public var recipesByFat: RecipesByFat? {
      get {
        return (snapshot["recipesByFat"] as? Snapshot).flatMap { RecipesByFat(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "recipesByFat")
      }
    }

    public struct RecipesByFat: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelRecipeConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelRecipeConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class RecipesByCarboQuery: GraphQLQuery {
  public static let operationString =
    "query RecipesByCarbo($type: String, $carbo: ModelFloatKeyConditionInput, $sortDirection: ModelSortDirection, $filter: ModelRecipeFilterInput, $limit: Int, $nextToken: String) {\n  recipesByCarbo(type: $type, carbo: $carbo, sortDirection: $sortDirection, filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    nextToken\n  }\n}"

  public var type: String?
  public var carbo: ModelFloatKeyConditionInput?
  public var sortDirection: ModelSortDirection?
  public var filter: ModelRecipeFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(type: String? = nil, carbo: ModelFloatKeyConditionInput? = nil, sortDirection: ModelSortDirection? = nil, filter: ModelRecipeFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.type = type
    self.carbo = carbo
    self.sortDirection = sortDirection
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["type": type, "carbo": carbo, "sortDirection": sortDirection, "filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("recipesByCarbo", arguments: ["type": GraphQLVariable("type"), "carbo": GraphQLVariable("carbo"), "sortDirection": GraphQLVariable("sortDirection"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(RecipesByCarbo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(recipesByCarbo: RecipesByCarbo? = nil) {
      self.init(snapshot: ["__typename": "Query", "recipesByCarbo": recipesByCarbo.flatMap { $0.snapshot }])
    }

    public var recipesByCarbo: RecipesByCarbo? {
      get {
        return (snapshot["recipesByCarbo"] as? Snapshot).flatMap { RecipesByCarbo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "recipesByCarbo")
      }
    }

    public struct RecipesByCarbo: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelRecipeConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelRecipeConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class RecipesByDateQuery: GraphQLQuery {
  public static let operationString =
    "query RecipesByDate($type: String, $createdAt: ModelStringKeyConditionInput, $sortDirection: ModelSortDirection, $filter: ModelRecipeFilterInput, $limit: Int, $nextToken: String) {\n  recipesByDate(type: $type, createdAt: $createdAt, sortDirection: $sortDirection, filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    nextToken\n  }\n}"

  public var type: String?
  public var createdAt: ModelStringKeyConditionInput?
  public var sortDirection: ModelSortDirection?
  public var filter: ModelRecipeFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(type: String? = nil, createdAt: ModelStringKeyConditionInput? = nil, sortDirection: ModelSortDirection? = nil, filter: ModelRecipeFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.type = type
    self.createdAt = createdAt
    self.sortDirection = sortDirection
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["type": type, "createdAt": createdAt, "sortDirection": sortDirection, "filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("recipesByDate", arguments: ["type": GraphQLVariable("type"), "createdAt": GraphQLVariable("createdAt"), "sortDirection": GraphQLVariable("sortDirection"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(RecipesByDate.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(recipesByDate: RecipesByDate? = nil) {
      self.init(snapshot: ["__typename": "Query", "recipesByDate": recipesByDate.flatMap { $0.snapshot }])
    }

    public var recipesByDate: RecipesByDate? {
      get {
        return (snapshot["recipesByDate"] as? Snapshot).flatMap { RecipesByDate(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "recipesByDate")
      }
    }

    public struct RecipesByDate: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelRecipeConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelRecipeConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class ByProcedureQuery: GraphQLQuery {
  public static let operationString =
    "query ByProcedure($recipeID: ID, $order: ModelIntKeyConditionInput, $sortDirection: ModelSortDirection, $filter: ModelProcedureFilterInput, $limit: Int, $nextToken: String) {\n  byProcedure(recipeID: $recipeID, order: $order, sortDirection: $sortDirection, filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      recipeID\n      order\n      content\n      image\n      recipe {\n        __typename\n        id\n        user\n        type\n        title\n        calorie\n        protein\n        fat\n        carbo\n        state\n        materials\n        image\n        favNum\n        createdAt\n        updatedAt\n        delFlg\n      }\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var recipeID: GraphQLID?
  public var order: ModelIntKeyConditionInput?
  public var sortDirection: ModelSortDirection?
  public var filter: ModelProcedureFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(recipeID: GraphQLID? = nil, order: ModelIntKeyConditionInput? = nil, sortDirection: ModelSortDirection? = nil, filter: ModelProcedureFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.recipeID = recipeID
    self.order = order
    self.sortDirection = sortDirection
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["recipeID": recipeID, "order": order, "sortDirection": sortDirection, "filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("byProcedure", arguments: ["recipeID": GraphQLVariable("recipeID"), "order": GraphQLVariable("order"), "sortDirection": GraphQLVariable("sortDirection"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ByProcedure.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(byProcedure: ByProcedure? = nil) {
      self.init(snapshot: ["__typename": "Query", "byProcedure": byProcedure.flatMap { $0.snapshot }])
    }

    public var byProcedure: ByProcedure? {
      get {
        return (snapshot["byProcedure"] as? Snapshot).flatMap { ByProcedure(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "byProcedure")
      }
    }

    public struct ByProcedure: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelProcedureConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelProcedureConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Procedure"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("order", type: .nonNull(.scalar(Int.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("recipe", type: .object(Recipe.selections)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
          self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var recipeId: GraphQLID {
          get {
            return snapshot["recipeID"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "recipeID")
          }
        }

        public var order: Int {
          get {
            return snapshot["order"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "order")
          }
        }

        public var content: String {
          get {
            return snapshot["content"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var image: String? {
          get {
            return snapshot["image"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var recipe: Recipe? {
          get {
            return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public struct Recipe: GraphQLSelectionSet {
          public static let possibleTypes = ["Recipe"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
            GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
            GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
            GraphQLField("state", type: .nonNull(.scalar(Int.self))),
            GraphQLField("materials", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .nonNull(.scalar(String.self))),
            GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, image: String, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
            self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "image": image, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var type: String {
            get {
              return snapshot["type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "type")
            }
          }

          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var calorie: Int {
            get {
              return snapshot["calorie"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "calorie")
            }
          }

          public var protein: Double {
            get {
              return snapshot["protein"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "protein")
            }
          }

          public var fat: Double {
            get {
              return snapshot["fat"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "fat")
            }
          }

          public var carbo: Double {
            get {
              return snapshot["carbo"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "carbo")
            }
          }

          public var state: Int {
            get {
              return snapshot["state"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          public var materials: String {
            get {
              return snapshot["materials"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "materials")
            }
          }

          public var image: String {
            get {
              return snapshot["image"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var favNum: Int {
            get {
              return snapshot["favNum"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "favNum")
            }
          }

          public var createdAt: String? {
            get {
              return snapshot["createdAt"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String? {
            get {
              return snapshot["updatedAt"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }

          public var delFlg: Int {
            get {
              return snapshot["delFlg"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "delFlg")
            }
          }
        }
      }
    }
  }
}

public final class ByReviewQuery: GraphQLQuery {
  public static let operationString =
    "query ByReview($recipeID: ID, $sortDirection: ModelSortDirection, $filter: ModelReviewFilterInput, $limit: Int, $nextToken: String) {\n  byReview(recipeID: $recipeID, sortDirection: $sortDirection, filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      user\n      recipeID\n      content\n      image\n      recipe {\n        __typename\n        id\n        user\n        type\n        title\n        calorie\n        protein\n        fat\n        carbo\n        state\n        materials\n        image\n        favNum\n        createdAt\n        updatedAt\n        delFlg\n      }\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var recipeID: GraphQLID?
  public var sortDirection: ModelSortDirection?
  public var filter: ModelReviewFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(recipeID: GraphQLID? = nil, sortDirection: ModelSortDirection? = nil, filter: ModelReviewFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.recipeID = recipeID
    self.sortDirection = sortDirection
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["recipeID": recipeID, "sortDirection": sortDirection, "filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("byReview", arguments: ["recipeID": GraphQLVariable("recipeID"), "sortDirection": GraphQLVariable("sortDirection"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ByReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(byReview: ByReview? = nil) {
      self.init(snapshot: ["__typename": "Query", "byReview": byReview.flatMap { $0.snapshot }])
    }

    public var byReview: ByReview? {
      get {
        return (snapshot["byReview"] as? Snapshot).flatMap { ByReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "byReview")
      }
    }

    public struct ByReview: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelReviewConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelReviewConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Review"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("recipe", type: .object(Recipe.selections)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
          self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var recipeId: GraphQLID {
          get {
            return snapshot["recipeID"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "recipeID")
          }
        }

        public var content: String {
          get {
            return snapshot["content"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var image: String? {
          get {
            return snapshot["image"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var recipe: Recipe? {
          get {
            return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public struct Recipe: GraphQLSelectionSet {
          public static let possibleTypes = ["Recipe"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
            GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
            GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
            GraphQLField("state", type: .nonNull(.scalar(Int.self))),
            GraphQLField("materials", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .nonNull(.scalar(String.self))),
            GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, image: String, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
            self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "image": image, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var type: String {
            get {
              return snapshot["type"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "type")
            }
          }

          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var calorie: Int {
            get {
              return snapshot["calorie"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "calorie")
            }
          }

          public var protein: Double {
            get {
              return snapshot["protein"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "protein")
            }
          }

          public var fat: Double {
            get {
              return snapshot["fat"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "fat")
            }
          }

          public var carbo: Double {
            get {
              return snapshot["carbo"]! as! Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "carbo")
            }
          }

          public var state: Int {
            get {
              return snapshot["state"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "state")
            }
          }

          public var materials: String {
            get {
              return snapshot["materials"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "materials")
            }
          }

          public var image: String {
            get {
              return snapshot["image"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var favNum: Int {
            get {
              return snapshot["favNum"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "favNum")
            }
          }

          public var createdAt: String? {
            get {
              return snapshot["createdAt"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String? {
            get {
              return snapshot["updatedAt"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }

          public var delFlg: Int {
            get {
              return snapshot["delFlg"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "delFlg")
            }
          }
        }
      }
    }
  }
}

public final class FavsByDateQuery: GraphQLQuery {
  public static let operationString =
    "query FavsByDate($type: String, $createdAt: ModelStringKeyConditionInput, $sortDirection: ModelSortDirection, $filter: ModelFavFilterInput, $limit: Int, $nextToken: String) {\n  favsByDate(type: $type, createdAt: $createdAt, sortDirection: $sortDirection, filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      userID\n      recipeID\n      type\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var type: String?
  public var createdAt: ModelStringKeyConditionInput?
  public var sortDirection: ModelSortDirection?
  public var filter: ModelFavFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(type: String? = nil, createdAt: ModelStringKeyConditionInput? = nil, sortDirection: ModelSortDirection? = nil, filter: ModelFavFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.type = type
    self.createdAt = createdAt
    self.sortDirection = sortDirection
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["type": type, "createdAt": createdAt, "sortDirection": sortDirection, "filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("favsByDate", arguments: ["type": GraphQLVariable("type"), "createdAt": GraphQLVariable("createdAt"), "sortDirection": GraphQLVariable("sortDirection"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(FavsByDate.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(favsByDate: FavsByDate? = nil) {
      self.init(snapshot: ["__typename": "Query", "favsByDate": favsByDate.flatMap { $0.snapshot }])
    }

    public var favsByDate: FavsByDate? {
      get {
        return (snapshot["favsByDate"] as? Snapshot).flatMap { FavsByDate(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "favsByDate")
      }
    }

    public struct FavsByDate: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelFavConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item], nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelFavConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Fav"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("userID", type: .nonNull(.scalar(String.self))),
          GraphQLField("recipeID", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, userId: String, recipeId: String, type: String, createdAt: String? = nil, updatedAt: String) {
          self.init(snapshot: ["__typename": "Fav", "id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var userId: String {
          get {
            return snapshot["userID"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "userID")
          }
        }

        public var recipeId: String {
          get {
            return snapshot["recipeID"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "recipeID")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }
    }
  }
}

public final class OnCreateRecipeSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateRecipe {\n  onCreateRecipe {\n    __typename\n    id\n    user\n    type\n    title\n    calorie\n    protein\n    fat\n    carbo\n    state\n    materials\n    contents {\n      __typename\n      items {\n        __typename\n        id\n        recipeID\n        order\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    image\n    reviews {\n      __typename\n      items {\n        __typename\n        id\n        user\n        recipeID\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    favNum\n    createdAt\n    updatedAt\n    delFlg\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateRecipe", type: .object(OnCreateRecipe.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateRecipe: OnCreateRecipe? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateRecipe": onCreateRecipe.flatMap { $0.snapshot }])
    }

    public var onCreateRecipe: OnCreateRecipe? {
      get {
        return (snapshot["onCreateRecipe"] as? Snapshot).flatMap { OnCreateRecipe(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateRecipe")
      }
    }

    public struct OnCreateRecipe: GraphQLSelectionSet {
      public static let possibleTypes = ["Recipe"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
        GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
        GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
        GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(Int.self))),
        GraphQLField("materials", type: .nonNull(.scalar(String.self))),
        GraphQLField("contents", type: .object(Content.selections)),
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
        GraphQLField("reviews", type: .object(Review.selections)),
        GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
        self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var calorie: Int {
        get {
          return snapshot["calorie"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "calorie")
        }
      }

      public var protein: Double {
        get {
          return snapshot["protein"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "protein")
        }
      }

      public var fat: Double {
        get {
          return snapshot["fat"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fat")
        }
      }

      public var carbo: Double {
        get {
          return snapshot["carbo"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "carbo")
        }
      }

      public var state: Int {
        get {
          return snapshot["state"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var materials: String {
        get {
          return snapshot["materials"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "materials")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "contents")
        }
      }

      public var image: String {
        get {
          return snapshot["image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var reviews: Review? {
        get {
          return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
        }
      }

      public var favNum: Int {
        get {
          return snapshot["favNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "favNum")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return snapshot["updatedAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var delFlg: Int {
        get {
          return snapshot["delFlg"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "delFlg")
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelProcedureConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelProcedureConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Procedure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("order", type: .nonNull(.scalar(Int.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var order: Int {
            get {
              return snapshot["order"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "order")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }

      public struct Review: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelReviewConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelReviewConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Review"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }
    }
  }
}

public final class OnUpdateRecipeSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateRecipe {\n  onUpdateRecipe {\n    __typename\n    id\n    user\n    type\n    title\n    calorie\n    protein\n    fat\n    carbo\n    state\n    materials\n    contents {\n      __typename\n      items {\n        __typename\n        id\n        recipeID\n        order\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    image\n    reviews {\n      __typename\n      items {\n        __typename\n        id\n        user\n        recipeID\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    favNum\n    createdAt\n    updatedAt\n    delFlg\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateRecipe", type: .object(OnUpdateRecipe.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateRecipe: OnUpdateRecipe? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateRecipe": onUpdateRecipe.flatMap { $0.snapshot }])
    }

    public var onUpdateRecipe: OnUpdateRecipe? {
      get {
        return (snapshot["onUpdateRecipe"] as? Snapshot).flatMap { OnUpdateRecipe(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateRecipe")
      }
    }

    public struct OnUpdateRecipe: GraphQLSelectionSet {
      public static let possibleTypes = ["Recipe"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
        GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
        GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
        GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(Int.self))),
        GraphQLField("materials", type: .nonNull(.scalar(String.self))),
        GraphQLField("contents", type: .object(Content.selections)),
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
        GraphQLField("reviews", type: .object(Review.selections)),
        GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
        self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var calorie: Int {
        get {
          return snapshot["calorie"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "calorie")
        }
      }

      public var protein: Double {
        get {
          return snapshot["protein"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "protein")
        }
      }

      public var fat: Double {
        get {
          return snapshot["fat"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fat")
        }
      }

      public var carbo: Double {
        get {
          return snapshot["carbo"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "carbo")
        }
      }

      public var state: Int {
        get {
          return snapshot["state"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var materials: String {
        get {
          return snapshot["materials"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "materials")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "contents")
        }
      }

      public var image: String {
        get {
          return snapshot["image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var reviews: Review? {
        get {
          return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
        }
      }

      public var favNum: Int {
        get {
          return snapshot["favNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "favNum")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return snapshot["updatedAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var delFlg: Int {
        get {
          return snapshot["delFlg"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "delFlg")
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelProcedureConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelProcedureConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Procedure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("order", type: .nonNull(.scalar(Int.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var order: Int {
            get {
              return snapshot["order"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "order")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }

      public struct Review: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelReviewConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelReviewConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Review"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }
    }
  }
}

public final class OnDeleteRecipeSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteRecipe {\n  onDeleteRecipe {\n    __typename\n    id\n    user\n    type\n    title\n    calorie\n    protein\n    fat\n    carbo\n    state\n    materials\n    contents {\n      __typename\n      items {\n        __typename\n        id\n        recipeID\n        order\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    image\n    reviews {\n      __typename\n      items {\n        __typename\n        id\n        user\n        recipeID\n        content\n        image\n        createdAt\n        updatedAt\n      }\n      nextToken\n    }\n    favNum\n    createdAt\n    updatedAt\n    delFlg\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteRecipe", type: .object(OnDeleteRecipe.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteRecipe: OnDeleteRecipe? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteRecipe": onDeleteRecipe.flatMap { $0.snapshot }])
    }

    public var onDeleteRecipe: OnDeleteRecipe? {
      get {
        return (snapshot["onDeleteRecipe"] as? Snapshot).flatMap { OnDeleteRecipe(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteRecipe")
      }
    }

    public struct OnDeleteRecipe: GraphQLSelectionSet {
      public static let possibleTypes = ["Recipe"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
        GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
        GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
        GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
        GraphQLField("state", type: .nonNull(.scalar(Int.self))),
        GraphQLField("materials", type: .nonNull(.scalar(String.self))),
        GraphQLField("contents", type: .object(Content.selections)),
        GraphQLField("image", type: .nonNull(.scalar(String.self))),
        GraphQLField("reviews", type: .object(Review.selections)),
        GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
        self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var calorie: Int {
        get {
          return snapshot["calorie"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "calorie")
        }
      }

      public var protein: Double {
        get {
          return snapshot["protein"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "protein")
        }
      }

      public var fat: Double {
        get {
          return snapshot["fat"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "fat")
        }
      }

      public var carbo: Double {
        get {
          return snapshot["carbo"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "carbo")
        }
      }

      public var state: Int {
        get {
          return snapshot["state"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var materials: String {
        get {
          return snapshot["materials"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "materials")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "contents")
        }
      }

      public var image: String {
        get {
          return snapshot["image"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var reviews: Review? {
        get {
          return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
        }
      }

      public var favNum: Int {
        get {
          return snapshot["favNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "favNum")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return snapshot["updatedAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var delFlg: Int {
        get {
          return snapshot["delFlg"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "delFlg")
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelProcedureConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelProcedureConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Procedure"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("order", type: .nonNull(.scalar(Int.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var order: Int {
            get {
              return snapshot["order"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "order")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }

      public struct Review: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelReviewConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item], nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelReviewConnection", "items": items.map { $0.snapshot }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item] {
          get {
            return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Review"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.scalar(String.self))),
            GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, createdAt: String, updatedAt: String) {
            self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String {
            get {
              return snapshot["user"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "user")
            }
          }

          public var recipeId: GraphQLID {
            get {
              return snapshot["recipeID"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "recipeID")
            }
          }

          public var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public var image: String? {
            get {
              return snapshot["image"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "image")
            }
          }

          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String {
            get {
              return snapshot["updatedAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }
      }
    }
  }
}

public final class OnCreateProcedureSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateProcedure {\n  onCreateProcedure {\n    __typename\n    id\n    recipeID\n    order\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateProcedure", type: .object(OnCreateProcedure.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateProcedure: OnCreateProcedure? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateProcedure": onCreateProcedure.flatMap { $0.snapshot }])
    }

    public var onCreateProcedure: OnCreateProcedure? {
      get {
        return (snapshot["onCreateProcedure"] as? Snapshot).flatMap { OnCreateProcedure(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateProcedure")
      }
    }

    public struct OnCreateProcedure: GraphQLSelectionSet {
      public static let possibleTypes = ["Procedure"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("order", type: .nonNull(.scalar(Int.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var order: Int {
        get {
          return snapshot["order"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "order")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class OnUpdateProcedureSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateProcedure {\n  onUpdateProcedure {\n    __typename\n    id\n    recipeID\n    order\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateProcedure", type: .object(OnUpdateProcedure.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateProcedure: OnUpdateProcedure? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateProcedure": onUpdateProcedure.flatMap { $0.snapshot }])
    }

    public var onUpdateProcedure: OnUpdateProcedure? {
      get {
        return (snapshot["onUpdateProcedure"] as? Snapshot).flatMap { OnUpdateProcedure(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateProcedure")
      }
    }

    public struct OnUpdateProcedure: GraphQLSelectionSet {
      public static let possibleTypes = ["Procedure"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("order", type: .nonNull(.scalar(Int.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var order: Int {
        get {
          return snapshot["order"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "order")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class OnDeleteProcedureSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteProcedure {\n  onDeleteProcedure {\n    __typename\n    id\n    recipeID\n    order\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteProcedure", type: .object(OnDeleteProcedure.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteProcedure: OnDeleteProcedure? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteProcedure": onDeleteProcedure.flatMap { $0.snapshot }])
    }

    public var onDeleteProcedure: OnDeleteProcedure? {
      get {
        return (snapshot["onDeleteProcedure"] as? Snapshot).flatMap { OnDeleteProcedure(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteProcedure")
      }
    }

    public struct OnDeleteProcedure: GraphQLSelectionSet {
      public static let possibleTypes = ["Procedure"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("order", type: .nonNull(.scalar(Int.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, recipeId: GraphQLID, order: Int, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Procedure", "id": id, "recipeID": recipeId, "order": order, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var order: Int {
        get {
          return snapshot["order"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "order")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class OnCreateReviewSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateReview {\n  onCreateReview {\n    __typename\n    id\n    user\n    recipeID\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateReview", type: .object(OnCreateReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateReview: OnCreateReview? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateReview": onCreateReview.flatMap { $0.snapshot }])
    }

    public var onCreateReview: OnCreateReview? {
      get {
        return (snapshot["onCreateReview"] as? Snapshot).flatMap { OnCreateReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateReview")
      }
    }

    public struct OnCreateReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class OnUpdateReviewSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateReview {\n  onUpdateReview {\n    __typename\n    id\n    user\n    recipeID\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateReview", type: .object(OnUpdateReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateReview: OnUpdateReview? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateReview": onUpdateReview.flatMap { $0.snapshot }])
    }

    public var onUpdateReview: OnUpdateReview? {
      get {
        return (snapshot["onUpdateReview"] as? Snapshot).flatMap { OnUpdateReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateReview")
      }
    }

    public struct OnUpdateReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class OnDeleteReviewSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteReview {\n  onDeleteReview {\n    __typename\n    id\n    user\n    recipeID\n    content\n    image\n    recipe {\n      __typename\n      id\n      user\n      type\n      title\n      calorie\n      protein\n      fat\n      carbo\n      state\n      materials\n      contents {\n        __typename\n        nextToken\n      }\n      image\n      reviews {\n        __typename\n        nextToken\n      }\n      favNum\n      createdAt\n      updatedAt\n      delFlg\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteReview", type: .object(OnDeleteReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteReview: OnDeleteReview? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteReview": onDeleteReview.flatMap { $0.snapshot }])
    }

    public var onDeleteReview: OnDeleteReview? {
      get {
        return (snapshot["onDeleteReview"] as? Snapshot).flatMap { OnDeleteReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteReview")
      }
    }

    public struct OnDeleteReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("recipe", type: .object(Recipe.selections)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, user: String, recipeId: GraphQLID, content: String, image: String? = nil, recipe: Recipe? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Review", "id": id, "user": user, "recipeID": recipeId, "content": content, "image": image, "recipe": recipe.flatMap { $0.snapshot }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var recipeId: GraphQLID {
        get {
          return snapshot["recipeID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return snapshot["image"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "image")
        }
      }

      public var recipe: Recipe? {
        get {
          return (snapshot["recipe"] as? Snapshot).flatMap { Recipe(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "recipe")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes = ["Recipe"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("calorie", type: .nonNull(.scalar(Int.self))),
          GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
          GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
          GraphQLField("carbo", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(Int.self))),
          GraphQLField("materials", type: .nonNull(.scalar(String.self))),
          GraphQLField("contents", type: .object(Content.selections)),
          GraphQLField("image", type: .nonNull(.scalar(String.self))),
          GraphQLField("reviews", type: .object(Review.selections)),
          GraphQLField("favNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("delFlg", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, user: String, type: String, title: String, calorie: Int, protein: Double, fat: Double, carbo: Double, state: Int, materials: String, contents: Content? = nil, image: String, reviews: Review? = nil, favNum: Int, createdAt: String? = nil, updatedAt: String? = nil, delFlg: Int) {
          self.init(snapshot: ["__typename": "Recipe", "id": id, "user": user, "type": type, "title": title, "calorie": calorie, "protein": protein, "fat": fat, "carbo": carbo, "state": state, "materials": materials, "contents": contents.flatMap { $0.snapshot }, "image": image, "reviews": reviews.flatMap { $0.snapshot }, "favNum": favNum, "createdAt": createdAt, "updatedAt": updatedAt, "delFlg": delFlg])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var type: String {
          get {
            return snapshot["type"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "type")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var calorie: Int {
          get {
            return snapshot["calorie"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calorie")
          }
        }

        public var protein: Double {
          get {
            return snapshot["protein"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "protein")
          }
        }

        public var fat: Double {
          get {
            return snapshot["fat"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "fat")
          }
        }

        public var carbo: Double {
          get {
            return snapshot["carbo"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbo")
          }
        }

        public var state: Int {
          get {
            return snapshot["state"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var materials: String {
          get {
            return snapshot["materials"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "materials")
          }
        }

        public var contents: Content? {
          get {
            return (snapshot["contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "contents")
          }
        }

        public var image: String {
          get {
            return snapshot["image"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "image")
          }
        }

        public var reviews: Review? {
          get {
            return (snapshot["reviews"] as? Snapshot).flatMap { Review(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "reviews")
          }
        }

        public var favNum: Int {
          get {
            return snapshot["favNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "favNum")
          }
        }

        public var createdAt: String? {
          get {
            return snapshot["createdAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            return snapshot["updatedAt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var delFlg: Int {
          get {
            return snapshot["delFlg"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "delFlg")
          }
        }

        public struct Content: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelProcedureConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelProcedureConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }

        public struct Review: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelReviewConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelReviewConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class OnCreateUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateUser {\n  onCreateUser {\n    __typename\n    id\n    name\n    displayName\n    email\n    description\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateUser", type: .object(OnCreateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateUser: OnCreateUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateUser": onCreateUser.flatMap { $0.snapshot }])
    }

    public var onCreateUser: OnCreateUser? {
      get {
        return (snapshot["onCreateUser"] as? Snapshot).flatMap { OnCreateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateUser")
      }
    }

    public struct OnCreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, displayName: String, email: String, description: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "displayName": displayName, "email": email, "description": description, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var displayName: String {
        get {
          return snapshot["displayName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "displayName")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnUpdateUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateUser {\n  onUpdateUser {\n    __typename\n    id\n    name\n    displayName\n    email\n    description\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateUser", type: .object(OnUpdateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateUser: OnUpdateUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateUser": onUpdateUser.flatMap { $0.snapshot }])
    }

    public var onUpdateUser: OnUpdateUser? {
      get {
        return (snapshot["onUpdateUser"] as? Snapshot).flatMap { OnUpdateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateUser")
      }
    }

    public struct OnUpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, displayName: String, email: String, description: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "displayName": displayName, "email": email, "description": description, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var displayName: String {
        get {
          return snapshot["displayName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "displayName")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnDeleteUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteUser {\n  onDeleteUser {\n    __typename\n    id\n    name\n    displayName\n    email\n    description\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteUser", type: .object(OnDeleteUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteUser: OnDeleteUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteUser": onDeleteUser.flatMap { $0.snapshot }])
    }

    public var onDeleteUser: OnDeleteUser? {
      get {
        return (snapshot["onDeleteUser"] as? Snapshot).flatMap { OnDeleteUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteUser")
      }
    }

    public struct OnDeleteUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, displayName: String, email: String, description: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "User", "id": id, "name": name, "displayName": displayName, "email": email, "description": description, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var displayName: String {
        get {
          return snapshot["displayName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "displayName")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnCreateFavSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateFav {\n  onCreateFav {\n    __typename\n    id\n    userID\n    recipeID\n    type\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateFav", type: .object(OnCreateFav.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateFav: OnCreateFav? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateFav": onCreateFav.flatMap { $0.snapshot }])
    }

    public var onCreateFav: OnCreateFav? {
      get {
        return (snapshot["onCreateFav"] as? Snapshot).flatMap { OnCreateFav(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateFav")
      }
    }

    public struct OnCreateFav: GraphQLSelectionSet {
      public static let possibleTypes = ["Fav"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userID", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, recipeId: String, type: String, createdAt: String? = nil, updatedAt: String) {
        self.init(snapshot: ["__typename": "Fav", "id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userID")
        }
      }

      public var recipeId: String {
        get {
          return snapshot["recipeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnUpdateFavSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateFav {\n  onUpdateFav {\n    __typename\n    id\n    userID\n    recipeID\n    type\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateFav", type: .object(OnUpdateFav.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateFav: OnUpdateFav? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateFav": onUpdateFav.flatMap { $0.snapshot }])
    }

    public var onUpdateFav: OnUpdateFav? {
      get {
        return (snapshot["onUpdateFav"] as? Snapshot).flatMap { OnUpdateFav(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateFav")
      }
    }

    public struct OnUpdateFav: GraphQLSelectionSet {
      public static let possibleTypes = ["Fav"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userID", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, recipeId: String, type: String, createdAt: String? = nil, updatedAt: String) {
        self.init(snapshot: ["__typename": "Fav", "id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userID")
        }
      }

      public var recipeId: String {
        get {
          return snapshot["recipeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnDeleteFavSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteFav {\n  onDeleteFav {\n    __typename\n    id\n    userID\n    recipeID\n    type\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteFav", type: .object(OnDeleteFav.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteFav: OnDeleteFav? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteFav": onDeleteFav.flatMap { $0.snapshot }])
    }

    public var onDeleteFav: OnDeleteFav? {
      get {
        return (snapshot["onDeleteFav"] as? Snapshot).flatMap { OnDeleteFav(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteFav")
      }
    }

    public struct OnDeleteFav: GraphQLSelectionSet {
      public static let possibleTypes = ["Fav"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("userID", type: .nonNull(.scalar(String.self))),
        GraphQLField("recipeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, userId: String, recipeId: String, type: String, createdAt: String? = nil, updatedAt: String) {
        self.init(snapshot: ["__typename": "Fav", "id": id, "userID": userId, "recipeID": recipeId, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var userId: String {
        get {
          return snapshot["userID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "userID")
        }
      }

      public var recipeId: String {
        get {
          return snapshot["recipeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recipeID")
        }
      }

      public var type: String {
        get {
          return snapshot["type"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var createdAt: String? {
        get {
          return snapshot["createdAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}