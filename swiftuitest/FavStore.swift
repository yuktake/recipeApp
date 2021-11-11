//
//  FavStore.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/24.
//

import SwiftUI
import Combine
import Amplify
import AWSPluginsCore

class FavStore: ObservableObject {
    @Published var fav:[String:RecipeData] = [:]
    @Published var imageDatum = [String:Data]()
    
    @Published var localFavs:[String:String] = (UserDefaults.standard.dictionary(forKey: "favs") ?? [:]) as! [String:String]{
        didSet {
//            self.getInitFavs()
        }
    }
    
    var recipeSubscription: AnyCancellable?
    
    init() {
//        self.subscribeToDataStore()
        // loginしていれば
//        if (UserDefaults.standard.string(forKey: "sub") != nil) {
//            self.getFavs()
//        }
    }
    
    deinit {
        //self.unsubscribeFromDataStore()
    }
    
    func unsubscribeFromDataStore() {
//        recipeSubscription?.cancel()
    }
    
//    func getInitFavs() {
//        print("init favsssss")
//        self.localFavs.forEach { item in
//            Amplify.API.query(request: .get(Recipe.self, byId: item.key)) { event in
//                switch event {
//                case .success(let result):
//                    switch result {
//                    case .success(let recipe):
//                        guard let recipe = recipe else {
//                            print("Could not find recipe")
//                            return
//                        }
//                        print("Successfully retrieved recipe:")
//
//                        DispatchQueue.main.async {
//                            self.fav[recipe.id] = RecipeData(
//                                id:recipe.id,
//                                userId:recipe.user,
//                                title:recipe.title,
//                                protein:String(recipe.protein),
//                                fat:String(recipe.fat),
//                                carbo:String(recipe.carbo),
//                                state:recipe.state,
//                                materials:recipe.materials,
//                                contents:[],
//                                reviews: [],
//                                image:recipe.image,
//                                create_at: recipe.createdAt!,
//                                update_at: recipe.updatedAt!
//                            )
//                        }
//                        let options = StorageDownloadDataRequest.Options(accessLevel: .guest)
//                        Amplify.Storage.downloadData(key: recipe.image,options: options) { result in
//                            switch result {
//                            case .success(let imageData):
//                                DispatchQueue.main.async{
//                                    self.imageDatum[recipe.id] = imageData
//                                }
//                            case .failure(let error):
//                                print("Failed to download image data - \(error)")
//                            }
//                        }
//                    case .failure(let error):
//                        print("Got failed result with \(error.errorDescription)")
//                        print(error.recoverySuggestion)
//                        print(error.debugDescription)
//                    }
//                case .failure(let error):
//                    print("Got failed event with error \(error)")
//                }
//            }
//        }
//    }
//
//    func getFavs() {
//        print("get favsss")
//        var tmp_favs = self.localFavs
//        let fav = Fav.keys
//        let predicate = fav.userID == UserDefaults.standard.string(forKey: "sub")
//        Amplify.API.query(request: .list(Fav.self, where: predicate)) { event in
//            switch event {
//            case .success(let result):
//                switch result {
//                case .success(let favs):
//                    print("Successfully retrieved list of favs: \(favs)")
//                    favs.forEach { fav in
//                        if !self.localFavs.keys.contains(fav.recipeID) {
//                            // delete
//                            self.deleteFav(recipeId: fav.recipeID)
//                        } else {
//                            tmp_favs.removeValue(forKey: fav.recipeID)
//                        }
//                    }
//                    if !tmp_favs.isEmpty {
//                        tmp_favs.forEach { new_fav in
//                            self.crateFav(recipeId: new_fav.key)
//                        }
//                    }
//                case .failure(let error):
//                    print("Got failed result with \(error.errorDescription)")
//                }
//            case .failure(let error):
//                print("Got failed event with error \(error)")
//            }
//        }
//
//        self.getInitFavs()
//    }
    
//    func crateFav(recipeId: String) {
//        let fav = Fav(
//            userID: UserDefaults.standard.string(forKey: "sub")!,
//            recipeID: recipeId
//        )
//        Amplify.API.mutate(request: .create(fav)) { event in
//            switch event {
//            case .success(let result):
//                switch result {
//                case .success(let fav):
//                    print("Successfully created fav: \(fav)")
//                    self.localFavs[recipeId] = recipeId
//                case .failure(let error):
//                    print("Got failed result with \(error.errorDescription)")
//                }
//            case .failure(let error):
//                print("Got failed event with error \(error)")
//            }
//        }
//    }
//
//    func deleteFav(recipeId: String) {
//        let f = Fav.keys
//        var predicate = QueryPredicateGroup.init()
//        predicate = predicate.and(f.recipeID == recipeId)
//        predicate = predicate.and(f.userID == UserDefaults.standard.string(forKey: "sub"))
//        Amplify.API.mutate(request: .paginatedList(Fav.self, where: predicate, limit:1 )) { event in
//            switch event {
//            case .success(let result):
//                switch result {
//                case .success(let favs):
//                    print("Successfully get favs: \(favs)")
//                    if favs.isEmpty {
//                        return
//                    }
//                    let favorite = favs[0]
//                    Amplify.API.mutate(request: .delete(favorite)) { event in
//                        switch event {
//                        case .success(let result):
//                            switch result {
//                            case .success(let fav):
//                                print("Successfully delete fav: \(fav)")
////                                self.fav.removeValue(forKey: favorite.recipeID)
//                                self.localFavs.removeValue(forKey: favorite.recipeID)
//                            case .failure(let error):
//                                print("Got failed result with \(error.errorDescription)")
//                            }
//                        case .failure(let error):
//                            print("Got failed event with error \(error)")
//                        }
//                    }
//                    //
//                case .failure(let error):
//                    print("Got failed result with \(error.errorDescription)")
//                }
//            case .failure(let error):
//                print("Got failed event with error \(error)")
//            }
//        }
//    }
        
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
////                print("\n\n\n")
////                print("\(try! changes.toJSON())")
////                print("\n\n\n")
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
////        let create_at = recipe.createdAt?.foundationDate
////        let update_at = recipe.updatedAt?.foundationDate
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
//            userId:recipe.user,
//            title:recipe.title,
//            protein:String(recipe.protein),
//            fat:String(recipe.fat),
//            carbo:String(recipe.carbo),
//            state:recipe.state,
//            materials:recipe.materials,
//            contents:pro,
//            reviews: rev,
//            image:recipe.image ?? "",
////            create_at:formatter.string(from:create_at ?? now) as String,
////            update_at:formatter.string(from:update_at ?? now) as String
//            create_at: recipe.createdAt!,
//            update_at: recipe.updatedAt!
//        )
//        if !self.fav.keys.contains(recipe.id) {
//            self.fav[recipe.id] = recipeData
//        }
//    }
//
//    private func deleteRecipeFromArray(_ recipe: Recipe) {
//        self.fav.removeValue(forKey: recipe.id)
//    }
//
//    private func updateRecipeInArray(_ recipe: Recipe) {
//        print("update?")
//        let formatter: DateFormatter = DateFormatter()
//        formatter.calendar = Calendar(identifier: .gregorian)
//        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
//        let now = Date()
////        let create_at = recipe.createdAt?.foundationDate
////        let update_at = recipe.updatedAt?.foundationDate
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
//            userId:recipe.user,
//            title:recipe.title,
//            protein:String(recipe.protein),
//            fat:String(recipe.fat),
//            carbo:String(recipe.carbo),
//            state:recipe.state,
//            materials:recipe.materials,
//            contents:pro,
//            reviews: rev,
//            image:"https://swiftuitest5b4cb74822c44959a59f71a3c8291f93102838-dev.s3.ap-northeast-1.amazonaws.com/public/\(recipe.image)",
////            create_at:formatter.string(from:create_at ?? now) as String,
////            update_at:formatter.string(from:update_at ?? now) as String
//            create_at: recipe.createdAt!,
//            update_at: recipe.updatedAt!
//        )
//        self.fav[recipe.id] = recipeData
//    }
    
    func temp() {
        //        Amplify.DataStore.query(Recipe.self){
        //            switch $0 {
        //            case .success(let result):
        //                // result will be of type [Post]
        //                print("Recipes count: \(result.count)")
        //            case .failure(let error):
        //                print("Error on query() for type Post - \(error.localizedDescription)")
        //            }
        //        }
                
                
        //        Amplify.Auth.fetchAuthSession { result in
        //            do {
        //                let session = try result.get()
        //
        //                // Get user sub or identity id
        //                if let identityProvider = session as? AuthCognitoIdentityProvider {
        //                    let usersub = try identityProvider.getUserSub().get()
        //                    let identityId = try identityProvider.getIdentityId().get()
        //                    print("User sub - \(usersub) and identity id \(identityId)")
        //                }
        //            } catch {
        //                print("Fetch auth session failed with error - \(error)")
        //            }
        //        }
                
        //        Amplify.Auth.fetchUserAttributes() { result in
        //            switch result {
        //            case .success(let attributes):
        //                for attribute in attributes {
        //                    if attribute.key.rawValue == "sub" {
        //                        print(attribute.value)
        //                    }
        //                }
        //            case .failure(let error):
        //                print("Fetching user attributes failed with error \(error)")
        //            }
        //        }
                
//            var pro:[Procedure] = []
//            var rev:[Review] = []
//            for procedure in item.contents {
//                pro.append(procedure)
//            }
//            for review in item.reviews {
//                rev.append(review)
//            }
//            self.fav[item.id] = RecipeData(
//                id:item.id,
//                userId:item.userId,
//                title:item.title,
//                protein:String(item.protein),
//                fat:String(item.fat),
//                carbo:String(item.carbo),
//                state:item.state,
//                materials:item.materials,
//                contents:pro,
//                reviews: rev,
//                image:"https://swiftuitest5b4cb74822c44959a59f71a3c8291f93102838-dev.s3.ap-northeast-1.amazonaws.com/public/\(item.image)",
//                create_at:item.create_at,
//                update_at:item.update_at
//            )
    }
}
