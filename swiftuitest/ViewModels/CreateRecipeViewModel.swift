//
//  RecipeViewModel.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/08/01.
//

import SwiftUI
import Amplify

class CreateRecipeViewModel: ObservableObject {
    @Published var error = false
    @Published var title = "" {
        didSet {
            if title.count > 30 && oldValue.count <= 30 {
                title = oldValue
                error = true
            } else {
                error = false
            }
        }
    }
    
    @Published var recipe = RecipeData(
        userId: UserDefaults.standard.string(forKey: "sub") ?? "",
        title: "",
        calorie: "",
        protein: "",
        fat: "",
        carbo: "",
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
    
    func createRecipe(
        id: String,
        recipe: RecipeData,
        group: DispatchGroup
    ) {
        let amplify_recipe = Recipe(
            id: id,
            user: recipe.userId,
            type: "Recipe",
            title: title,
            calorie: Int(recipe.calorie) ?? 0,
            protein: Double(recipe.protein) ?? 0.0,
            fat: Double(recipe.fat) ?? 0.0,
            carbo: Double(recipe.carbo) ?? 0.0,
            state: recipe.state,
            materials: recipe.materials,
            image: recipe.image,
            favNum: 0,
            delFlg: 0
        )
        
        let subgroup = DispatchGroup()
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
                        subgroup.enter()
                        self.createProcedure(procedure: p, group: subgroup)
                    }
                    subgroup.notify(queue: .main) {
                        print("subgroup end")
                        group.leave()
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    group.leave()
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                group.leave()
            }
        }
        
    }
    
    func createProcedure(procedure: Procedure, group: DispatchGroup) {
        Amplify.API.mutate(request: .create(procedure)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let procedure):
                    print("Successfully created procedure: \(procedure)")
                    group.leave()
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    group.leave()
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                group.leave()
            }
        }
    }
}
