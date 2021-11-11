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
    
    var currentPage: List<Recipe>?
    var protein:Double = 0.0
    var fat:Double = 0.0
    var carbo:Double = 0.0
    var state:Int = 2
    var keyword:String = ""
    var sort:Int = 0
  
    func fetchData(protein:Double,fat:Double,carbo:Double,state:Int,keyword:String,sort:Int) {
        self.recipes = []
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
        let now = Date()
        
        let r = Recipe.keys
        var predicate = QueryPredicateGroup.init()
        predicate = predicate.and(r.state == state)
        predicate = predicate.and(r.delFlg == 0)
        self.state = state
        
        
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
        
//        Amplify.API.query(request: .)
        switch sort {
        case 0:
//            getPaginatedList(predicate: predicate)
            getRecentOrdered(
                protein: protein,
                fat: fat,
                carbo: carbo,
                state: state,
                keyword: keyword
            )
            break
        case 1:
            getProteinOrdered(
                protein: protein,
                fat: fat,
                carbo: carbo,
                state: state,
                keyword: keyword
            )
            break
        case 2:
            getFatOrdered(
                protein: protein,
                fat: fat,
                carbo: carbo,
                state: state,
                keyword: keyword
            )
            break
        case 3:
            getCarboOrdered(
                protein: protein,
                fat: fat,
                carbo: carbo,
                state: state,
                keyword: keyword
            )
            break
        default:
            break
        }
    }
    
    func getPaginatedList(predicate: QueryPredicateGroup) {
        Amplify.API.query(request: .paginatedList(Recipe.self, where: predicate, limit: 10)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipes):
                    print(recipes.count)
                    print("getPaginatedList")
                    print("Successfully retrieved list of recipes:")
                    self.currentPage = recipes
                    if (recipes.count == 0) {
                        self.listNextPage()
                    }
                    recipes.forEach { item in
                        print("recipeeeee")
                        print(item)
                        
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                        Amplify.Storage.downloadData(key: item.image,options: options) { result in
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
    
    func listNextPage() {
        print("listNextPage")
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
        let now = Date()
        if let current = currentPage, current.hasNextPage() {
            print("get nexttt")
            current.getNextPage { result in
                switch result {
                case .success(let recipes):
                    recipes.forEach { item in
                        print(item)
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                        Amplify.Storage.downloadData(key: item.image,options: options) { result in
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
                    self.currentPage = recipes
                case .failure(let coreError):
                    print("Failed to get next page \(coreError)")
                }
            }
        }
    }
    
    func getProteinOrdered(
        protein:Double,
        fat:Double,
        carbo:Double,
        state:Int,
        keyword:String
    ) {
        Amplify.API.query(request: .getRecipesByProtein(protein: protein, fat: fat, carbo: carbo, state: state, keyword: keyword)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipes):
                    print("getProteinOrdered")
                    print("Successfully retrieved list of protein ordered recipes:")
                    self.currentPage = recipes
                    recipes.forEach { item in
                        print("recipeeeee")
                        print(item)
                        
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                        Amplify.Storage.downloadData(key: item.image,options: options) { result in
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
        keyword:String
    ) {
        Amplify.API.query(request: .getRecipesByFat(protein: protein, fat: fat, carbo: carbo, state: state, keyword: keyword)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipes):
                    print("getFatOrdered")
                    print("Successfully retrieved list of fat ordered recipes:")
                    self.currentPage = recipes
                    recipes.forEach { item in
                        print("recipeeeee")
                        print(item)
                        
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                        Amplify.Storage.downloadData(key: item.image,options: options) { result in
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
        keyword:String
    ) {
        Amplify.API.query(request: .getRecipesByCarbo(protein: protein, fat: fat, carbo: carbo, state: state, keyword: keyword)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipes):
                    print("getCarboOrdered")
                    print("Successfully retrieved list of carbo ordered recipes:")
                    self.currentPage = recipes
                    recipes.forEach { item in
                        print("recipeeeee")
                        print(item)
                        
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                        Amplify.Storage.downloadData(key: item.image,options: options) { result in
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
        keyword:String
    ) {
        Amplify.API.query(request: .getRecipesByDate(protein: protein, fat: fat, carbo: carbo, state: state, keyword: keyword)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let query):
                    print("getRecentOrdered")
                    print("Successfully retrieved list of recent ordered recipes:")
                    let recipes = query.getItems()
                    self.token = query.getNextToken()
                    recipes.forEach { item in
                        print("recipeeeee")
                        print(item.title)
                        
                        DispatchQueue.main.async {
                            self.recipes.append(RecipeData(
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
                        Amplify.Storage.downloadData(key: item.image,options: options) { result in
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
//                    print(query.getNextToken())
                    let recipes = query.getItems()
                    self.token = query.getNextToken()
                    print("Successfully retrieved next list of recent recipes:")
//                    print(recipes)
                    
                    recipes.forEach { item in
                        print("next recipeeeee")
                        print(item.title)

                        DispatchQueue.main.async {
                            self.recipes.append(
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
}

extension GraphQLRequest
{
    static func getRecipesByProtein(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = "",
        nextToken: String = ""
    ) -> GraphQLRequest<List<Recipe>>
    {
        let document = """
        query RecipesByProtein($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String) {
            recipesByProtein(
                type: "Recipe",
                protein: {ge: $protein},
                filter: {state: {eq: $state}, fat: {le: $fat}, carbo:{le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 10,
                sortDirection: DESC
            ) {
                items {
                    id
                    user
                    type
                    title
                    protein
                    fat
                    carbo
                    state
                    materials
                    image
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<List<Recipe>>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword
            ],
            responseType: List<Recipe>.self,
            decodePath: "recipesByProtein"
        )
    }
    
    static func getRecipesByFat(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = "",
        nextToken: String = ""
    ) -> GraphQLRequest<List<Recipe>>
    {
        let document = """
        query RecipesByFat($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String) {
            recipesByFat(
                type: "Recipe",
                fat: {le: $fat},
                filter: {state: {eq: $state}, protein: {ge: $protein}, carbo:{le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 10,
                sortDirection: ASC
            ) {
                items {
                    id
                    user
                    type
                    title
                    protein
                    fat
                    carbo
                    state
                    materials
                    image
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<List<Recipe>>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword
            ],
            responseType: List<Recipe>.self,
            decodePath: "recipesByFat"
        )
    }
    
    static func getRecipesByCarbo(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = "",
        nextToken: String = ""
    ) -> GraphQLRequest<List<Recipe>>
    {
        let document = """
        query RecipesByCarbo($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String) {
            recipesByCarbo(
                type: "Recipe",
                carbo:{le: $carbo},
                filter: {state: {eq: $state}, protein: {ge: $protein}, fat: {le: $fat}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 20,
                sortDirection: ASC
            ) {
                items {
                    id
                    user
                    type
                    title
                    protein
                    fat
                    carbo
                    state
                    materials
                    image
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<List<Recipe>>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword
            ],
            responseType: List<Recipe>.self,
            decodePath: "recipesByCarbo"
        )
    }
    
    static func getRecipesByDate(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = ""
    ) -> GraphQLRequest<QueryList>
    {
        let document = """
        query RecipesByDate($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String) {
            recipesByDate(
                type: "Recipe",
                filter: {state: {eq: $state}, protein: {ge: $protein}, fat: {le: $fat}, carbo: {le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 10,
                sortDirection: DESC
            ) {
                items {
                    id
                    user
                    type
                    title
                    protein
                    fat
                    carbo
                    state
                    materials
                    image
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryList>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword
            ],
            responseType: QueryList.self,
            decodePath: "recipesByDate"
        )
    }
    
    static func getRecipesByDateNextPage(
        protein: Double,
        fat: Double,
        carbo: Double,
        state: Int,
        keyword: String = "",
        nextToken: String = ""
    ) -> GraphQLRequest<QueryList>
    {
        let document = """
        query RecipesByDate($state:Int,$protein:Float,$fat:Float,$carbo:Float,$keyword:String,$nextToken:String) {
            recipesByDate(
                type: "Recipe",
                filter: {state: {eq: $state}, protein: {ge: $protein}, fat: {le: $fat}, carbo: {le: $carbo}, materials: {contains: $keyword}, delFlg:{eq: 0}},
                limit: 10,
                sortDirection: DESC
                nextToken: $nextToken
            ) {
                items {
                    id
                    user
                    type
                    title
                    protein
                    fat
                    carbo
                    state
                    materials
                    image
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryList>(
            document: document,
            variables: [
                "state": state,
                "protein": protein == 0.0 ? -1000.0 : protein,
                "fat": fat == 0.0 ? 1000.0 : fat,
                "carbo": carbo == 0.0 ? 1000.0 : carbo,
                "keyword": keyword,
                "nextToken": nextToken
            ],
            responseType: QueryList.self,
            decodePath: "recipesByDate"
        )
    }
    
    static func getMyRecipesByDate(userid:String) -> GraphQLRequest<QueryList>
    {
        let document = """
        query RecipesByDate($userid:String!, $flg:Int!) {
            recipesByDate(
                type: "Recipe",
                filter: {user: {eq: $userid}, delFlg: {eq: $flg}},
                limit: 10,
                sortDirection: DESC
            ) {
                items {
                    id
                    user
                    type
                    title
                    protein
                    fat
                    carbo
                    state
                    materials
                    image
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryList>(
            document: document,
            variables: [
                "userid": userid,
                "flg": 0,
            ],
            responseType: QueryList.self,
            decodePath: "recipesByDate"
        )
    }
    
    static func getMyRecipesByDateNextPage(userid:String, nextToken: String = "") -> GraphQLRequest<QueryList>
    {
        let document = """
        query RecipesByDate($userid:String!, $flg:Int!, $nextToken:String!) {
            recipesByDate(
                type: "Recipe",
                filter: {user: {eq: $userid}, delFlg: {eq: $flg}},
                limit: 10,
                sortDirection: DESC
                nextToken: $nextToken
            ) {
                items {
                    id
                    user
                    type
                    title
                    protein
                    fat
                    carbo
                    state
                    materials
                    image
                    favNum
                    createdAt
                    updatedAt
                    delFlg
                }
                nextToken
            }
        }
        """
        return GraphQLRequest<QueryList>(
            document: document,
            variables: [
                "userid": userid,
                "flg": 0,
                "nextToken": nextToken
            ],
            responseType: QueryList.self,
            decodePath: "recipesByDate"
        )
    }
    
    static func getRecipeForDetail(id: String)-> GraphQLRequest<Recipe>
    {
        let document = """
        query getRecipe($id: ID!) {
            getRecipe(
                id: $id
            ) {
                id
                user
                type
                title
                protein
                fat
                carbo
                state
                materials
                reviews(limit: 3){
                    items {
                        content
                        createdAt
                        id
                        image
                        recipeID
                        updatedAt
                    }
                }
                contents {
                    items {
                        content
                        createdAt
                        id
                        image
                        order
                        recipeID
                        updatedAt
                    }
                }
                image
                favNum
                createdAt
                updatedAt
                delFlg
            }
        }
        """
        return GraphQLRequest<Recipe>(
            document: document,
            variables: [
                "id": id
            ],
            responseType: Recipe.self
            ,decodePath: "getRecipe"
        )
    }
}

class QueryList: Decodable {
    private var items: List<Recipe> = []
    private var nextToken: String? = ""

    public func getItems() -> List<Recipe> { return items; }
    public func getNextToken() -> String {
//        if (nextToken is NSNull) {
//            return nil
//        }
        return nextToken ?? ""
    }
}
