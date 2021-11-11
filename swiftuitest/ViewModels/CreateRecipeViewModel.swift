//
//  RecipeViewModel.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/08/01.
//

import SwiftUI
import Amplify

class CreateRecipeViewModel: ObservableObject {
    
    @Published var recipe = RecipeData(
        userId: UserDefaults.standard.string(forKey: "sub") ?? "",
        title: "",
        protein: String(0.0),
        fat: String(0.0),
        carbo: String(0.0),
        state: 2,
        materials: "",
        contents: [
            Procedure(order: 1, content: "", image: ""),
        ],
        reviews:[],
        image: "",
        favNum: 0,
        create_at: "",
        update_at: "",
        delFlg: 0
    )
    
    func createRecipe(recipe: RecipeData) {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
        let now = Date()
        
        let amplify_recipe = Recipe(
            id: recipe.id,
            user: recipe.userId,
            type: "Recipe",
            title: recipe.title,
            protein: Double(recipe.protein) ?? 0.0,
            fat: Double(recipe.fat) ?? 0.0,
            carbo: Double(recipe.carbo) ?? 0.0,
            state: recipe.state,
            materials: recipe.materials,
            image: recipe.image,
            favNum: 0,
            delFlg: 0
        )
        
        var procedures: [Procedure] = []
        recipe.contents.forEach{ content in
            procedures.append(Procedure(order: content.order,content: content.content, image: content.image!, recipe: amplify_recipe))
        }
        
        print("upload recipe")
        print(recipe)
        Amplify.API.mutate(request: .create(amplify_recipe)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipe):
                    print("Successfully created recipe: \(recipe)")
                    procedures.forEach{ p in
                        self.createProcedure(procedure: p)
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
        
//        Amplify.DataStore.save(amplify_recipe) { result in
//            switch(result) {
//               case .success(let savedItem):
//                print("Saved item: \(savedItem.title)")
//                for procedure in procedures {
//                    Amplify.DataStore.save(procedure) { procedureResult in
//                        switch procedureResult {
//                        case .success:
//                            print("procedure saved!")
//                        case .failure(let error):
//                            print("procedure Error adding comment - \(error.localizedDescription)")
//                        }
//                    }
//                }
//                for review in reviews {
//                    Amplify.DataStore.save(review) { reviewResult in
//                        switch reviewResult {
//                        case .success:
//                            print("review saved!")
//                        case .failure(let error):
//                            print("review Error adding comment - \(error.localizedDescription)")
//                        }
//                    }
//                }
//               case .failure(let error):
//                   print("Could not save item to DataStore: \(error)")
//            }
//        }
        
    }
    
    func createProcedure(procedure: Procedure) {
        Amplify.API.mutate(request: .create(procedure)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let procedure):
                    print("Successfully created procedure: \(procedure)")
                    
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    func save() {
        createRecipe(recipe: recipe)
    }
}
