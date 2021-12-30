//
//  RecipesViewModel.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/08/01.
//

import Foundation
import Combine
import Amplify
import AWSPluginsCore

class RecipesViewModel: ObservableObject {
    @Published var recipes = [RecipeData]()
    @Published var imageDatum = [String:Data]()
    @Published var token: String = ""
    @Published var next = true
    @Published var searched = false
    
    var currentPage: List<Recipe>?
    var protein:Double = 0.0
    var fat:Double = 0.0
    var carbo:Double = 0.0
    var state:Int = 2
    var keyword:String = ""
    var sort:Int = 0
  
    func fetchData(protein:Double,fat:Double,carbo:Double,state:Int,keyword:String,sort:Int) {
        self.recipes = []
        
        let r = Recipe.keys
        var predicate = QueryPredicateGroup.init()
        predicate = predicate.and(r.state == state)
        predicate = predicate.and(r.delFlg == 0)
        self.state = state
        let group = DispatchGroup()
        
        if (protein != 0.0) {
            print("protein")
            self.protein = protein
            predicate = predicate.and(r.protein > protein)
        }
        if (fat != 0.0) {
            print("fat")
            self.fat = fat
            predicate = predicate.and(r.fat < fat)
        }
        if (carbo != 0.0) {
            print("carbo")
            self.carbo = carbo
            predicate = predicate.and(r.carbo < carbo)
        }
        if (!keyword.isEmpty) {
            print("keyword")
            self.keyword = keyword
            predicate = predicate.and(r.title.contains(keyword) || r.materials.contains(keyword))
        }
        
        group.enter()
        switch sort {
        case 0:
            getRecentOrdered(
                protein: protein,
                fat: fat,
                carbo: carbo,
                state: state,
                keyword: keyword,
                group: group
            )
            break
        case 1:
            getProteinOrdered(
                protein: protein,
                fat: fat,
                carbo: carbo,
                state: state,
                keyword: keyword,
                group: group
            )
            break
        case 2:
            getFatOrdered(
                protein: protein,
                fat: fat,
                carbo: carbo,
                state: state,
                keyword: keyword,
                group: group
            )
            break
        case 3:
            getCarboOrdered(
                protein: protein,
                fat: fat,
                carbo: carbo,
                state: state,
                keyword: keyword,
                group: group
            )
            break
        case 4:
            getFavOrdered(
                protein: protein,
                fat: fat,
                carbo: carbo,
                state: state,
                keyword: keyword,
                group: group
            )
        default:
            break
        }
        group.notify(queue: .main) {
            DispatchQueue.main.async {
                self.searched = true
            }
        }
    }
    
    func getNext(sort: Int) {
        switch sort {
        case 0:
            listNextRecentPage()
            break
        case 1:
            listNextProteinOrderedPage()
            break
        case 2:
            listNextFatOrderedPage()
            break
        case 3:
            listNextCarboOrderedPage()
            break
        case 4:
            listNextFavOrderedPage()
            break
        default:
            break
        }
    }
    
    func getProteinOrdered(
        protein:Double,
        fat:Double,
        carbo:Double,
        state:Int,
        keyword:String,
        group:DispatchGroup
    ) {
        Amplify.API.query(request: .getRecipesByProtein(protein: protein, fat: fat, carbo: carbo, state: state, keyword: keyword)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("getProteinOrdered")
                    print("Successfully retrieved list of protein ordered recipes:")
                    let recipes = query.getItems()
                    let token = query.getNextToken()
//                    self.currentPage = recipes
                    DispatchQueue.main.async {
                        if token.isEmpty {
                            self.next = false
                        }
                        self.token = token
                    }
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                                favNum: item.favNum,
                                create_at: item.createdAt!,
                                update_at: item.updatedAt!,
                                delFlg: item.delFlg
                            ))
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
                    print("Got failed result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func getFatOrdered(
        protein:Double,
        fat:Double,
        carbo:Double,
        state:Int,
        keyword:String,
        group:DispatchGroup
    ) {
        Amplify.API.query(request: .getRecipesByFat(protein: protein, fat: fat, carbo: carbo, state: state, keyword: keyword)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("getFatOrdered")
                    print("Successfully retrieved list of fat ordered recipes:")
                    let recipes = query.getItems()
                    let token = query.getNextToken()
//                    self.currentPage = recipes
                    DispatchQueue.main.async {
                        if token.isEmpty {
                            self.next = false
                        }
                        self.token = token
                    }
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                                favNum: item.favNum,
                                create_at: item.createdAt!,
                                update_at: item.updatedAt!,
                                delFlg: item.delFlg
                            ))
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
                    print("Got failed result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func getCarboOrdered(
        protein:Double,
        fat:Double,
        carbo:Double,
        state:Int,
        keyword:String,
        group:DispatchGroup
    ) {
        Amplify.API.query(request: .getRecipesByCarbo(protein: protein, fat: fat, carbo: carbo, state: state, keyword: keyword)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("getCarboOrdered")
                    print("Successfully retrieved list of carbo ordered recipes:")
                    let recipes = query.getItems()
                    let token = query.getNextToken()
//                    self.currentPage = recipes
                    DispatchQueue.main.async {
                        if token.isEmpty {
                            self.next = false
                        }
                        self.token = token
                    }
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                                favNum: item.favNum,
                                create_at: item.createdAt!,
                                update_at: item.updatedAt!,
                                delFlg: item.delFlg
                            ))
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
                    print("Got failed result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func getRecentOrdered(
        protein:Double,
        fat:Double,
        carbo:Double,
        state:Int,
        keyword:String,
        group: DispatchGroup
    ) {
        Amplify.API.query(request: .getRecipesByDate(protein: protein, fat: fat, carbo: carbo, state: state, keyword: keyword)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("getRecentOrdered")
                    print("Successfully retrieved list of recent ordered recipes:")
                    let recipes = query.getItems()
                    let token = query.getNextToken()
                    DispatchQueue.main.async {
                        if token.isEmpty {
                            self.next = false
                        }
                        self.token = token
                    }
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                                favNum: item.favNum,
                                create_at: item.createdAt!,
                                update_at: item.updatedAt!,
                                delFlg: item.delFlg
                            ))
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
                    group.leave()
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
    
    func getFavOrdered(
        protein:Double,
        fat:Double,
        carbo:Double,
        state:Int,
        keyword:String,
        group: DispatchGroup
    ) {
        Amplify.API.query(request: .getRecipesByFav(protein: protein, fat: fat, carbo: carbo, state: state, keyword: keyword)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("getRecentOrdered")
                    print("Successfully retrieved list of recent ordered recipes:")
                    let recipes = query.getItems()
                    let token = query.getNextToken()
                    DispatchQueue.main.async {
                        if token.isEmpty {
                            self.next = false
                        }
                        self.token = token
                    }
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                                favNum: item.favNum,
                                create_at: item.createdAt!,
                                update_at: item.updatedAt!,
                                delFlg: item.delFlg
                            ))
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
                    group.leave()
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
    
    func listNextRecentPage() {
        print("listNextRecentPage")
        Amplify.API.query(request:.getRecipesByDateNextPage(
            protein: self.protein,
            fat: self.fat,
            carbo: self.carbo,
            state: self.state,
            keyword: self.keyword,
            nextToken: self.token
        )) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    let recipes = query.getItems()
                    let token = query.getNextToken()
                    DispatchQueue.main.async {
                        if token.isEmpty {
                            self.next = false
                        }
                        self.token = token
                    }
                    print("Successfully retrieved next list of recent recipes:")
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(
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
                                    favNum: item.favNum,
                                    create_at: item.createdAt!,
                                    update_at: item.updatedAt!,
                                    delFlg: item.delFlg
                                ))
                        }
                        Amplify.Storage.downloadData(key: "recipes/\(item.id).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                print("next image success")
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
    
    func listNextProteinOrderedPage() {
        print("listNextProteinOrderedPage")
        Amplify.API.query(request:.getRecipesByProteinOrderedNextPage(
            protein: self.protein,
            fat: self.fat,
            carbo: self.carbo,
            state: self.state,
            keyword: self.keyword,
            nextToken: self.token
        )) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    let recipes = query.getItems()
                    let token = query.getNextToken()
                    DispatchQueue.main.async {
                        if token.isEmpty {
                            self.next = false
                        }
                        self.token = token
                    }
                    print("Successfully retrieved next list of protein ordered recipes:")
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(
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
                                    favNum: item.favNum,
                                    create_at: item.createdAt!,
                                    update_at: item.updatedAt!,
                                    delFlg: item.delFlg
                                ))
                        }
                        Amplify.Storage.downloadData(key: "recipes/\(item.id).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                print("next image success")
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
    
    func listNextFatOrderedPage() {
        print("listNextFatOrderedPage")
        Amplify.API.query(request:.getRecipesByFatOrderedNextPage(
            protein: self.protein,
            fat: self.fat,
            carbo: self.carbo,
            state: self.state,
            keyword: self.keyword,
            nextToken: self.token
        )) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    let recipes = query.getItems()
                    let token = query.getNextToken()
                    DispatchQueue.main.async {
                        if token.isEmpty {
                            self.next = false
                        }
                        self.token = token
                    }
                    print("Successfully retrieved next list of fat ordered recipes:")
                    
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(
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
                                    favNum: item.favNum,
                                    create_at: item.createdAt!,
                                    update_at: item.updatedAt!,
                                    delFlg: item.delFlg
                                ))
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
                    print("Got failed get next result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed get next event with error \(error)")
            }
        }
    }
    
    func listNextCarboOrderedPage() {
        print("listNextCarboOrderedPage")
        Amplify.API.query(request:.getRecipesByCarboOrderedNextPage(
            protein: self.protein,
            fat: self.fat,
            carbo: self.carbo,
            state: self.state,
            keyword: self.keyword,
            nextToken: self.token
        )) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    let recipes = query.getItems()
                    let token = query.getNextToken()
                    DispatchQueue.main.async {
                        if token.isEmpty {
                            self.next = false
                        }
                        self.token = token
                    }
                    print("Successfully retrieved next list of carbo ordered recipes:")
                    
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(
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
                                    favNum: item.favNum,
                                    create_at: item.createdAt!,
                                    update_at: item.updatedAt!,
                                    delFlg: item.delFlg
                                ))
                        }
                        Amplify.Storage.downloadData(key: "recipes/\(item.id).jpg") { result in
                            switch result {
                            case .success(let imageData):
                                print("next image success")
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
    
    func listNextFavOrderedPage() {
        print("listNextFavOrderedPage")
        Amplify.API.query(request:.getRecipesByDateNextPage(
            protein: self.protein,
            fat: self.fat,
            carbo: self.carbo,
            state: self.state,
            keyword: self.keyword,
            nextToken: self.token
        )) { event in
            print(self.token)
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    let recipes = query.getItems()
                    DispatchQueue.main.async {
                        if recipes.count != 20 {
                            self.next = false
                        }
                        self.token = query.getNextToken()
                    }
                    print("Successfully retrieved next list of fav ordered recipes:")
                    
                    recipes.forEach { item in
                        DispatchQueue.main.async {
                            self.recipes.append(
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
                                    favNum: item.favNum,
                                    create_at: item.createdAt!,
                                    update_at: item.updatedAt!,
                                    delFlg: item.delFlg
                                ))
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
                    print("Got failed get next result with \(error.errorDescription)")
                    print(error.recoverySuggestion)
                    print(error.debugDescription)
                }
            case .failure(let error):
                print("Got failed get next event with error \(error)")
            }
        }
    }
}

class QueryRecipes: Decodable {
    private var items: List<Recipe> = []
    private var nextToken: String? = ""

    public func getItems() -> List<Recipe> { return items; }
    public func getNextToken() -> String {
        return nextToken ?? ""
    }
}

class QueryFavs: Decodable {
    private var items: List<Fav> = []
    private var nextToken: String? = ""

    public func getItems() -> List<Fav> { return items; }
    public func getNextToken() -> String {
        return nextToken ?? ""
    }
}

class QueryUsers: Decodable {
    private var items: List<User> = []
    private var nextToken: String? = ""

    public func getItems() -> List<User> { return items; }
    public func getNextToken() -> String {
        return nextToken ?? ""
    }
}
