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
        favNum: 0,
        create_at: "",
        update_at: "",
        delFlg: 0
    )
    
    func createRecipe(
        header: Data,
        procedureImages: [UIImage?],
        group: DispatchGroup
    ) {
        let uuid = UUID().uuidString
        
        let amplify_recipe = Recipe(
            id: uuid,
            user: recipe.userId,
            type: "Recipe",
            title: recipe.title,
            calorie: Int(recipe.calorie) ?? 0,
            protein: Double(recipe.protein) ?? 0.0,
            fat: Double(recipe.fat) ?? 0.0,
            carbo: Double(recipe.carbo) ?? 0.0,
            state: recipe.state,
            materials: recipe.materials,
            favNum: 0,
            reviewNum: 0,
            delFlg: 0
        )
        
        let subgroup = DispatchGroup()
        var procedures: [Procedure] = []
        
        (0..<recipe.contents.count).forEach { index in
            if procedureImages[index] != nil {
                recipe.contents[index].image = "procedures/\(UUID().uuidString).jpg"
            }
            procedures.append(
                Procedure(
                    order: recipe.contents[index].order,
                    content: recipe.contents[index].content,
                    image: recipe.contents[index].image!,
                    recipe: amplify_recipe
                )
            )
        }
        
        print("upload recipe")
        print(recipe)
        
        Amplify.API.mutate(request: .create(amplify_recipe)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let recipe):
                    print("Successfully created recipe: \(recipe)")
                    subgroup.enter()
                    self.recipeImageUpload(id: recipe.id, imageData: header, group: subgroup)
                    procedures.forEach{ p in
                        subgroup.enter()
                        self.createProcedure(procedure: p, procedureImage: procedureImages[p.order-1], group: subgroup)
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
    
    func createProcedure(procedure: Procedure, procedureImage:UIImage?, group: DispatchGroup) {
        Amplify.API.mutate(request: .create(procedure)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let procedure):
                    print("Successfully created procedure: \(procedure)")
                    if let procedureImage = procedureImage {
                        guard let imageData = procedureImage.jpegData(compressionQuality: 0.5) else {
                            return
                        }
                        self.procedureImageUpload(key: procedure.image!, imageData: imageData, group:group)
                    } else {
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
    
    func recipeImageUpload(id: String, imageData: Data, group: DispatchGroup) {
        let key = "recipes/\(id).jpg"
        Amplify.Storage.uploadData(key: key, data: imageData) { result in
            switch result {
            case .success:
                print("upload image success")
                group.leave()
            case .failure(let error):
                print("upload data error \(error)")
                group.leave()
            }
        }
    }
    
    func procedureImageUpload(key: String, imageData: Data, group: DispatchGroup) {
        Amplify.Storage.uploadData(key: key, data: imageData) { result in
            switch result {
            case .success:
                print("upload image success")
                group.leave()
            case .failure(let error):
                print("upload data error \(error)")
                group.leave()
            }
        }
    }
}
