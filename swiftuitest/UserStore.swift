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
// Listのエラー対策
//import SwiftUI

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
    // 使わない？
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
    @Published var fav = [String:RecipeData]()
    @Published var favRecipes:[FavData] = []
    @Published var favImageDatum = [String:Data]()
    @Published var localFavs:[String:String] = [:]
    @Published var favArray:[String] = []
    @Published var token: String = ""
    @Published var favToken: String = ""
    
    var currentPage: List<Recipe>?
    
    init(){
        if (isLogged) {
            self.getMyRecipes()
            self.getFavsFromServer()
        }
    }
    
    func asyncProcess(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
    
    func getFavsFromServer() {
        let group = DispatchGroup()
        Amplify.API.query(request: .getFavsByDate(userId: self.sub!)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    let favs = query.getItems()
                    DispatchQueue.main.async {
                        self.favToken = query.getNextToken()
                    }
                    print("Successfully retrieved list of favs: \(favs)")
                    favs.forEach { fav in
                        group.enter()
                        self.asyncProcess() { () -> Void in
                            DispatchQueue.main.async{
                                if !self.favRecipes.contains(where: {$0.id == fav.recipeID}) {
                                    self.favRecipes.append(FavData(id: fav.recipeID))
                                }
                            }
                            Amplify.Storage.downloadData(key: "recipes/\(fav.recipeID).jpg") { result in
                                switch result {
                                case .success(let imageData):
                                    DispatchQueue.main.async{
                                        self.favImageDatum[fav.recipeID] = imageData
                                    }
                                    group.leave()
                                case .failure(let error):
                                    print("Failed to download image data - \(error)")
                                }
                            }
                            print("get recipe detail")
                        }
                    }
                    group.notify(queue: .main) {
                        print("doneeeeeeeeeeeeeee")
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func getFavsFromServerNextPage(nextToken: String) {
        print("listFavNextPage")
        let group = DispatchGroup()
        Amplify.API.query(request:.getFavsByDateNextPage(userid: self.sub!, nextToken: nextToken)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    let favs = query.getItems()
                    DispatchQueue.main.async {
                        self.favToken = query.getNextToken()
                    }
                    print("Successfully retrieved next list of favs:")
                    
                    favs.forEach { fav in
                        print(fav.recipeID)
                        group.enter()
                        self.asyncProcess() { () -> Void in
                            DispatchQueue.main.async{
                                if !self.favRecipes.contains(where: {$0.id == fav.recipeID}) {
                                    self.favRecipes.append(FavData(id: fav.recipeID))
                                }
                            }
                            Amplify.Storage.downloadData(key: "recipes/\(fav.recipeID).jpg") { result in
                                switch result {
                                case .success(let imageData):
                                    DispatchQueue.main.async{
                                        self.favImageDatum[fav.recipeID] = imageData
                                    }
                                    group.leave()
                                case .failure(let error):
                                    print("Failed to download image data - \(error)")
                                }
                            }
                            print("get next recipe detail")
                        }
                    }
                    group.notify(queue: .main) {
                        print("next doneeeeeeeeeeeeeee")
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
    
    func resetAllPublished() {
        self.isLogged = false
        self.sub = nil
        self.myRecipes = []
        self.imageDatum = [:]
        self.username = nil
        self.description = nil
        self.image = nil
        self.fav = [:]
//        self.fav = []
        self.favImageDatum = [:]
        self.localFavs = [:]
    }
    
    func getMyRecipes() {
        print("getMyRecipes")
        // main threadで！！！
        DispatchQueue.main.async {
            self.myRecipes = []
        }
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
                        DispatchQueue.main.async {
                            if !self.myRecipes.contains(where: {$0.id == item.id}) {
                                self.myRecipes.append(
                                    RecipeData(
                                        id:item.id,
                                        userId:item.user,
                                        title:item.title,
                                        calorie: String(item.calorie),
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
                        }
                        Amplify.Storage.downloadData(key: "recipes/\(item.id).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.imageDatum[item.id] = imageData
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
        Amplify.API.query(request:.getMyRecipesByDateNextPage(userid: self.sub!, nextToken: nextToken)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    let recipes = query.getItems()
                    DispatchQueue.main.async {
                        self.token = query.getNextToken()
                    }
                    print("Successfully retrieved next list of recipes:")
                    recipes.forEach { item in
                        print("next recipeeeee")
                        print(item.title)

                        DispatchQueue.main.async {
                            if !self.myRecipes.contains(where: {$0.id == item.id}) {
                                self.myRecipes.append(
                                    RecipeData(
                                        id:item.id,
                                        userId:item.user,
                                        title:item.title,
                                        calorie: String(item.calorie),
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
                        }
                        Amplify.Storage.downloadData(key: "recipes/\(item.image).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.imageDatum[item.id] = imageData
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
                        Amplify.Storage.downloadData(key: "users/\(user.id).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.image = imageData
                                }
                                self.getMyRecipes()
                                self.getFavsFromServer()
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
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
    }
}
