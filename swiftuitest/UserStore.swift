//
//  UserStore.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/07/30.
//

//import SwiftUI
import Combine
import Amplify
import AWSPluginsCore
import Foundation

class UserStore: ObservableObject {
    @Published var isLogged = UserDefaults.standard.bool(forKey: "isLogged"){
        didSet {
            UserDefaults.standard.set(isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = false
    @Published var sub = UserDefaults.standard.string(forKey: "sub"){
        didSet {
            UserDefaults.standard.set(sub, forKey: "sub")
        }
    }
    
    @Published var myRecipes:[RecipeData] = []
    @Published var imageDatum = [String:Data]()
    @Published var userDatum = [String:Data]()
    
    @Published var username = UserDefaults.standard.string(forKey: "username"){
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    @Published var description = UserDefaults.standard.string(forKey: "description"){
        didSet {
            UserDefaults.standard.set(description, forKey: "description")
        }
    }
    @Published var image = UserDefaults.standard.object(forKey: "profile") as? Data ?? nil {
        didSet {
            UserDefaults.standard.set(image, forKey: "profile")
        }
    }
    // fav
    @Published var fav:[String:RecipeData] = [:]
    @Published var favImageDatum = [String:Data]()
    @Published var localFavs:[String:String] = (UserDefaults.standard.dictionary(forKey: "favs") ?? [:]) as! [String:String]{
        didSet {
            UserDefaults.standard.set(localFavs, forKey: "favs")
            self.getInitFavs()
        }
    }
    @Published var token: String = ""
    
    var currentPage: List<Recipe>?
    
    init(){
        if (isLogged) {
            self.getFavs()
            self.getMyRecipes()
        }
    }
    
    func resetAllPublished() {
        self.isLogged = false
        self.sub = nil
        self.myRecipes = []
        self.imageDatum = [:]
        self.username = nil
        self.description = nil
        self.image = nil
        self.fav = [:]
        self.favImageDatum = [:]
        self.localFavs = [:]
    }
    
    func getMyRecipes() {
        print("getMyRecipes")
        // main threadで！！！
        self.myRecipes = []
        Amplify.API.query(request:.getMyRecipesByDate(userid: self.sub!)
        ) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("Successfully retrieved my list of recipes:")
//                    print(query.getNextToken())
                    let recipes = query.getItems()
                    self.token = query.getNextToken()
                    recipes.forEach { item in
                        print("my recipeeeee")
                        print(item.title)

                        DispatchQueue.main.async {
                            self.myRecipes.append(
                                RecipeData(
                                    id:item.id,
                                    userId:item.user,
                                    title:item.title,
                                    protein:String(item.protein),
                                    fat:String(item.fat),
                                    carbo:String(item.carbo),
                                    state:item.state,
                                    materials:item.materials,
                                    contents:[],
                                    reviews: [],
                                    image:item.image,
                                    favNum: item.favNum,
                                    create_at: item.createdAt!,
                                    update_at: item.updatedAt!,
                                    delFlg: item.delFlg
                                ))
                        }
                        let options = StorageDownloadDataRequest.Options(accessLevel: .guest)
                        Amplify.Storage.downloadData(key: item.image, options: options) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.imageDatum[item.id] = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                        // profile image
                        Amplify.Storage.downloadData(key: "users/\(item.user).jpg", options: options) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.userDatum[item.id] = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                    }
                case .failure(let error):
                    print("Got failed recent result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed recent event with error \(error)")
            }
        }
    }
    
    func listNextPage(nextToken: String) {
        print("listNextPage")
        Amplify.API.query(request:.getMyRecipesByDateNextPage(userid: self.sub!, nextToken: nextToken)
        ) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
//                    print(query.getNextToken())
                    let recipes = query.getItems()
                    self.token = query.getNextToken()
                    print("Successfully retrieved next list of recipes:")
//                    print(recipes)
                    
                    recipes.forEach { item in
                        print("next recipeeeee")
                        print(item.title)

                        DispatchQueue.main.async {
                            self.myRecipes.append(
                                RecipeData(
                                    id:item.id,
                                    userId:item.user,
                                    title:item.title,
                                    protein:String(item.protein),
                                    fat:String(item.fat),
                                    carbo:String(item.carbo),
                                    state:item.state,
                                    materials:item.materials,
                                    contents:[],
                                    reviews: [],
                                    image:item.image,
                                    favNum: item.favNum,
                                    create_at: item.createdAt!,
                                    update_at: item.updatedAt!,
                                    delFlg: item.delFlg
                                ))
                        }
                        let options = StorageDownloadDataRequest.Options(accessLevel: .guest)
                        Amplify.Storage.downloadData(key: item.image, options: options) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.imageDatum[item.id] = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                        // profile image
                        Amplify.Storage.downloadData(key: "users/\(item.user).jpg", options: options) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.userDatum[item.id] = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                    }
                case .failure(let error):
                    print("Got failed get next result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed get next event with error \(error)")
            }
        }
    }
    
    func getAuthInfo(email: String) {
        let u = User.keys
        let user_predicate = u.email == email
        Amplify.API.query(request: .list(User.self, where: user_predicate)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let users):
                    print("Successfully retrieved list of users: \(users)")
                    let user = users[0]
                    DispatchQueue.main.async {
                        self.sub = user.id
                        self.username = user.displayName
                        self.description = user.description
//                        UserDefaults.standard.set(user.id, forKey: "sub")
//                        UserDefaults.standard.set(user.displayName, forKey: "username")
                        print("sub")
                        print(self.sub)
                        let options = StorageDownloadDataRequest.Options(accessLevel: .guest)
                        Amplify.Storage.downloadData(key: "users/\(user.id).jpg", options: options) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.image = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                        
                        let fav = Fav.keys
                        let predicate = fav.userID == self.sub
                        var local_favs_dict:[String:String] = [:]
                        Amplify.API.query(request: .list(Fav.self, where: predicate)) { event in
                            switch event {
                            case .success(let result):
                                switch result {
                                case .success(let favs):
                                    print("Successfully retrieved list of favs: \(favs)")
                                    favs.forEach { fav in
                                        local_favs_dict[fav.recipeID] = fav.recipeID
                                    }
                                    DispatchQueue.main.async{
                                        self.localFavs = local_favs_dict
                                    }
                                case .failure(let error):
                                    print("Got failed result with \(error.errorDescription)")
                                }
                            case .failure(let error):
                                print("Got failed event with error \(error)")
                            }
                        }
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
        //        Amplify.Auth.fetchAuthSession { result in
        //            do {
        //                print("Fetch auth sessionnnnnn")
        //                let session = try result.get()
        //                // Get user sub
        //                if let identityProvider = session as? AuthCognitoIdentityProvider {
        //                    usersub = try identityProvider.getUserSub().get()
        //                    print("sub inside getAuthInfo")
        //                    print(usersub)
        //                    DispatchQueue.main.async {
        //                        self.sub = usersub
        //                        UserDefaults.standard.set(usersub, forKey: "sub")
        //                    }
        //                }
        //            } catch {
        //                print("Fetch auth session failed with error - \(error)")
        //            }
        //        }
    }
    
    func getInitFavs() {
        print("init favsssss")
        print(self.localFavs)
        self.localFavs.forEach { item in
            Amplify.API.query(request: .get(Recipe.self, byId: item.key)) { event in
                switch event {
                case .success(let result):
                    switch result {
                    case .success(let recipe):
                        guard let recipe = recipe else {
                            print("Could not find recipe")
                            return
                        }
                        print("Successfully retrieved recipe:\(recipe)")
                            
                        DispatchQueue.main.async {
                            self.fav[recipe.id] = RecipeData(
                                id: recipe.id,
                                userId: recipe.user,
                                title: recipe.title,
                                protein: String(recipe.protein),
                                fat: String(recipe.fat),
                                carbo: String(recipe.carbo),
                                state: recipe.state,
                                materials: recipe.materials,
                                contents: [],
                                reviews: [],
                                image: recipe.image,
                                favNum: recipe.favNum,
                                create_at: recipe.createdAt!,
                                update_at: recipe.updatedAt!,
                                delFlg: recipe.delFlg
                            )
                        }
                        let options = StorageDownloadDataRequest.Options(accessLevel: .guest)
                        Amplify.Storage.downloadData(key: recipe.image,options: options) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.favImageDatum[recipe.id] = imageData
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                    case .failure(let error):
                        print("Got failed result with \(error.errorDescription)")
                        print(error.recoverySuggestion)
                        print(error.debugDescription)
                    }
                case .failure(let error):
                    print("Got failed event with error \(error)")
                }
            }
        }
    }
    
    func getFavs() {
        print("get favsss")
        print(self.localFavs)
        var tmp_favs = self.localFavs
        let fav = Fav.keys
        let predicate = fav.userID == UserDefaults.standard.string(forKey: "sub")
        Amplify.API.query(request: .list(Fav.self, where: predicate)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let favs):
                    print("Successfully retrieved list of favs: \(favs)")
                    favs.forEach { fav in
                        if !self.localFavs.keys.contains(fav.recipeID) {
                            // delete
                            self.deleteFav(recipeId: fav.recipeID)
                        } else {
                            tmp_favs.removeValue(forKey: fav.recipeID)
                        }
                    }
                    if !tmp_favs.isEmpty {
                        tmp_favs.forEach { new_fav in
                            self.crateFav(recipeId: new_fav.key)
                        }
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
        self.getInitFavs()
    }
    
    func crateFav(recipeId: String) {
        let fav = Fav(
            userID: UserDefaults.standard.string(forKey: "sub")!,
            recipeID: recipeId
        )
        Amplify.API.mutate(request: .create(fav)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let fav):
                    print("Successfully created fav: \(fav)")
                    self.localFavs[recipeId] = recipeId
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func deleteFav(recipeId: String) {
        let f = Fav.keys
        var predicate = QueryPredicateGroup.init()
        predicate = predicate.and(f.recipeID == recipeId)
        predicate = predicate.and(f.userID == UserDefaults.standard.string(forKey: "sub"))
        Amplify.API.mutate(request: .paginatedList(Fav.self, where: predicate, limit:1 )) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let favs):
                    print("Successfully get favs: \(favs)")
                    if favs.isEmpty {
                        return
                    }
                    let favorite = favs[0]
                    Amplify.API.mutate(request: .delete(favorite)) { event in
                        switch event {
                        case .success(let result):
                            switch result {
                            case .success(let fav):
                                print("Successfully delete fav: \(fav)")
//                                self.fav.removeValue(forKey: favorite.recipeID)
                                self.localFavs.removeValue(forKey: favorite.recipeID)
                            case .failure(let error):
                                print("Got failed result with \(error.errorDescription)")
                            }
                        case .failure(let error):
                            print("Got failed event with error \(error)")
                        }
                    }
                    //
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
}
