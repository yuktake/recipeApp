//
//  SearchResultRecipesStore.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/08/21.
//

//import SwiftUI
//import Combine
//import Amplify
//import AWSPluginsCore
//
//class SearchResultRecipesStore: ObservableObject {
//    @Published var result:[String:RecipeData] = [:]
//    var recipeSubscription: AnyCancellable?
//
//    init() {
//        self.subscribeToDataStore()
//        self.getResult()
//    }
//
//    deinit {
//        self.unsubscribeFromDataStore()
//    }
//
//    func unsubscribeFromDataStore() {
//        recipeSubscription?.cancel()
//    }
//
//    func getResult() {
//
//    }
//
//    func subscribeToDataStore() {
//        recipeSubscription = Amplify.DataStore.publisher(for: Recipe.self)
//            .sink(receiveCompletion: { (completion) in
//                print("Completion!")
//
//                if case .failure(let error) = completion {
//                    print("Subscription received Error: \(error.localizedDescription)")
//                }
//
//            }, receiveValue: { (changes) in
//                let newRecipe = try! changes.decodeModel(as: Recipe.self)
//
//                DispatchQueue.main.async {
//                    switch changes.mutationType {
//                    case "create":
//                        print("create")
//                        self.addRecipeToArray(newRecipe)
//                        break
//                    case "update":
//                        print("Update Subscription")
//                        self.updateRecipeInArray(newRecipe)
//                        break
//                    case "delete":
//                        print("Delete Subscription")
//                        self.deleteRecipeFromArray(newRecipe)
//                        break
//                    default:
//                        print("AnotherType?")
//                        print(changes.mutationType)
//                        break
//                    }
//                }
//                print("\n")
//            })
//    }
//
//    private func addRecipeToArray(_ recipe: Recipe) {
//        let formatter: DateFormatter = DateFormatter()
//        formatter.calendar = Calendar(identifier: .gregorian)
//        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
//        let now = Date()
//        let create_at = recipe.createdAt?.foundationDate
//        let update_at = recipe.updatedAt?.foundationDate
//        var pro:[Procedure] = []
//        var rev:[Review] = []
//
//        if let procedures = recipe.contents {
//            for procedure in procedures {
//                pro.append(procedure)
//            }
//        }
//        if let reviews = recipe.reviews {
//            for review in reviews {
//                rev.append(review)
//            }
//        }
//
//        let recipeData = RecipeData(
//            id:recipe.id,
//            userId:recipe.userid,
//            title:recipe.title,
//            protein:String(recipe.protein),
//            fat:String(recipe.fat),
//            carbo:String(recipe.carbo),
//            state:recipe.state,
//            materials:recipe.materials,
//            contents:pro,
//            reviews: rev,
//            image:recipe.image ?? "",
//            create_at:formatter.string(from:create_at ?? now) as String,
//            update_at:formatter.string(from:update_at ?? now) as String
//        )
//        if !self.result.keys.contains(recipe.id) {
//            self.result[recipe.id] = recipeData
//        }
//    }
//
//    private func deleteRecipeFromArray(_ recipe: Recipe) {
//        self.result.removeValue(forKey: recipe.id)
//    }
//
//    private func updateRecipeInArray(_ recipe: Recipe) {
//        print("update?")
//        let formatter: DateFormatter = DateFormatter()
//        formatter.calendar = Calendar(identifier: .gregorian)
//        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
//        let now = Date()
//        let create_at = recipe.createdAt?.foundationDate
//        let update_at = recipe.updatedAt?.foundationDate
//        var pro:[Procedure] = []
//        var rev:[Review] = []
//
//        if let procedures = recipe.contents {
//            for procedure in procedures {
//                pro.append(procedure)
//            }
//        }
//        if let reviews = recipe.reviews {
//            for review in reviews {
//                rev.append(review)
//            }
//        }
//
//        let recipeData = RecipeData(
//            id:recipe.id,
//            userId:recipe.userid,
//            title:recipe.title,
//            protein:String(recipe.protein),
//            fat:String(recipe.fat),
//            carbo:String(recipe.carbo),
//            state:recipe.state,
//            materials:recipe.materials,
//            contents:pro,
//            reviews: rev,
//            image:recipe.image ?? "",
//            create_at:formatter.string(from:create_at ?? now) as String,
//            update_at:formatter.string(from:update_at ?? now) as String
//        )
//        self.result[recipe.id] = recipeData
//    }
//}
