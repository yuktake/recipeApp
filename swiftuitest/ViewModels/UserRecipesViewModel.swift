//
//  UserRecipesViewModel.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/10/07.
//

import Foundation
import Combine
import Amplify
import AWSPluginsCore

class UserRecipesViewModel: ObservableObject {
    @Published var recipes = [RecipeData]()
    @Published var imageDatum = [String:Data]()
    @Published var firstLoad = true
    
    var currentPage: List<Recipe>?
    
    func fetchData() {
        self.recipes = []
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
        let now = Date()
        
        let r = Recipe.keys
        var predicate = QueryPredicateGroup.init()
        let user_id = UserDefaults.standard.string(forKey: "sub")
        predicate = predicate.and(r.user == user_id)
        predicate = predicate.and(r.delFlg == 0)
        
        
        Amplify.API.query(request: .paginatedList(Recipe.self, where: predicate, limit:10)) { event in
//        Amplify.API.query(request: .search(Recipe.self, sort)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipes):
                    print("Successfully retrieved list of recipes: \(recipes.count)")
                    self.currentPage = recipes
                    recipes.forEach { item in
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
                        Amplify.Storage.downloadData(key: item.image) { result in
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
                    print("self.recipes")
                    print(self.recipes)
                    self.firstLoad = false
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
                    self.currentPage = recipes
                    recipes.forEach { item in
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
                        Amplify.Storage.downloadData(key: item.image) { result in
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
                case .failure(let coreError):
                    print("Failed to get next page \(coreError)")
                }
            }
        }
    }
    
}
